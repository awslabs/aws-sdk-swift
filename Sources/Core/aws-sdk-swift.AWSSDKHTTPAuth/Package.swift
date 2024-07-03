// swift-tools-version: 5.9

import PackageDescription

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
        .package(id: "aws-sdk-swift.AWSSDKIdentity", from: "0.0.1"),
        .package(id: "aws-sdk-swift.AWSSDKChecksums", from: "0.0.1"),
        .package(url: "https://github.com/awslabs/aws-crt-swift", exact: "0.32.0"),
        .package(url: "https://github.com/smithy-lang/smithy-swift", exact: "0.51.0"),
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
