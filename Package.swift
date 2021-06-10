// swift-tools-version:5.4
import PackageDescription
import class Foundation.ProcessInfo

let package = Package(
    name: "AWSClientRuntime",
    platforms: [
	.macOS(.v10_15),
	.iOS(.v13)
    ],
    products: [
        .library(name: "AWSClientRuntime", targets: ["AWSClientRuntime"])
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
        )
    ]
)

let relatedDependenciesBranch = "master"

if ProcessInfo.processInfo.environment["SWIFTSDK_DEPS_USE_LOCAL_PATHS"] == nil {
    package.dependencies += [
        .package(name: "AwsCrt", url: "https://github.com/awslabs/aws-crt-swift", .branch(relatedDependenciesBranch)),
        .package(name: "ClientRuntime", url: "https://github.com/awslabs/smithy-swift", .branch(relatedDependenciesBranch))
    ]
} else {
    package.dependencies += [
        .package(name: "AwsCrt", url: "https://github.com/awslabs/aws-crt-swift", .branch(relatedDependenciesBranch)),
        .package(name: "ClientRuntime", path: "./target/build/deps/smithy-swift")
    ]
}
