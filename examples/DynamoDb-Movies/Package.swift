// swift-tools-version:5.4
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "DynamoDb-Movies",
    platforms: [.macOS(.v10_15), .iOS(.v13)],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        .package(name: "AWSSwiftSDK", url: "https://github.com/awslabs/aws-sdk-swift", from: "0.0.4"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .executableTarget(
            name: "DynamoDb-Movies",
            dependencies: [.product(name: "DynamoDB", package: "AWSSwiftSDK")],
            resources: [.copy("Resources/data.json")])
    ]
)
