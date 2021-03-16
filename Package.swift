// swift-tools-version:5.3
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

if ProcessInfo.processInfo.environment["SWIFTCI_USE_LOCAL_DEPS"] == nil {
    package.dependencies += [
        .package(name: "AwsCrt", url: "https://github.com/awslabs/aws-crt-swift", .branch(relatedDependenciesBranch)),
        .package(name: "ClientRuntime", url: "https://github.com/awslabs/smithy-swift", .branch(relatedDependenciesBranch))
    ]
} else {
    let clientRuntimeDir = ProcessInfo.processInfo.environment["AWS_SDK_SWIFT_CI_DIR"]
    let crtDir = ProcessInfo.processInfo.environment["AWS_CRT_SWIFT_CI_DIR"]
    package.dependencies += [
        .package(name: "AwsCrt", path: crtDir),
        .package(name: "ClientRuntime", path: clientRuntimeDir)
    ]
}
