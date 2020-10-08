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
        .package(path: "/Users/edupp/Documents/git_repos/git_aws_codegen/amplify-codegen/smithy-swift/ClientRuntime")
    ],
    targets: [
        .target(
            name: "AWSClientRuntime",
            dependencies: ["ClientRuntime"],
            path: "./AWSClientRuntime"
        ),
        .testTarget(
            name: "AWSClientRuntimeTests",
            dependencies: ["SmithyTestUtil"],
            path: "./AWSClientRuntimeTests"
        )
    ]
)
