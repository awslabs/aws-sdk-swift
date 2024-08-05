// swift-tools-version: 5.9

import PackageDescription

let sdkVersion: Version = "0.15.1"
let smithySwiftVersion: Version = "0.54.0"
let crtVersion: Version = "0.32.0"

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
        .package(id: "aws-sdk-swift.AWSSDKCommon", exact: sdkVersion),
        .package(url: "https://github.com/awslabs/aws-crt-swift", exact: crtVersion),
        .package(url: "https://github.com/awslabs/smithy-swift", exact: smithySwiftVersion),
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
