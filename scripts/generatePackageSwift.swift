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
    var clientRuntimeVersion: String
    // Branches are normally set to main in packageDependencies.plist,
    // but may be changed during development on a feature branch if desired.
    // These values override environment vars set on CI.
    // Branches are ignored when building a release.
    var clientRuntimeBranch: String?
    // Paths may be used to point to paths on a development machine.
    // They may be set by the developer during testing, but should
    // never be set outside a development branch.
    // On CI, paths may be read from env vars and set at build time.
    // Paths are ignored when building a release.
    var clientRuntimePath: String?
}

let plistFile = "packageDependencies.plist"

func getPackageDependencies() -> PackageDeps? {
    guard let plistData = FileManager.default.contents(atPath: plistFile),
          var deps = try? PropertyListDecoder().decode(PackageDeps.self, from: plistData)
          else {
        return nil
    }
    // If env vars are set for package paths in the AWS CRT Builder script, use them
    // unless generating the manifest for release
    if let smithySwiftCIPath = env["SMITHY_SWIFT_CI_DIR"] {
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

    import Foundation
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
    let smithyURL = "https://github.com/awslabs/smithy-swift"
    let dependencies = """
let useLocalDeps = ProcessInfo.processInfo.environment["AWS_SWIFT_SDK_USE_LOCAL_DEPS"] != nil
let useMainDeps = ProcessInfo.processInfo.environment["AWS_SWIFT_SDK_USE_MAIN_DEPS"] != nil

switch (useLocalDeps, useMainDeps) {
case (true, true):
    fatalError("Unable to determine which dependencies to use. Please only specify one of AWS_SWIFT_SDK_USE_LOCAL_DEPS or AWS_SWIFT_SDK_USE_MAIN_DEPS.")
case (true, false):
    package.dependencies += [
        .package(path: \"\(deps.clientRuntimePath ?? "../smithy-swift")\")
    ]
case (false, true):
    package.dependencies += [
        .package(url: \"\(smithyURL)\", branch: \"\(deps.clientRuntimeBranch ?? "main")\")
    ]
case (false, false):
    package.dependencies += [
        .package(url: \"\(smithyURL)\", .exact(\"\(deps.clientRuntimeVersion)\"))
    ]
}
"""
    print(dependencies)
}

func generateServiceTargets(_ releasedSDKs: [String]) {
    print("        // MARK: - Service Targets")
    for sdk in releasedSDKs {
        print(#"        .target(name: "\#(sdk)", dependencies: ["AWSClientRuntime"], path: "./Sources/Services/\#(sdk)"),"#)
    }
    print()
    print("        // MARK: - Service Test Targets")
    print("        // TODO: enable test targets for all services https://github.com/awslabs/aws-sdk-swift/issues/814")
    for sdk in releasedSDKs {
        print(#"        // .testTarget(name: "\#(sdk)Tests", dependencies: ["\#(sdk)", smithyTestUtil], path: "./Tests/Services/\#(sdk)Tests"),"#)
    }
}

func generateCoreTargets() {
    print("        // MARK: - Core Targets")
    print(#"        .target(name: "AWSClientRuntime", dependencies: [clientRuntime], path: "./Sources/Core/AWSClientRuntime"),"#)
    print()
    print("        // MARK: - Core Test Targets")
    print(#"        .testTarget(name: "AWSClientRuntimeTests", dependencies: ["AWSClientRuntime", smithyTestUtil], path: "./Tests/Core/AWSClientRuntimeTests"),"#)
    print()
}

func generateCommonDependencies() {
    print(#"let smithyTestUtil = PackageDescription.Target.Dependency.product(name: "SmithyTestUtil", package: "smithy-swift")"#)
    print(#"let clientRuntime = PackageDescription.Target.Dependency.product(name: "ClientRuntime", package: "smithy-swift")"#)
    print()
}

let releasedSDKs = try! FileManager.default
    .contentsOfDirectory(atPath: "Sources/Services")
    .sorted()

guard let deps: PackageDeps = getPackageDependencies() else {
    print("Failed to get version dependencies")
    print("  Unable to to read: '\(plistFile)'")
    exit(1)
}

generateHeader()
generateCommonDependencies()
generatePackageHeader()
generateProducts(releasedSDKs)
print("    targets: [")
generateCoreTargets()
generateServiceTargets(releasedSDKs)
print("    ]")
print(")")
print("")
generateDependencies(deps)