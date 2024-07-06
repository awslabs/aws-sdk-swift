// swift-tools-version: 5.9

import PackageDescription

let sdkVersion: Version = "0.0.14"
let smithySwiftVersion: Version = "0.100.0"
let crtVersion: Version = "0.32.0"

let package = Package(
    name: "AWSSDKCommon",
    platforms: [
        .macOS(.v10_15),
        .iOS(.v13),
        .tvOS(.v13),
        .watchOS(.v6)
    ],
    products: [
        .library(name: "AWSSDKCommon", targets: ["AWSSDKCommon"]),
    ],
    dependencies: [
        .package(url: "https://github.com/awslabs/aws-crt-swift", exact: crtVersion),
    ],
    targets: [
        .target(
            name: "AWSSDKCommon",
            dependencies: [
                .product(name: "AwsCommonRuntimeKit", package: "aws-crt-swift"),
            ]
        ),
    ]
)
