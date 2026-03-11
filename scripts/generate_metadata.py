#!/usr/bin/env python3

import json
import pathlib
import sys

SDK_FRAMEWORKS = [
    "AVFAudio",
    "AVFoundation",
    "AVKit",
    "Accelerate",
    "AppTrackingTransparency",
    "AudioToolbox",
    "CFNetwork",
    "CoreFoundation",
    "CoreGraphics",
    "CoreHaptics",
    "CoreImage",
    "CoreLocation",
    "CoreMedia",
    "CoreMotion",
    "CoreTelephony",
    "CoreVideo",
    "MediaPlayer",
    "MessageUI",
    "Network",
    "QuartzCore",
    "SafariServices",
    "Security",
    "StoreKit",
    "SystemConfiguration",
    "WebKit",
]

ADDITIONAL_FRAMEWORK_SEARCH_PATHS = [
    "$(SRCROOT)/Libraries/daro/XCFrameworks",
]

ADDITIONAL_RUNPATH_SEARCH_PATHS = [
    "/usr/lib/swift",
    "@executable_path/Frameworks",
    "@loader_path/Frameworks",
]

ADDITIONAL_OTHER_LDFLAGS = [
    "-lbz2",
    "-lc++abi",
    "-lresolv",
    "-lsqlite3",
    "-lxml2",
    "-lz",
    "-weak_framework",
    "Combine",
    "-weak_framework",
    "CoreML",
    "-weak_framework",
    "CryptoKit",
    "-weak_framework",
    "DeviceCheck",
    "-weak_framework",
    "LocalAuthentication",
    "-weak_framework",
    "VideoToolbox",
]


def swift_string_list(lines: list[str], indent: int = 4) -> str:
    prefix = " " * indent
    return "\n".join(f'{prefix}"{line}",' for line in lines)


def write_manifest(repo_root: pathlib.Path, dist_dir: pathlib.Path, version: str) -> dict:
    payload = {
        "version": version,
        "xcframeworks": sorted(path.name for path in (dist_dir / "XCFrameworks").glob("*.xcframework")),
        "bundles": sorted(path.name for path in (dist_dir / "Bundles").glob("*.bundle")),
        "sdkFrameworks": SDK_FRAMEWORKS,
        "additionalFrameworkSearchPaths": ADDITIONAL_FRAMEWORK_SEARCH_PATHS,
        "additionalRunpathSearchPaths": ADDITIONAL_RUNPATH_SEARCH_PATHS,
        "additionalOtherLdFlags": ADDITIONAL_OTHER_LDFLAGS,
    }

    manifest = json.dumps(payload, indent=2, ensure_ascii=True) + "\n"
    (dist_dir / "manifest.json").write_text(manifest)
    manifests_dir = repo_root / "manifests"
    manifests_dir.mkdir(parents=True, exist_ok=True)
    (manifests_dir / f"{version}.json").write_text(manifest)
    return payload


def write_generated_swift(dist_dir: pathlib.Path, payload: dict) -> None:
    swift = f"""import ProjectDescription

public enum DaroDependencies {{
  public static let version = "{payload["version"]}"

  public static let xcframeworkNames: [String] = [
{swift_string_list(payload["xcframeworks"])}
  ]

  public static let bundleNames: [String] = [
{swift_string_list(payload["bundles"])}
  ]

  public static let sdkFrameworkNames: [String] = [
{swift_string_list(payload["sdkFrameworks"])}
  ]

  public static let additionalFrameworkSearchPaths: [String] = [
{swift_string_list(payload["additionalFrameworkSearchPaths"])}
  ]

  public static let additionalRunpathSearchPaths: [String] = [
{swift_string_list(payload["additionalRunpathSearchPaths"])}
  ]

  public static let additionalOtherLdFlags: [String] = [
{swift_string_list(payload["additionalOtherLdFlags"])}
  ]
}}
"""
    (dist_dir / "DaroDependencies.generated.swift").write_text(swift)


def main() -> int:
    if len(sys.argv) != 4:
        print(
            "usage: generate_metadata.py <repo_root> <dist_dir> <version>",
            file=sys.stderr,
        )
        return 1

    repo_root = pathlib.Path(sys.argv[1]).resolve()
    dist_dir = pathlib.Path(sys.argv[2]).resolve()
    version = sys.argv[3]

    if not (dist_dir / "XCFrameworks").is_dir():
        print(f"missing XCFrameworks directory in {dist_dir}", file=sys.stderr)
        return 1
    if not (dist_dir / "Bundles").is_dir():
        print(f"missing Bundles directory in {dist_dir}", file=sys.stderr)
        return 1

    payload = write_manifest(repo_root, dist_dir, version)
    write_generated_swift(dist_dir, payload)
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
