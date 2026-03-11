# daro-ios-binary

`heart-ios`에서 사용하는 Daro iOS 바이너리 번들을 버전별로 관리하는 전용 레포지토리입니다.

## 목적

- `heart-ios`에서 CocoaPods 없이 Daro 광고 스택을 공급하기 위한 원본 저장소
- 버전별 binary bundle, checksum, manifest 관리
- 앱 레포와 분리된 릴리스/롤백 기준점 제공

## 기본 구조

- `artifacts/`
  - 업로드 전 압축 파일이나 임시 산출물 보관용
- `dist/`
  - `heart-ios`에 그대로 vendoring 가능한 최종 산출물
- `manifests/`
  - 버전별 bundle 메타데이터 저장
- `scripts/`
  - 배포/검증 스크립트 위치

## 운영 원칙

- 앱 레포는 이 레포의 `dist/` 또는 release asset만 참조합니다.
- `Daro.xcframework` 단품이 아니라, 앱에서 실제로 필요한 전체 Daro 번들을 하나의 배포 단위로 관리합니다.
- 버전은 tag/release 기준으로 고정합니다.

## 로컬 패키징

`heart-ios` checkout에 기존 Pods가 준비된 상태라면 아래 스크립트로 로컬 dist를 생성할 수 있습니다.

```bash
./scripts/package_from_heart_ios_checkout.sh /path/to/heart-ios
```

생성 결과:

- `dist/XCFrameworks`
- `dist/Bundles`
- `dist/manifest.json`
- `artifacts/DaroBundle-<version>.zip`
