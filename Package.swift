// swift-tools-version:5.5
import PackageDescription

let package = Package(
    name: "aws-sdk-swift",
    platforms: [
        .macOS(.v10_15),
        .iOS(.v13)
    ],
    products: [
        .library(name: "AWSClientRuntime", targets: ["AWSClientRuntime"]),
        .library(name: "AWSS3", targets: ["AWSS3"]),
        .library(name: "AWSSTS", targets: ["AWSSTS"]),
    ],
    dependencies: [
        .package(url: "https://github.com/awslabs/aws-crt-swift.git", .exact("0.2.2")),
        .package(url: "https://github.com/awslabs/smithy-swift.git", branch: "jbe/to_be_main")
    ],
    targets: [
        .target(
            name: "AWSClientRuntime",
            dependencies: [
                .product(name: "ClientRuntime", package: "smithy-swift"),
                .product(name: "AwsCommonRuntimeKit", package: "aws-crt-swift")
            ],
            path: "./AWSClientRuntime/Sources"
        ),
        .testTarget(
            name: "AWSClientRuntimeTests",
            dependencies: [
                "AWSClientRuntime",
                .product(name: "SmithyTestUtil", package: "smithy-swift"),
                .product(name: "ClientRuntime", package: "smithy-swift")
            ],
            path: "./AWSClientRuntime/Tests"
        ),
        .target(name: "AWSS3", dependencies: [.product(name: "ClientRuntime", package: "smithy-swift"), "AWSClientRuntime"], path: "./release/AWSS3"),
        .target(name: "AWSSTS", dependencies: [.product(name: "ClientRuntime", package: "smithy-swift"), "AWSClientRuntime"], path: "./release/AWSSTS"),
    ]
)
