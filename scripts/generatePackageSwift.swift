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

// This struct is read from the .plist stored at versionDependencies.plist
struct VersionDeps: Codable {
    // Versions will always be defined in versionDependencies.plist
    // Versions are the only reference used when releasing.
    var awsCRTSwiftVersion: String
    var clientRuntimeVersion: String
    // Branches are not normally defined in versionDependencies.plist,
    // but may be set during development on a feature branch if desired.
    // These values override environment vars set on CI.
    // Branches are ignored when building a release.
    var awsCRTSwiftBranch: String?
    var clientRuntimeBranch: String?
    // Paths may be used to point to paths on a development machine.
    // They may be set by the developer during testing, but should
    // never be set outside a development branch.
    // Use of paths will cause CI to fail.
    // Paths are ignored when building a release.
    var awsCRTSwiftPath: String?
    var clientRuntimePath: String?
}

let includeProtocolTests: Bool = {
    env["AWS_SDK_PROTOCOL_CODEGEN_TESTS_BUILT"] != nil
}()

let releaseInProgress: Bool = {
    env["AWS_SDK_RELEASE_IN_PROGRESS"] != nil
}()

struct ProtocolTest {
    let name: String
    let path: String
    let local: Bool
}

let protocolBasePath = "./codegen/protocol-test-codegen/build/smithyprojections/protocol-test-codegen"
let protocolBasePathLocal = "./codegen/protocol-test-codegen-local/build/smithyprojections/protocol-test-codegen-local"

let protocolTests: [ProtocolTest] = {
    guard includeProtocolTests else { return [] }
    return [
        ProtocolTest(name: "AWSRestJsonTestSDK", path: "aws-restjson", local: false),
        ProtocolTest(name: "AWSJson1_0TestSDK", path: "aws-json-10", local: false),
        ProtocolTest(name: "AWSJson1_1TestSDK", path: "aws-json-11", local: false),
        ProtocolTest(name: "RestXmlTestSDK", path: "rest-xml", local: false),
        ProtocolTest(name: "RestXmlWithNamespaceTestSDK", path: "rest-xml-xmlns", local: false),
        ProtocolTest(name: "Ec2QueryTestSDK", path: "ec2-query", local: false),
        ProtocolTest(name: "AWSQueryTestSDK", path: "aws-query", local: false),
        //Service specific
        ProtocolTest(name: "APIGatewayTestSDK", path: "apigateway", local: false),
        ProtocolTest(name: "GlacierTestSDK", path: "glacier", local: false),
        ProtocolTest(name: "MachineLearningTestSDK", path: "machinelearning", local: false),
        ProtocolTest(name: "S3TestSDK", path: "s3", local: false),
        //Local tests
        ProtocolTest(name: "aws_restjson", path: "aws-restjson", local: true),
        ProtocolTest(name: "rest_json_extras", path: "rest_json_extras", local: true),
    ]
}()

let plistFile = "versionDependencies.plist"

func getVersionsOfDependencies() -> VersionDeps? {
    guard let versionsPlist = FileManager.default.contents(atPath: plistFile),
          var deps = try? PropertyListDecoder().decode(VersionDeps.self, from: versionsPlist)
          else {
        return nil
    }
    // Set branch from env vars, if not already set in the .plist
    // Don't override a branch name if it was explicitly set in
    // the .plist
    deps.awsCRTSwiftBranch = deps.awsCRTSwiftBranch ?? env["AWS_SDK_AWS_CRT_SWIFT_BRANCH_OVERRIDE"]
    deps.clientRuntimeBranch = deps.clientRuntimeBranch ?? env["AWS_SDK_SMITHY_SWIFT_BRANCH_OVERRIDE"]
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
    for test in protocolTests {
        print("        .library(name: \"\(test.name)\", targets: [\"\(test.name)\"]),")
    }
    print("    ],")
}

func generateDependencies(versions: VersionDeps) {
    let crtSwiftDependency = dependency(url: "https://github.com/awslabs/aws-crt-swift",
                                        version: versions.awsCRTSwiftVersion,
                                        branch: versions.awsCRTSwiftBranch, 
                                        path: versions.awsCRTSwiftPath)
    let clientRuntimeDependency = dependency(url: "https://github.com/awslabs/smithy-swift",
                                             version: versions.clientRuntimeVersion,
                                             branch: versions.clientRuntimeBranch,
                                             path: versions.clientRuntimePath)
    let dependencies = """
    dependencies: [
        \(clientRuntimeDependency),
        \(crtSwiftDependency)
    ],
"""
    print(dependencies)
}

private func dependency(url: String, version: String, branch: String?, path: String?) -> String {
    // Re-enable this if statement before merging
    if true {
    // if !releaseInProgress {
        if let path = path {
            return ".package(path: \"\(path)\")"
        } else if let branch = branch {
            return ".package(url: \"\(url)\", branch: \"\(branch)\")"
        }
    }
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
    for test in protocolTests {
        let basePath = test.local ? protocolBasePathLocal : protocolBasePath
        print("        .target(name: \"\(test.name)\", dependencies: [.product(name: \"ClientRuntime\", package: \"smithy-swift\"), \"AWSClientRuntime\"], path: \"\(basePath)/\(test.path)/swift-codegen/\(test.name)\"),")
        print("        .testTarget(name: \"\(test.name)Tests\", dependencies: [.product(name: \"SmithyTestUtil\", package: \"smithy-swift\"), \"\(test.name)\"], path: \"\(basePath)/\(test.path)/swift-codegen/\(test.name)Tests\"),")
    }
    print("    ]")
}

let releasedSDKs = try! FileManager.default
    .contentsOfDirectory(atPath: "release")
    .filter { !$0.hasPrefix(".") }.sorted()

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
