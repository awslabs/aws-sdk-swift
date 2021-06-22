#!/usr/bin/swift
import Foundation

func generateHeader() {
    let header = """
    // swift-tools-version:5.4
    import PackageDescription
    import class Foundation.FileManager
    """
    print(header)
}
func generatePackageHeader() {
let packageHeader = """
let package = Package(
    name: "AWSSwiftSDK",
    platforms: [
        .macOS(.v10_15),
        .iOS(.v13)
    ],
"""
    print(packageHeader)
}


func generateProducts(_ releasedSDKs: [String]) {

    print("    products: [")
    print("        .library(name: \"AWSClientRuntime\", targets: [\"AWSClientRuntime\"]),")
    for sdk in releasedSDKs {
        print("        .library(name: \"\(sdk)\", targets: [\"\(sdk)\"]),")
    }
    print("    ],")

}

func generateDependencies() {
    let dependencies = """
    dependencies: [
        .package(name: "AwsCrt", url: "https://github.com/awslabs/aws-crt-swift", .branch("master")),
        .package(name: "ClientRuntime", url: "https://github.com/awslabs/smithy-swift", .branch("master"))
    ],
"""
    print(dependencies)
}

func generateTargets(_ releasedSDKs: [String]) {
    let targetsBeginning = """
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
"""
    print(targetsBeginning)
    for sdk in releasedSDKs {
        print("        .target(name: \"\(sdk)\", dependencies: [.product(name: \"ClientRuntime\", package: \"ClientRuntime\"), \"AWSClientRuntime\"], path: \"./release/\(sdk)\"),")
    }
    print("        ]")
    
}

let sdksToIncludeInTargets = try! FileManager.default.contentsOfDirectory(atPath: "../release")
let releasedSDKs = sdksToIncludeInTargets.sorted()

generateHeader()
generatePackageHeader()
generateProducts(releasedSDKs)
generateDependencies()
generateTargets(releasedSDKs)
print(")")
