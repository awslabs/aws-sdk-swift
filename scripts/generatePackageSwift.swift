#!/usr/bin/swift

/*
 * Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
 * SPDX-License-Identifier: Apache-2.0.
 */

import class Foundation.PropertyListDecoder
import class Foundation.ProcessInfo
import class Foundation.FileManager

struct VersionDeps: Codable {
    var awsCRTSwiftVersion: String
    var clientRuntimeVersion: String

    var awsCRTSwiftBranch: String?
    var clientRuntimeBranch: String?
}

struct ProtocolTest {
    let name: String
    let path: String
    let local: Bool
}

let protocolBasePath = "./protocol-test-codegen/build/smithyprojections/protocol-test-codegen"
let protocolBasePathLocal = "./protocol-test-codegen-local/build/smithyprojections/protocol-test-codegen-local"

var protocolTests: [ProtocolTest] = [
    ProtocolTest(name: "AWSRestJsonTestSDK", path: "/aws-restjson", local: false),
    ProtocolTest(name: "AWSJson1_0TestSDK", path: "/aws-json-10", local: false),
    ProtocolTest(name: "AWSJson1_1TestSDK", path: "/aws-json-11", local: false),
    ProtocolTest(name: "RestXmlTestSDK", path: "/rest-xml", local: false),
    ProtocolTest(name: "RestXmlWithNamespaceTestSDK", path: "/rest-xml-xmlns", local: false),
    ProtocolTest(name: "Ec2QueryTestSDK", path: "/ec2-query", local: false),
    ProtocolTest(name: "AWSQueryTestSDK", path: "/aws-query", local: false),
    //Service specific
    ProtocolTest(name: "APIGatewayTestSDK", path: "/apigateway", local: false),
    ProtocolTest(name: "GlacierTestSDK", path: "/glacier", local: false),
    ProtocolTest(name: "MachineLearningTestSDK", path: "/machinelearning", local: false),
    ProtocolTest(name: "S3TestSDK", path: "/s3", local: false),
    //Local tests
    ProtocolTest(name: "aws_restjson", path: "/aws-restjson", local: true),
    ProtocolTest(name: "rest_json_extras", path: "/rest_json_extras", local: true),
]

let plistFile = "versionDependencies.plist"

func getVersionsOfDependencies() -> VersionDeps? {
    guard let versionsPlist = FileManager.default.contents(atPath: plistFile),
          var deps = try? PropertyListDecoder().decode(VersionDeps.self, from: versionsPlist)
          else {
        return nil
    }
    let env = ProcessInfo.processInfo.environment
    if let awsCRTSwiftBranch = env["AWS_SDK_AWS_CRT_SWIFT_BRANCH_OVERRIDE"] {
        deps.awsCRTSwiftBranch = awsCRTSwiftBranch
    }
    if let clientRuntimeBranch = env["AWS_SDK_SMITHY_SWIFT_BRANCH_OVERRIDE"] {
        deps.clientRuntimeBranch = clientRuntimeBranch
    }
    return deps
}

let includeProtocolTests: Bool = {
    ProcessInfo.processInfo.environment["AWS_SDK_PROTOCOL_CODEGEN_TESTS_BUILT"] != nil
}()

func generateHeader() {
    let header = """
    // swift-tools-version:5.5
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
    if includeProtocolTests {
        for test in protocolTests {
            let basePath = test.local ? baseDirLocal : baseDir
            print("        .target(name: \"\(test.name)\", dependencies: [.product(name: \"ClientRuntime\", package: \"smithy-swift\"), \"AWSClientRuntime\"], path: \"\()\"),")
        }
    }
    print("    ]")
    
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
