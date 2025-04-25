// swift-tools-version:6.0
import PackageDescription

let package = Package(
    name: "Swift6Compatibility",
    platforms: [
        .macOS(.v10_15),
        .iOS(.v13),
        .tvOS(.v13),
        .watchOS(.v6)
    ],
    dependencies: [
        .package(path: "../../smithy-swift"),
        .package(path: "../../aws-sdk-swift"),
    ],
    targets: [
        .target(
            name: "CompatibilityChecker",
            dependencies: [
                .product(name: "AWSClientRuntime", package: "aws-sdk-swift"),
                .product(name: "AWSS3", package: "aws-sdk-swift"),
                .product(name: "ClientRuntime", package: "smithy-swift"),
            ],
        )
    ]
)
