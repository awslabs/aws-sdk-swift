// swift-tools-version: 5.9

import PackageDescription

let sdkVersion: Version = "0.15.1"
let smithySwiftVersion: Version = "0.54.0"
let crtVersion: Version = "0.32.0"

let package = Package(
    name: "AWSSDKHTTPAuth",
    platforms: [
        .macOS(.v10_15),
        .iOS(.v13),
        .tvOS(.v13),
        .watchOS(.v6)
    ],
    products: [
        .library(name: "AWSSDKHTTPAuth", targets: ["AWSSDKHTTPAuth"]),
    ],
    dependencies: [
        .package(id: "aws-sdk-swift.AWSSDKIdentity", exact: sdkVersion),
        .package(id: "aws-sdk-swift.AWSSDKChecksums", exact: sdkVersion),
        .package(url: "https://github.com/awslabs/aws-crt-swift", exact: crtVersion),
        .package(url: "https://github.com/jbelkins/smithy-swift", exact: smithySwiftVersion),
    ],
    targets: [
        .target(
            name: "AWSSDKHTTPAuth",
            dependencies: [
                .product(name: "AwsCommonRuntimeKit", package: "aws-crt-swift"),
                .product(name: "ClientRuntime", package: "smithy-swift"),
                .product(name: "Smithy", package: "smithy-swift"),
                .product(name: "SmithyHTTPAuth", package: "smithy-swift"),
                .product(name: "AWSSDKIdentity", package: "aws-sdk-swift.AWSSDKIdentity"),
                .product(name: "AWSSDKChecksums", package: "aws-sdk-swift.AWSSDKChecksums"),
            ]
        ),
        .testTarget(
            name: "AWSSDKHTTPAuthTests",
            dependencies: [
                "AWSSDKHTTPAuth",
                .product(name: "AwsCommonRuntimeKit", package: "aws-crt-swift"),
                .product(name: "ClientRuntime", package: "smithy-swift"),
                .product(name: "SmithyTestUtil", package: "smithy-swift"),
            ]
        ),
    ]
)
