// swift-tools-version:5.4
import PackageDescription
import class Foundation.FileManager
let package = Package(
    name: "AWSSwiftSDK",
    platforms: [
        .macOS(.v10_15),
        .iOS(.v13)
    ],
    products: [
        .library(name: "AWSClientRuntime", targets: ["AWSClientRuntime"]),
        .library(name: "S3", targets: ["S3"]),
    ],
    dependencies: [
        .package(name: "AwsCrt", url: "https://github.com/awslabs/aws-crt-swift", .branch("master")),
        .package(name: "ClientRuntime", url: "https://github.com/awslabs/smithy-swift", .branch("master"))
    ],
    targets: [
        .target(
            name: "AWSClientRuntime",
            dependencies: [
                .product(name: "ClientRuntime", package: "ClientRuntime"),
                .product(name: "AwsCommonRuntimeKit", package: "AwsCrt")
            ],
            path: "./AWSClientRuntime/Sources"
        ),
        .testTarget(
            name: "AWSClientRuntimeTests",
            dependencies: [
                "AWSClientRuntime",
                .product(name: "SmithyTestUtil", package: "ClientRuntime"),
                .product(name: "ClientRuntime", package: "ClientRuntime")
            ],
            path: "./AWSClientRuntime/Tests"
        ),
        .target(name: "S3", dependencies: [.product(name: "ClientRuntime", package: "ClientRuntime"), "AWSClientRuntime"], path: "./release/S3"),
        ]
)
