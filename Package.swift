// swift-tools-version: 5.9
import PackageDescription

let package = Package(
  name: "daro-ios-binary",
  platforms: [
    .iOS(.v15)
  ],
  products: [
    .library(
      name: "DaroPackage",
      targets: ["DaroPackage"]
    )
  ],
  targets: [
    .binaryTarget(
      name: "AppLovinAdapter",
      url: "https://github.com/JongHyunLee84/daro-ios-binary/releases/download/1.1.50/AppLovinAdapter.xcframework.zip",
      checksum: "51b247509010e0544d4d4396dbc8fb4250e7be1eadfdbfa404b1c158a57183bc"
    ),
    .binaryTarget(
      name: "AppLovinSDK",
      url: "https://github.com/JongHyunLee84/daro-ios-binary/releases/download/1.1.50/AppLovinSDK.xcframework.zip",
      checksum: "fc9725cc2b990f607aa328f750632eeeab7e4d68025de1c9bdde7deafe17c498"
    ),
    .binaryTarget(
      name: "ChartboostAdapter",
      url: "https://github.com/JongHyunLee84/daro-ios-binary/releases/download/1.1.50/ChartboostAdapter.xcframework.zip",
      checksum: "a3d8f0ed275b9a593601ca2af0f032cddd5e4647ca51985630aa6e3bdc188016"
    ),
    .binaryTarget(
      name: "ChartboostSDK",
      url: "https://github.com/JongHyunLee84/daro-ios-binary/releases/download/1.1.50/ChartboostSDK.xcframework.zip",
      checksum: "1a70f18695da279a1a9d0aa66f532a9d872298d9b32f93abe1b45e65646f7070"
    ),
    .binaryTarget(
      name: "DTBiOSSDK",
      url: "https://github.com/JongHyunLee84/daro-ios-binary/releases/download/1.1.50/DTBiOSSDK.xcframework.zip",
      checksum: "abe8c9e027e723448bc05a410347518991e4caef38921d110936a48feb0c389c"
    ),
    .binaryTarget(
      name: "DTExchangeAdapter",
      url: "https://github.com/JongHyunLee84/daro-ios-binary/releases/download/1.1.50/DTExchangeAdapter.xcframework.zip",
      checksum: "a03dac08e3a8844d543835cfd059cced39a75bec5f81c4ab244ccecf25cc8e48"
    ),
    .binaryTarget(
      name: "Daro",
      url: "https://github.com/JongHyunLee84/daro-ios-binary/releases/download/1.1.50/Daro.xcframework.zip",
      checksum: "197123067cf438b22c3f69878ea7299426dfe673b96b1c890dad9d271d306a2c"
    ),
    .binaryTarget(
      name: "FBAudienceNetwork",
      url: "https://github.com/JongHyunLee84/daro-ios-binary/releases/download/1.1.50/FBAudienceNetwork.xcframework.zip",
      checksum: "95bc16919eab21f67823160b37a2a473a2783e61c012096744c1de9355a8f110"
    ),
    .binaryTarget(
      name: "FiveAd",
      url: "https://github.com/JongHyunLee84/daro-ios-binary/releases/download/1.1.50/FiveAd.xcframework.zip",
      checksum: "7e2a1f51ff065c94c7f0d39a4a320cec2dda173075fe7a412a8c0263cafe8120"
    ),
    .binaryTarget(
      name: "GoogleMobileAds",
      url: "https://github.com/JongHyunLee84/daro-ios-binary/releases/download/1.1.50/GoogleMobileAds.xcframework.zip",
      checksum: "47970179c7f7e9b6f02da42c7a30207aac44b64b157e1421280b4099ddcebe4d"
    ),
    .binaryTarget(
      name: "IASDKCore",
      url: "https://github.com/JongHyunLee84/daro-ios-binary/releases/download/1.1.50/IASDKCore.xcframework.zip",
      checksum: "81b3186c3ef142f6d9e7cf5510008eccc86c45dbb29dee400f23555c88677256"
    ),
    .binaryTarget(
      name: "InMobiAdapter",
      url: "https://github.com/JongHyunLee84/daro-ios-binary/releases/download/1.1.50/InMobiAdapter.xcframework.zip",
      checksum: "d57321c71d25af1a79df609564191f5e5bca5df61b890d34232fb9d9576b75f3"
    ),
    .binaryTarget(
      name: "InMobiSDK",
      url: "https://github.com/JongHyunLee84/daro-ios-binary/releases/download/1.1.50/InMobiSDK.xcframework.zip",
      checksum: "c0952cc51383c8c8de8ef695d2cbfce66e24e9868a7edccaeec3b9cdd75e1f33"
    ),
    .binaryTarget(
      name: "IronSource",
      url: "https://github.com/JongHyunLee84/daro-ios-binary/releases/download/1.1.50/IronSource.xcframework.zip",
      checksum: "edd20acea853451c5b573fa475b7ce0f1b1b5790442ff4ebc28a6328b2c7a1e5"
    ),
    .binaryTarget(
      name: "IronSourceAdQualitySDK",
      url: "https://github.com/JongHyunLee84/daro-ios-binary/releases/download/1.1.50/IronSourceAdQualitySDK.xcframework.zip",
      checksum: "97c524b064aa4cc659eee7bdb8be6d478e1d0d601769f6e75e29dd14be1ddbe8"
    ),
    .binaryTarget(
      name: "IronSourceAdapter",
      url: "https://github.com/JongHyunLee84/daro-ios-binary/releases/download/1.1.50/IronSourceAdapter.xcframework.zip",
      checksum: "812deea4a453a4d402a455fd93ee97d064c0e65fc67db1ed51ca18153ff47493"
    ),
    .binaryTarget(
      name: "LiftoffMonetizeAdapter",
      url: "https://github.com/JongHyunLee84/daro-ios-binary/releases/download/1.1.50/LiftoffMonetizeAdapter.xcframework.zip",
      checksum: "6540dc877e1c2e26e888b69357942c24760ae3098a305d6ae2c2351aed2eeb18"
    ),
    .binaryTarget(
      name: "LineAdapter",
      url: "https://github.com/JongHyunLee84/daro-ios-binary/releases/download/1.1.50/LineAdapter.xcframework.zip",
      checksum: "7cfe8f8e3c722e269f0417aa83495d204748b43a5418d1235a6891ef6ee91f08"
    ),
    .binaryTarget(
      name: "MTGSDK",
      url: "https://github.com/JongHyunLee84/daro-ios-binary/releases/download/1.1.50/MTGSDK.xcframework.zip",
      checksum: "745c51d72c7ad4a2384783d9017aeba948bbdb915d1c20253fb0dfe92744cebf"
    ),
    .binaryTarget(
      name: "MTGSDKBanner",
      url: "https://github.com/JongHyunLee84/daro-ios-binary/releases/download/1.1.50/MTGSDKBanner.xcframework.zip",
      checksum: "dd19129b4b13cedcdaa57fbd7c16abeb24ef4fc11d2ce262045a4ce6aab3a653"
    ),
    .binaryTarget(
      name: "MTGSDKBidding",
      url: "https://github.com/JongHyunLee84/daro-ios-binary/releases/download/1.1.50/MTGSDKBidding.xcframework.zip",
      checksum: "bbaa3751a983f4559a0ad327b1e08108e72cd0eba50d952c36d60610f1e7d8fd"
    ),
    .binaryTarget(
      name: "MTGSDKInterstitialVideo",
      url: "https://github.com/JongHyunLee84/daro-ios-binary/releases/download/1.1.50/MTGSDKInterstitialVideo.xcframework.zip",
      checksum: "96631a8e2d44fb09bc0f10a3067e6c20021882ca4577a76e2b63526de0a5971d"
    ),
    .binaryTarget(
      name: "MTGSDKNativeAdvanced",
      url: "https://github.com/JongHyunLee84/daro-ios-binary/releases/download/1.1.50/MTGSDKNativeAdvanced.xcframework.zip",
      checksum: "3db2d9fc6a599aee8da363a6d14ec10954c51c5d672189ff37c279542f012489"
    ),
    .binaryTarget(
      name: "MTGSDKNewInterstitial",
      url: "https://github.com/JongHyunLee84/daro-ios-binary/releases/download/1.1.50/MTGSDKNewInterstitial.xcframework.zip",
      checksum: "ea9f34dad170598a5c1df9573b14007f7a1ca538233a9fe89889a7a237be764b"
    ),
    .binaryTarget(
      name: "MTGSDKReward",
      url: "https://github.com/JongHyunLee84/daro-ios-binary/releases/download/1.1.50/MTGSDKReward.xcframework.zip",
      checksum: "376e6371c1888da8d9dbbfa85a8626193b3eef74c1595b73a5d8b85bb21a027c"
    ),
    .binaryTarget(
      name: "MTGSDKSplash",
      url: "https://github.com/JongHyunLee84/daro-ios-binary/releases/download/1.1.50/MTGSDKSplash.xcframework.zip",
      checksum: "7e5771f7df443265cf63fb21187a8e6dd1958397daa203cb190ca11d0326ea0e"
    ),
    .binaryTarget(
      name: "MetaAdapter",
      url: "https://github.com/JongHyunLee84/daro-ios-binary/releases/download/1.1.50/MetaAdapter.xcframework.zip",
      checksum: "c2ef78904c5a77ef718f85c8e2f23df6068b7b06b2246bde07bf50f8e4b1ab07"
    ),
    .binaryTarget(
      name: "MintegralAdapter",
      url: "https://github.com/JongHyunLee84/daro-ios-binary/releases/download/1.1.50/MintegralAdapter.xcframework.zip",
      checksum: "3c79c03b1113c73baa6441c951c52a1349ff208b969dcbc49a4f5a758a697a37"
    ),
    .binaryTarget(
      name: "MolocoAdapter",
      url: "https://github.com/JongHyunLee84/daro-ios-binary/releases/download/1.1.50/MolocoAdapter.xcframework.zip",
      checksum: "d7a3cefa013c04c9f25e4ef1b18f9eea2d9c8f3b178cdc7541e2c0e9dd85824e"
    ),
    .binaryTarget(
      name: "MolocoSDK",
      url: "https://github.com/JongHyunLee84/daro-ios-binary/releases/download/1.1.50/MolocoSDK.xcframework.zip",
      checksum: "53c8293e0012698ef8f0455a40e2cb522a02bdd4813de33e886c2557b96e2cb4"
    ),
    .binaryTarget(
      name: "PAGAdSDK",
      url: "https://github.com/JongHyunLee84/daro-ios-binary/releases/download/1.1.50/PAGAdSDK.xcframework.zip",
      checksum: "a25d22f9a9d931d5228115e8717dd745b16caf86a6831228c9a0d63aedd447e8"
    ),
    .binaryTarget(
      name: "PangleAdapter",
      url: "https://github.com/JongHyunLee84/daro-ios-binary/releases/download/1.1.50/PangleAdapter.xcframework.zip",
      checksum: "782c6428b775a01d6200c3ce4ac91322f8a2df21f7721264c325de529634115e"
    ),
    .binaryTarget(
      name: "UnityAdapter",
      url: "https://github.com/JongHyunLee84/daro-ios-binary/releases/download/1.1.50/UnityAdapter.xcframework.zip",
      checksum: "e003d9e5240b14c272df52046e0a60ab660f3bbebb32be52f4a513431c6e5e14"
    ),
    .binaryTarget(
      name: "UnityAds",
      url: "https://github.com/JongHyunLee84/daro-ios-binary/releases/download/1.1.50/UnityAds.xcframework.zip",
      checksum: "d2498d1f64dc79d719f5c2177b5f7b2e32892fa00a653fe9c52e2fd2363583e4"
    ),
    .binaryTarget(
      name: "UserMessagingPlatform",
      url: "https://github.com/JongHyunLee84/daro-ios-binary/releases/download/1.1.50/UserMessagingPlatform.xcframework.zip",
      checksum: "bf37c6a023f076a1c2b788d99556122b5f7d507cff3564da93fba5b6d71be8f0"
    ),
    .binaryTarget(
      name: "VungleAdsSDK",
      url: "https://github.com/JongHyunLee84/daro-ios-binary/releases/download/1.1.50/VungleAdsSDK.xcframework.zip",
      checksum: "4c2e44f8240d4fdca1f3940ec285085e6a9b05b59552ae2cf67a17e01dd87949"
    ),
    .target(
      name: "DaroPackage",
      dependencies: [
        "AppLovinAdapter",
        "AppLovinSDK",
        "ChartboostAdapter",
        "ChartboostSDK",
        "DTBiOSSDK",
        "DTExchangeAdapter",
        "Daro",
        "FBAudienceNetwork",
        "FiveAd",
        "GoogleMobileAds",
        "IASDKCore",
        "InMobiAdapter",
        "InMobiSDK",
        "IronSource",
        "IronSourceAdQualitySDK",
        "IronSourceAdapter",
        "LiftoffMonetizeAdapter",
        "LineAdapter",
        "MTGSDK",
        "MTGSDKBanner",
        "MTGSDKBidding",
        "MTGSDKInterstitialVideo",
        "MTGSDKNativeAdvanced",
        "MTGSDKNewInterstitial",
        "MTGSDKReward",
        "MTGSDKSplash",
        "MetaAdapter",
        "MintegralAdapter",
        "MolocoAdapter",
        "MolocoSDK",
        "PAGAdSDK",
        "PangleAdapter",
        "UnityAdapter",
        "UnityAds",
        "UserMessagingPlatform",
        "VungleAdsSDK"
      ],
      path: "Sources/DaroPackage",
      resources: [
        .copy("Resources/Bundles")
      ],
      linkerSettings: [
      .linkedFramework("AVFAudio"),
      .linkedFramework("AVFoundation"),
      .linkedFramework("AVKit"),
      .linkedFramework("Accelerate"),
      .linkedFramework("AppTrackingTransparency"),
      .linkedFramework("AudioToolbox"),
      .linkedFramework("CFNetwork"),
      .linkedFramework("CoreFoundation"),
      .linkedFramework("CoreGraphics"),
      .linkedFramework("CoreHaptics"),
      .linkedFramework("CoreImage"),
      .linkedFramework("CoreLocation"),
      .linkedFramework("CoreMedia"),
      .linkedFramework("CoreMotion"),
      .linkedFramework("CoreTelephony"),
      .linkedFramework("CoreVideo"),
      .linkedFramework("MediaPlayer"),
      .linkedFramework("MessageUI"),
      .linkedFramework("Network"),
      .linkedFramework("QuartzCore"),
      .linkedFramework("SafariServices"),
      .linkedFramework("Security"),
      .linkedFramework("StoreKit"),
      .linkedFramework("SystemConfiguration"),
      .linkedFramework("WebKit"),
      .linkedLibrary("bz2"),
      .linkedLibrary("c++"),
      .linkedLibrary("c++abi"),
      .linkedLibrary("iconv"),
      .linkedLibrary("resolv"),
      .linkedLibrary("sqlite3"),
      .linkedLibrary("xml2"),
      .linkedLibrary("z"),
        .unsafeFlags(["-ObjC", "-weak_framework", "Combine", "-weak_framework", "CoreML", "-weak_framework", "CryptoKit", "-weak_framework", "DeviceCheck", "-weak_framework", "LocalAuthentication", "-weak_framework", "VideoToolbox"])
      ]
    )
  ]
)
