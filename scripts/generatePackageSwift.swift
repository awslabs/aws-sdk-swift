#!/usr/bin/swift

/*
 * Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
 * SPDX-License-Identifier: Apache-2.0.
 */

import Foundation

struct VersionDeps: Codable {
    var awsCRTSwiftVersion: String
    var clientRuntimeVersion: String
}
let plistFile = "versionDependencies.plist"

func getVersionsOfDependencies() -> VersionDeps? {
    guard let versionsPlist = FileManager.default.contents(atPath: plistFile),
          let deps = try? PropertyListDecoder().decode(VersionDeps.self, from: versionsPlist)
          else {
        return nil
    }
    return deps
}

func generateHeader() {
    let header = """
    // swift-tools-version:5.5
    import PackageDescription
    import class Foundation.FileManager
    """
    print(header)
}
func generatePackageHeader() {
let packageHeader = """
let package = Package(
    name: "aws-sdk-swift",
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

func generateDependencies(versions: VersionDeps) {
    let dependencies = """
    dependencies: [
        .package(url: "https://github.com/awslabs/aws-crt-swift.git", .exact("\(versions.awsCRTSwiftVersion)")),
        .package(url: "https://github.com/awslabs/smithy-swift.git", .exact("\(versions.clientRuntimeVersion)"))
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
"""
    print(targetsBeginning)
    for sdk in releasedSDKs {
        print("        .target(name: \"\(sdk)\", dependencies: [.product(name: \"ClientRuntime\", package: \"smithy-swift\"), \"AWSClientRuntime\"], path: \"./release/\(sdk)\"),")
    }
    print("        ]")
    
}

let sdksToIncludeInTargets = try! FileManager.default.contentsOfDirectory(atPath: "release")
let releasedSDKs = sdksToIncludeInTargets.sorted()

guard let versions = getVersionsOfDependencies() else {
    print("Failed to get version dependencies")
    print("  Unable to to read: '\(plistFile)'")
    exit(1)
}

generateHeader()
generatePackageHeader()
generateProducts(releasedSDKs)
generateDependencies(versions: versions)
generateTargets(releasedSDKs)
print(")")
