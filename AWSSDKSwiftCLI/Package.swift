// swift-tools-version: 5.9

import PackageDescription

let package = Package(
    name: "AWSSDKSwiftCLI",
    platforms: [
        .macOS(.v13)
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-argument-parser", from: "1.2.0"),
        .package(url: "https://github.com/apple/swift-package-manager", from: "0.6.0"),
        .package(url: "https://github.com/apple/swift-algorithms", from: "1.0.0"),
        .package(url: "https://github.com/apple/swift-log.git", from: "1.0.0"),
        .package(url: "https://github.com/awslabs/aws-sdk-swift", from: "0.46.0"),
    ],
    targets: [
        .executableTarget(
            name: "AWSSDKSwiftCLI",
            dependencies: [
                "AWSCLIUtils",
                .product(name: "ArgumentParser", package: "swift-argument-parser"),
                .product(name: "Algorithms", package: "swift-algorithms"),
            ],
            resources: [
                .process("Resources/Package.Base.swift"),
                .process("Resources/DocIndex.Base.md")
            ]
        ),
        .executableTarget(
            name: "spr-publish",
            dependencies: [
                "SPR",
                "AWSCLIUtils",
                .product(name: "ArgumentParser", package: "swift-argument-parser"),
            ]
        ),
        .executableTarget(
            name: "spr-multi-publish",
            dependencies: [
                "SPR",
                "AWSCLIUtils",
                "spr-publish",
            ]
        ),
        .target(
            name: "SPR",
            dependencies: [
                "AWSCLIUtils",
                .product(name: "ArgumentParser", package: "swift-argument-parser"),
                .product(name: "AWSS3", package: "aws-sdk-swift"),
                .product(name: "AWSCloudFront", package: "aws-sdk-swift"),
            ]
        ),
        .target(
            name: "AWSCLIUtils",
            dependencies: [
                .product(name: "ArgumentParser", package: "swift-argument-parser"),
                .product(name: "Logging", package: "swift-log"),
                .product(name: "PackageDescription", package: "swift-package-manager"),
            ]
        ),
        .testTarget(
            name: "AWSSDKSwiftCLITests",
            dependencies: ["AWSSDKSwiftCLI"]
        )
    ]
)
