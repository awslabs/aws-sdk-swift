// swift-tools-version:5.3
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
        .package(name: "ClientRuntime", url: "https://github.com/awslabs/smithy-swift", .branch("master")),
        .package(name: "AwsCrt", url: "https://github.com/awslabs/aws-crt-swift", .branch("master"))
    ],
    targets: [
        .target(
            name: "AWSClientRuntime",
            dependencies: [
                .product(name: "ClientRuntime", package: "ClientRuntime"),
                .product(name: "AwsCommonRuntimeKit", package: "AwsCrt")
            ],
            path: "./Sources"
        ),
        .testTarget(
            name: "AWSClientRuntimeTests",
            dependencies: [
                "AWSClientRuntime",
                .product(name: "SmithyTestUtil", package: "ClientRuntime"),
                .product(name: "ClientRuntime", package: "ClientRuntime")
            ],
            path: "./Tests"
        )
    ]
)
