#!/usr/bin/swift

/*
 * Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
 * SPDX-License-Identifier: Apache-2.0.
 */

#if os(Linux)
import Glibc
#else
import Darwin
#endif
import class Foundation.PropertyListDecoder
import class Foundation.ProcessInfo
import class Foundation.FileManager

let env = ProcessInfo.processInfo.environment

// This struct is read from the .plist stored at packageDependencies.plist
struct PackageDeps: Codable {
    // Versions will always be defined in packageDependencies.plist
    // Versions are the only reference used when releasing.
    var awsCRTSwiftVersion: String
    var clientRuntimeVersion: String
    // Branches are normally set to main in packageDependencies.plist,
    // but may be changed during development on a feature branch if desired.
    // These values override environment vars set on CI.
    // Branches are ignored when building a release.
    var awsCRTSwiftBranch: String?
    var clientRuntimeBranch: String?
    // Paths may be used to point to paths on a development machine.
    // They may be set by the developer during testing, but should
    // never be set outside a development branch.
    // On CI, paths may be read from env vars and set at build time.
    // Paths are ignored when building a release.
    var awsCRTSwiftPath: String?
    var clientRuntimePath: String?
}

// When AWS_SDK_RELEASE_IN_PROGRESS is set, the manifest will require
// exact versions of smithy-swift and aws-crt-swift no matter what
// branches or paths are set.
let releaseInProgress: Bool = {
    env["AWS_SDK_RELEASE_IN_PROGRESS"] != nil
}()

let plistFile = "packageDependencies.plist"

func getPackageDependencies() -> PackageDeps? {
    guard let plistData = FileManager.default.contents(atPath: plistFile),
          var deps = try? PropertyListDecoder().decode(PackageDeps.self, from: plistData)
          else {
        return nil
    }
    // If env vars are set for package paths in the AWS CRT Builder script, use them
    // unless generating the manifest for release
    if let awsCRTSwiftCIPath = env["AWS_CRT_SWIFT_CI_DIR"], let smithySwiftCIPath = env["SMITHY_SWIFT_CI_DIR"] {
        deps.awsCRTSwiftPath = awsCRTSwiftCIPath
        deps.clientRuntimePath = smithySwiftCIPath
    }
    return deps
}

func generateHeader() {
    let header = """
    // swift-tools-version:5.5

    //
    // Copyright Amazon.com Inc. or its affiliates.
    // All Rights Reserved.
    //
    // SPDX-License-Identifier: Apache-2.0
    //

    // This manifest is auto-generated.  Do not commit edits to this file;
    // they will be overwritten.

    import PackageDescription

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

func generateDependencies(_ deps: PackageDeps) {
    let crtSwiftDependency = dependency(
        url: "https://github.com/awslabs/aws-crt-swift",
        version: deps.awsCRTSwiftVersion,
        // if the branch is main, then don't use it. 
        // this will fallback to the version
        // REMOVE THIS ONCE WE FIX BUILD ERRORS CAUSED BY main
        branch: deps.awsCRTSwiftBranch == "main" ? nil : deps.awsCRTSwiftBranch, 
        path: deps.awsCRTSwiftPath
    )
    let clientRuntimeDependency = dependency(
        url: "https://github.com/awslabs/smithy-swift",
        version: deps.clientRuntimeVersion,
        branch: deps.clientRuntimeBranch,
        path: deps.clientRuntimePath
    )
    let dependencies = """
    dependencies: [
        \(clientRuntimeDependency),
        \(crtSwiftDependency)
    ],
"""
    print(dependencies)
}

private func dependency(url: String, version: String, branch: String?, path: String?) -> String {
    if !releaseInProgress {
        if let path = path {
            return ".package(path: \"\(path)\")"
        } else if let branch = branch {
            return ".package(url: \"\(url)\", branch: \"\(branch)\")"
        }
    }
    // When generating the manifest for release or when no path/branch is set,
    // lock dependencies to published versions
    return ".package(url: \"\(url)\", .exact(\"\(version)\"))"
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
    print("    ]")
}

let releasedSDKs = try! FileManager.default
    .contentsOfDirectory(atPath: "release")
    .filter { !$0.hasPrefix(".") }.sorted()

guard let deps = getPackageDependencies() else {
    print("Failed to get version dependencies")
    print("  Unable to to read: '\(plistFile)'")
    exit(1)
}

generateHeader()
generatePackageHeader()
generateProducts(releasedSDKs)
generateDependencies(deps)
generateTargets(releasedSDKs)
print(")")
