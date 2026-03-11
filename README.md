# daro-ios-binary

Swift Package wrapper for the Daro iOS advertising stack.

- Version: `1.1.49`
- Package product: `DaroPackage`
- Release assets: `https://github.com/JongHyunLee84/daro-ios-binary/releases/download/1.1.50/<XCFRAMEWORK>.zip`
- Resource bundles copied into the package: 14

## Update flow

1. Run `scripts/package_from_heart_ios_checkout.sh` against a `heart-ios` checkout with Pods.
2. Run `scripts/build_release_assets.sh 1.1.49`.
3. Commit package metadata and bundles.
4. Create tag `1.1.50` and upload `artifacts/1.1.49/*.zip` as release assets.
