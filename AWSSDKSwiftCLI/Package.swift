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
    ],
    targets: [
        .executableTarget(
            name: "AWSSDKSwiftCLI",
            dependencies: [
                .product(name: "ArgumentParser", package: "swift-argument-parser"),
                .product(name: "PackageDescription", package: "swift-package-manager"),
                .product(name: "Algorithms", package: "swift-algorithms"),
            ],
            resources: [
                .process("Resources/BasePackageManifest.swift")
            ],
            swiftSettings: [
                .unsafeFlags(["-package-description-version", "5.5"])
            ]
        ),
        .testTarget(
            name: "AWSSDKSwiftCLITests",
            dependencies: ["AWSSDKSwiftCLI"]),
    ]
)
