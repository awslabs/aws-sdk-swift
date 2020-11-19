// swift-tools-version:5.1
import PackageDescription

let package = Package(
    name: "AWSClientRuntime",
    platforms: [
	.macOS(.v10_15),
	.iOS(.v13)
    ],
    products: [
        .library(name: "AWSClientRuntime", targets: ["AWSClientRuntime"])
    ],
    dependencies: [
        .package(path: "~/Projects/Amplify/SwiftSDK/smithy-swift/ClientRuntime"),
        .package(path: "~/Projects/Amplify/SwiftSDK/aws-crt-swift")
    ],
    targets: [
        .target(
            name: "AWSClientRuntime",
            dependencies: [
                "ClientRuntime",
                .product(name: "AwsCommonRuntimeKit", package: "AwsCrt")
            ],
            path: "./AWSClientRuntime"
        ),
        .testTarget(
            name: "AWSClientRuntimeTests",
            dependencies: ["SmithyTestUtil"],
            path: "./AWSClientRuntimeTests"
        )
    ]
)
