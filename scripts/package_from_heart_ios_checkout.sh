#!/usr/bin/env bash

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"

HEART_IOS_ROOT="${1:-${HEART_IOS_ROOT:-$REPO_ROOT/../heart-ios}}"
VERSION="${DARO_VERSION:-1.1.51}"
DIST_DIR="$REPO_ROOT/dist"
ARTIFACTS_DIR="$REPO_ROOT/artifacts"
BUILD_DIR="$HEART_IOS_ROOT/build/Debug-iphoneos"

XCFRAMEWORK_PATHS=(
  "Pods/Ads-Global/SDK/PAGAdSDK.xcframework"
  "Pods/AmazonPublisherServicesSDK/APS_iOS_SDK-5.3.0/DTBiOSSDK.xcframework"
  "Pods/AppLovinSDK/applovin-ios-sdk-13.4.0/AppLovinSDK.xcframework"
  "Pods/ChartboostSDK/ChartboostSDK.xcframework"
  "Pods/DaroAds/Daro.xcframework"
  "Pods/FBAudienceNetwork/Static/FBAudienceNetwork.xcframework"
  "Pods/FiveAd/FiveAd.xcframework"
  "Pods/Fyber_Marketplace_SDK/IASDKCore/IASDKCore.xcframework"
  "Pods/Google-Mobile-Ads-SDK/Frameworks/GoogleMobileAdsFramework/GoogleMobileAds.xcframework"
  "Pods/GoogleMobileAdsMediationAppLovin/AppLovinAdapter-13.4.0.0/AppLovinAdapter.xcframework"
  "Pods/GoogleMobileAdsMediationChartboost/ChartboostAdapter-9.9.2.0/ChartboostAdapter.xcframework"
  "Pods/GoogleMobileAdsMediationFacebook/MetaAdapter-6.20.1.0/MetaAdapter.xcframework"
  "Pods/GoogleMobileAdsMediationFyber/DTExchangeAdapter-8.4.1.0/DTExchangeAdapter.xcframework"
  "Pods/GoogleMobileAdsMediationInMobi/InMobiAdapter-10.8.6.0/InMobiAdapter.xcframework"
  "Pods/GoogleMobileAdsMediationIronSource/IronSourceAdapter-8.11.0.0.0/IronSourceAdapter.xcframework"
  "Pods/GoogleMobileAdsMediationLine/LineAdapter-2.9.20250912.0/LineAdapter.xcframework"
  "Pods/GoogleMobileAdsMediationMintegral/MintegralAdapter-7.7.9.0/MintegralAdapter.xcframework"
  "Pods/GoogleMobileAdsMediationMoloco/MolocoAdapter-3.12.1.0/MolocoAdapter.xcframework"
  "Pods/GoogleMobileAdsMediationPangle/PangleAdapter-7.6.0.6.0/PangleAdapter.xcframework"
  "Pods/GoogleMobileAdsMediationUnity/UnityAdapter-4.16.1.0/UnityAdapter.xcframework"
  "Pods/GoogleMobileAdsMediationVungle/LiftoffMonetizeAdapter-7.5.3.0/LiftoffMonetizeAdapter.xcframework"
  "Pods/GoogleUserMessagingPlatform/Frameworks/Release/UserMessagingPlatform.xcframework"
  "Pods/InMobiSDK/InMobiSDK.xcframework"
  "Pods/IronSourceAdQualitySDK/IronSourceAdQualitySDK.xcframework"
  "Pods/IronSourceSDK/IronSource/IronSource.xcframework"
  "Pods/MintegralAdSDK/Fmk/MTGSDK.xcframework"
  "Pods/MintegralAdSDK/Fmk/MTGSDKBanner.xcframework"
  "Pods/MintegralAdSDK/Fmk/MTGSDKBidding.xcframework"
  "Pods/MintegralAdSDK/Fmk/MTGSDKInterstitialVideo.xcframework"
  "Pods/MintegralAdSDK/Fmk/MTGSDKNativeAdvanced.xcframework"
  "Pods/MintegralAdSDK/Fmk/MTGSDKNewInterstitial.xcframework"
  "Pods/MintegralAdSDK/Fmk/MTGSDKReward.xcframework"
  "Pods/MintegralAdSDK/Fmk/MTGSDKSplash.xcframework"
  "Pods/MolocoSDKiOS/MolocoSDK.xcframework"
  "Pods/UnityAds/UnityAds.xcframework"
  "Pods/VungleAds/static/VungleAdsSDK.xcframework"
)

