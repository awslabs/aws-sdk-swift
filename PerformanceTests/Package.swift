// swift-tools-version: 5.9

import PackageDescription

let package = Package(
    name: "SDKWorkbench",
    platforms: [.macOS(.v12), .iOS(.v15)],
    dependencies: [
        .package(name: "aws-sdk-swift", path: "../../aws-sdk-swift"),
    ],
    targets: [
        .executableTarget(
            name: "PerformanceTestScript",
            dependencies: [
                .product(name: "AWSSTS", package: "aws-sdk-swift"),
            ]
        ),
    ]
)
