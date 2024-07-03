// swift-tools-version: 5.9

import PackageDescription

let package = Package(
    name: "AWSSDKChecksums",
    platforms: [
        .macOS(.v10_15),
        .iOS(.v13),
        .tvOS(.v13),
        .watchOS(.v6)
    ],
    products: [
        .library(name: "AWSSDKChecksums", targets: ["AWSSDKChecksums"]),
    ],
    dependencies: [
        .package(id: "aws-sdk-swift.AWSSDKCommon", from: "0.0.1"),
        .package(url: "https://github.com/awslabs/aws-crt-swift", exact: "0.30.0"),
        .package(url: "https://github.com/smithy-lang/smithy-swift", exact: "0.51.0"),
    ],
    targets: [
        .target(
            name: "AWSSDKChecksums",
            dependencies: [
                .product(name: "AwsCommonRuntimeKit", package: "aws-crt-swift"),
                .product(name: "ClientRuntime", package: "smithy-swift"),
                .product(name: "Smithy", package: "smithy-swift"),
                .product(name: "SmithyHTTPAPI", package: "smithy-swift"),
                .product(name: "SmithyIdentityAPI", package: "smithy-swift"),
                .product(name: "SmithyIdentity", package: "smithy-swift"),
                .product(name: "AWSSDKCommon", package: "aws-sdk-swift.AWSSDKCommon"),
            ]
        ),
    ]
)
