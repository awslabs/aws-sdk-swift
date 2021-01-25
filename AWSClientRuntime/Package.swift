// swift-tools-version:5.3
import PackageDescription

let package = Package(
    name: "AWSClientRuntime",
    platforms: [
	.macOS(.v10_15),
	.iOS(.v13)
    ],
    products: [
        .library(name: "AWSClientRuntime", targets: ["AWSClientRuntime"]),
	.library(name: "AWSSmithyTestUtil", targets: ["AWSSmithyTestUtil"])
    ],
    dependencies: [
        .package(name: "ClientRuntime", path: "~/Projects/Amplify/SwiftSDK/smithy-swift/ClientRuntime"),
        .package(name: "AwsCrt", path: "~/Projects/Amplify/SwiftSDK/aws-crt-swift"),
        .package(url: "https://github.com/apple/swift-log.git", from: "1.0.0")
    ],
    targets: [
        .target(
            name: "AWSClientRuntime",
            dependencies: [
                .product(name: "AwsCommonRuntimeKit", package: "AwsCrt"),
                .product(name: "ClientRuntime", package: "ClientRuntime"),
                .product(name: "Logging", package: "swift-log")
            ]
        ),
	.target(
	    name: "AWSSmithyTestUtil",
            dependencies: ["AWSClientRuntime"]
	)
    ]
)
