// swift-tools-version:5.7

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

// MARK: - Target Dependencies

extension Target.Dependency {
    static var awsClientRuntime: Self { "AWSClientRuntime" }
    static var crt: Self { .product(name: "AwsCommonRuntimeKit", package: "aws-crt-swift") }
    static var clientRuntime: Self { .product(name: "ClientRuntime", package: "smithy-swift") }
    static var smithyTestUtils: Self { .product(name: "SmithyTestUtil", package: "smithy-swift") }
}

// MARK: - Base Package

let package = Package(
    name: "aws-sdk-swift",
    platforms: [
        .macOS(.v10_15),
        .iOS(.v13)
    ],
    products: [
        .library(name: "AWSClientRuntime", targets: ["AWSClientRuntime"])
    ],
    targets: [
        .target(
            name: "AWSSDKForSwift",
            path: "Sources/Core/AWSSDKForSwift",
            exclude: ["Documentation.docc/AWSSDKForSwift.md"]
        ),
        .target(
            name: "AWSClientRuntime",
            dependencies: [.crt, .clientRuntime],
            path: "./Sources/Core/AWSClientRuntime"
        ),
        .testTarget(
            name: "AWSClientRuntimeTests",
            dependencies: [.awsClientRuntime, .clientRuntime, .smithyTestUtils],
            path: "./Tests/Core/AWSClientRuntimeTests",
            resources: [.process("Resources")]
        )
    ]
)

// MARK: - Dependencies

func addDependencies(clientRuntimeVersion: Version, crtVersion: Version) {
    addClientRuntimeDependency(clientRuntimeVersion)
    addCRTDependency(crtVersion)
    addDoccDependency()
}

func addClientRuntimeDependency(_ version: Version) {
    let smithySwiftURL = "https://github.com/smithy-lang/smithy-swift"
    let useLocalDeps = ProcessInfo.processInfo.environment["AWS_SWIFT_SDK_USE_LOCAL_DEPS"] != nil
    let useMainDeps = ProcessInfo.processInfo.environment["AWS_SWIFT_SDK_USE_MAIN_DEPS"] != nil
    switch (useLocalDeps, useMainDeps) {
    case (true, true):
        fatalError("Unable to determine which dependencies to use. Please only specify one of AWS_SWIFT_SDK_USE_LOCAL_DEPS or AWS_SWIFT_SDK_USE_MAIN_DEPS.")
    case (true, false):
        package.dependencies += [
            .package(path: "../smithy-swift")
        ]
    case (false, true):
        package.dependencies += [
            .package(url: smithySwiftURL, branch: "main")
        ]
    case (false, false):
        package.dependencies += [
            .package(url: smithySwiftURL, exact: version)
        ]
    }
}

func addCRTDependency(_ version: Version) {
    package.dependencies += [
        .package(url: "https://github.com/awslabs/aws-crt-swift", exact: version)
    ]
}

func addDoccDependency() {
    package.dependencies += [
        .package(url: "https://github.com/apple/swift-docc-plugin", from: "1.0.0")
    ]
}

// MARK: - Services

func addServiceTarget(_ name: String) {
    let testName = "\(name)Tests"
    package.products += [
        .library(name: name, targets: [name]),
    ]
    package.targets += [
        .target(
            name: name,
            dependencies: [.clientRuntime, .awsClientRuntime],
            path: "./Sources/Services/\(name)"
        ),
        .testTarget(
            name: "\(testName)",
            dependencies: [.crt, .clientRuntime, .awsClientRuntime, .byName(name: name), .smithyTestUtils],
            path: "./Tests/Services/\(testName)"
        )
    ]
}

func addIntegrationTestTarget(_ name: String) {
    let integrationTestName = "\(name)IntegrationTests"
    var additionalDependencies: [PackageDescription.Target.Dependency] = []
    var exclusions: [String] = []
    switch name {
    case "AWSECS":
        additionalDependencies = ["AWSCloudWatchLogs", "AWSEC2",  "AWSIAM", "AWSSTS"]
        exclusions = [
            "README.md",
            "Resources/ECSIntegTestApp/"
        ]
    case "AWSS3":
        additionalDependencies = ["AWSSSOAdmin"]
    default:
        break
    }
    package.targets += [
        .testTarget(
            name: integrationTestName,
            dependencies: [.crt, .clientRuntime, .awsClientRuntime, .byName(name: name), .smithyTestUtils] + additionalDependencies,
            path: "./IntegrationTests/Services/\(integrationTestName)",
            exclude: exclusions,
            resources: [.process("Resources")]
        )
    ]
}

func addProtocolTests() {

    struct ProtocolTest {
        let name: String
        let sourcePath: String
        let testPath: String?

        init(name: String, sourcePath: String, testPath: String? = nil) {
            self.name = name
            self.sourcePath = sourcePath
            self.testPath = testPath
        }
    }

    let baseDir = "codegen/protocol-test-codegen/build/smithyprojections/protocol-test-codegen"
    let baseDirLocal = "codegen/protocol-test-codegen-local/build/smithyprojections/protocol-test-codegen-local"

    let protocolTests: [ProtocolTest] = [
        .init(name: "AWSRestJsonTestSDK", sourcePath: "\(baseDir)/aws-restjson"),
        .init(name: "AWSRestJsonValidationTestSDK", sourcePath: "\(baseDir)/aws-restjson-validation"),
        .init(name: "AWSJson1_0TestSDK", sourcePath: "\(baseDir)/aws-json-10"),
        .init(name: "AWSJson1_1TestSDK", sourcePath: "\(baseDir)/aws-json-11"),
        .init(name: "RestXmlTestSDK", sourcePath: "\(baseDir)/rest-xml"),
        .init(name: "RestXmlWithNamespaceTestSDK", sourcePath: "\(baseDir)/rest-xml-xmlns"),
        .init(name: "Ec2QueryTestSDK", sourcePath: "\(baseDir)/ec2-query"),
        .init(name: "AWSQueryTestSDK", sourcePath: "\(baseDir)/aws-query"),
        .init(name: "APIGatewayTestSDK", sourcePath: "\(baseDir)/apigateway"),
        .init(name: "GlacierTestSDK", sourcePath: "\(baseDir)/glacier"),
        .init(name: "MachineLearningTestSDK", sourcePath: "\(baseDir)/machinelearning"),
        .init(name: "S3TestSDK", sourcePath: "\(baseDir)/s3"),
        .init(name: "rest_json_extras", sourcePath: "\(baseDirLocal)/rest_json_extras"),
        .init(name: "AwsQueryExtras", sourcePath: "\(baseDirLocal)/AwsQueryExtras"),
        .init(name: "Waiters", sourcePath: "\(baseDirLocal)/Waiters", testPath: "codegen/protocol-test-codegen-local/Tests"),
    ]
    for protocolTest in protocolTests {
        package.targets += [
            .target(
                name: protocolTest.name,
                dependencies: [.clientRuntime, .awsClientRuntime],
                path: "\(protocolTest.sourcePath)/swift-codegen/\(protocolTest.name)"
            ),
            .testTarget(
                name: "\(protocolTest.name)Tests",
                dependencies: [.smithyTestUtils, .byNameItem(name: protocolTest.name, condition: nil)],
                path: "\(protocolTest.testPath ?? protocolTest.sourcePath)/swift-codegen/\(protocolTest.name)Tests"
            )
        ]
    }
}
