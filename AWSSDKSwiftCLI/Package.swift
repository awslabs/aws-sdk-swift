// swift-tools-version: 5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "AWSSDKSwiftCLI",
    platforms: [
        .macOS(.v10_15)
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-argument-parser", from: "1.2.0"),
        .package(url: "https://github.com/apple/swift-package-manager", from: "0.6.0"),
        .package(url: "https://github.com/apple/swift-algorithms", from: "1.0.0"),
        .package(url: "https://github.com/apple/swift-log.git", from: "1.0.0"),
    ],
    targets: [
        .executableTarget(
            name: "AWSSDKSwiftCLI",
            dependencies: [
                .product(name: "ArgumentParser", package: "swift-argument-parser"),
                .product(name: "PackageDescription", package: "swift-package-manager"),
                .product(name: "Algorithms", package: "swift-algorithms"),
                .product(name: "Logging", package: "swift-log"),
            ],
            resources: [
                .process("Resources/Package.Base.swift"),
                .process("Resources/DocIndex.Base.md")
            ],
            swiftSettings: [
                .unsafeFlags(["-package-description-version", "5.7"])
            ]
        ),
        .testTarget(
            name: "AWSSDKSwiftCLITests",
            dependencies: ["AWSSDKSwiftCLI"]
        )
    ]
)
