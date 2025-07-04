// swift-tools-version: 5.5

import PackageDescription

let package = Package(
    name: "IMDSIntegTestApp",
    platforms: [
        .macOS(.v12),
        .iOS(.v13)
    ],
    dependencies: [
        .package(url: "https://github.com/awslabs/aws-sdk-swift.git", branch: "main"),
        .package(url: "https://github.com/smithy-lang/smithy-swift.git", branch: "main"),
        .package(url: "https://github.com/apple/swift-argument-parser.git", from: "1.0.0"),
    ],
    targets: [
        .executableTarget(
            name: "IMDSIntegTestApp",
            dependencies: [
                .product(name: "ArgumentParser", package: "swift-argument-parser"),
                .product(name: "AWSSTS", package: "aws-sdk-swift"),
                .product(name: "AWSClientRuntime", package: "aws-sdk-swift"),
            ]
        )
    ]
)