SOURCE_BUNDLES=(
  "Pods/Ads-Global/SDK/PAGAdSDK.bundle"
)

BUILD_BUNDLES=(
  "Ads-Global/AdsGlobalSDK.bundle"
  "DaroAds/DaroAdsResources.bundle"
  "FBAudienceNetwork/FBAudienceNetwork.bundle"
  "FiveAd/FiveAd_resources.bundle"
  "Fyber_Marketplace_SDK/Fyber_Marketplace_SDK.bundle"
  "Google-Mobile-Ads-SDK/GoogleMobileAdsResources.bundle"
  "GoogleUserMessagingPlatform/UserMessagingPlatformResources.bundle"
  "IronSourceAdQualitySDK/IronSourceAdQualityPrivacyInfo.bundle"
  "IronSourceSDK/IronSourcePrivacyInfo.bundle"
  "MintegralAdSDK/MTGSDK.bundle"
  "MolocoSDKiOS/MolocoSDK.bundle"
  "UnityAds/UnityAdsResources.bundle"
  "VungleAds/VungleAds.bundle"
)

if [[ ! -d "$HEART_IOS_ROOT/Pods" ]]; then
  echo "Pods directory not found at $HEART_IOS_ROOT/Pods" >&2
  exit 1
fi

echo "Building Pods-customer resources from $HEART_IOS_ROOT"
xcodebuild \
  -project "$HEART_IOS_ROOT/Pods/Pods.xcodeproj" \
  -scheme Pods-customer \
  -configuration Debug \
  -sdk iphoneos \
  CODE_SIGNING_ALLOWED=NO \
  build >/tmp/daro-package-build.log

rm -rf "$DIST_DIR"
mkdir -p "$DIST_DIR/XCFrameworks" "$DIST_DIR/Bundles" "$ARTIFACTS_DIR"

for relative_path in "${XCFRAMEWORK_PATHS[@]}"; do
  source_path="$HEART_IOS_ROOT/$relative_path"
  if [[ ! -d "$source_path" ]]; then
    echo "Missing xcframework: $source_path" >&2
    exit 1
  fi
  rsync -a "$source_path" "$DIST_DIR/XCFrameworks/"
done

for relative_path in "${SOURCE_BUNDLES[@]}"; do
  source_path="$HEART_IOS_ROOT/$relative_path"
  if [[ ! -d "$source_path" ]]; then
    echo "Missing source bundle: $source_path" >&2
    exit 1
  fi
  rsync -a "$source_path" "$DIST_DIR/Bundles/"
done

for relative_path in "${BUILD_BUNDLES[@]}"; do
  source_path="$BUILD_DIR/$relative_path"
  if [[ ! -d "$source_path" ]]; then
    echo "Missing built bundle: $source_path" >&2
    exit 1
  fi
  rsync -a "$source_path" "$DIST_DIR/Bundles/"
done

python3 "$SCRIPT_DIR/generate_metadata.py" "$REPO_ROOT" "$DIST_DIR" "$VERSION"

rm -f "$ARTIFACTS_DIR/DaroBundle-$VERSION.zip"
ditto -c -k --sequesterRsrc --keepParent "$DIST_DIR" "$ARTIFACTS_DIR/DaroBundle-$VERSION.zip"

echo "Created Daro bundle:"
echo "  dist: $DIST_DIR"
echo "  zip:  $ARTIFACTS_DIR/DaroBundle-$VERSION.zip"
