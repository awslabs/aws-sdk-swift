// swift-tools-version:5.3
import PackageDescription
import class Foundation.ProcessInfo
import class Foundation.FileManager

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
let isUsingSPMLocal = FileManager.default.fileExists(atPath: "/Users/nickik/Projects/Amplify/SwiftSDK/smithy-swift/Package.swift")
if isUsingSPMLocal {
    package.dependencies += [
        .package(name: "AwsCrt", url: "https://github.com/awslabs/aws-crt-swift", .branch(relatedDependenciesBranch)),
        .package(name: "ClientRuntime", path: "~/Projects/Amplify/SwiftSDK/smithy-swift")
    ]
} else {
    package.dependencies += [
        .package(name: "AwsCrt", url: "https://github.com/awslabs/aws-crt-swift", .branch(relatedDependenciesBranch)),
        .package(name: "ClientRuntime", url: "https://github.com/awslabs/smithy-swift", .branch(relatedDependenciesBranch))
    ]
}
