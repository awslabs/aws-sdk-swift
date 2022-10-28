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

struct VersionDeps: Codable {
    // Versions will always be defined in versionDependencies.plist
    var awsCRTSwiftVersion: String
    var clientRuntimeVersion: String
    // These keys are not normally defined in versionDependencies.plist,
    // but may be set during development on a feature branch if desired.
    // These values override environment vars set on CI.
    // Branches are ignored when building a release.
    var awsCRTSwiftBranch: String?
    var clientRuntimeBranch: String?
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
    // Set branch from env vars, if not already set in the plist
    deps.awsCRTSwiftBranch = deps.awsCRTSwiftBranch ?? env["AWS_SDK_AWS_CRT_SWIFT_BRANCH_OVERRIDE"]
    deps.clientRuntimeBranch = deps.clientRuntimeBranch ?? env["AWS_SDK_SMITHY_SWIFT_BRANCH_OVERRIDE"]
    // Clear all branch settings if building for release
    // if releaseInProgress {
    //     deps.awsCRTSwiftBranch = nil
    //     deps.clientRuntimeBranch = nil
    // }
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
    let crtSpecifier, clientRuntimeSpecifier: String
    if let crtBranch = versions.awsCRTSwiftBranch {
        crtSpecifier = "branch: \"\(crtBranch)\""
    } else {
        crtSpecifier = ".exact(\"\(versions.awsCRTSwiftVersion)\")"
    }
    if let clientRuntimeBranch = versions.clientRuntimeBranch {
        clientRuntimeSpecifier = "branch: \"\(clientRuntimeBranch)\""
    } else {
        clientRuntimeSpecifier = ".exact(\"\(versions.clientRuntimeVersion)\")"
    }
    let dependencies = """
    dependencies: [
        .package(url: "https://github.com/awslabs/aws-crt-swift.git", \(crtSpecifier)),
        .package(url: "https://github.com/awslabs/smithy-swift.git", \(clientRuntimeSpecifier))
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
    for test in protocolTests {
        let basePath = test.local ? protocolBasePathLocal : protocolBasePath
        print("        .target(name: \"\(test.name)\", dependencies: [.product(name: \"ClientRuntime\", package: \"smithy-swift\"), \"AWSClientRuntime\"], path: \"\(basePath)/\(test.path)/swift-codegen/\(test.name)\"),")
        print("        .testTarget(name: \"\(test.name)Tests\", dependencies: [.product(name: \"SmithyTestUtil\", package: \"smithy-swift\"), \"\(test.name)\"], path: \"\(basePath)/\(test.path)/swift-codegen/\(test.name)Tests\"),")
    }
    print("    ]")
}

let sdksToIncludeInTargets = try! FileManager.default.contentsOfDirectory(atPath: "release")
// let releasedSDKs = [String]()
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
