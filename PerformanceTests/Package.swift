// swift-tools-version: 5.9

import PackageDescription

let package = Package(
    name: "SDKWorkbench",
    platforms: [.macOS(.v12), .iOS(.v15)],
    products: [
        .executable(
            name: "PerformanceTestRunner",
            targets: ["PerformanceTestRunner"]
        )
    ],
    dependencies: [
        .package(name: "aws-sdk-swift", path: ".."),
        .package(name: "smithy-swift", path: "../../smithy-swift"),
    ],
    targets: [
        .executableTarget(
            name: "PerformanceTestRunner",
            dependencies: [
                .product(name: "AWSSTS", package: "aws-sdk-swift"),
                .product(name: "SmithySwiftNIO", package: "smithy-swift"),
                .product(name: "ClientRuntime", package: "smithy-swift")
            ]
        ),
    ]
)
