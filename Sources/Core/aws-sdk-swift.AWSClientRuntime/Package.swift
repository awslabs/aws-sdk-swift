// swift-tools-version: 5.9

import PackageDescription

let sdkVersion: Version = "0.0.12"
let smithySwiftVersion: Version = "0.100.0"
let crtVersion: Version = "0.32.0"

let package = Package(
    name: "AWSClientRuntime",
    platforms: [
        .macOS(.v10_15),
        .iOS(.v13),
        .tvOS(.v13),
        .watchOS(.v6)
    ],
    products: [
        .library(name: "AWSClientRuntime", targets: ["AWSClientRuntime"]),
    ],
    dependencies: [
        .package(id: "aws-sdk-swift.AWSSDKCommon", exact: sdkVersion),
        .package(id: "aws-sdk-swift.AWSSDKHTTPAuth", exact: sdkVersion),
        .package(id: "aws-sdk-swift.AWSSDKIdentity", exact: sdkVersion),
        .package(url: "https://github.com/awslabs/aws-crt-swift", exact: crtVersion),
        .package(url: "https://github.com/jbelkins/smithy-swift", exact: smithySwiftVersion),
    ],
    targets: [
        .target(
            name: "AWSClientRuntime",
            dependencies: [
                .product(name: "AwsCommonRuntimeKit", package: "aws-crt-swift"),
                .product(name: "ClientRuntime", package: "smithy-swift"),
                .product(name: "SmithyRetriesAPI", package: "smithy-swift"),
                .product(name: "SmithyRetries", package: "smithy-swift"),
                .product(name: "SmithyEventStreamsAPI", package: "smithy-swift"),
                .product(name: "SmithyEventStreamsAuthAPI", package: "smithy-swift"),
                .product(name: "AWSSDKCommon", package: "aws-sdk-swift.AWSSDKCommon"),
                .product(name: "AWSSDKHTTPAuth", package: "aws-sdk-swift.AWSSDKHTTPAuth"),
                .product(name: "AWSSDKIdentity", package: "aws-sdk-swift.AWSSDKIdentity"),
            ],
            resources: [.process("Resources")]
        ),
        .testTarget(
            name: "AWSClientRuntimeTests",
            dependencies: [
                "AWSClientRuntime",
                .product(name: "ClientRuntime", package: "smithy-swift"),
                .product(name: "SmithyTestUtil", package: "smithy-swift"),
                .product(name: "AWSSDKCommon", package: "aws-sdk-swift.AWSSDKCommon"),
            ],
            resources: [.process("Resources")]
        ),
    ]
)
