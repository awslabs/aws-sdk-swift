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
    static var awsSDKCommon: Self { "AWSSDKCommon" }
    static var crt: Self { .product(name: "AwsCommonRuntimeKit", package: "aws-crt-swift") }
    static var clientRuntime: Self { .product(name: "ClientRuntime", package: "smithy-swift") }
    static var smithyRetriesAPI: Self { .product(name: "SmithyRetriesAPI", package: "smithy-swift") }
    static var smithyRetries: Self { .product(name: "SmithyRetries", package: "smithy-swift") }
    static var smithy: Self { .product(name: "Smithy", package: "smithy-swift") }
    static var smithyIdentity: Self { .product(name: "SmithyIdentity", package: "smithy-swift") }
    static var smithyIdentityAPI: Self { .product(name: "SmithyIdentityAPI", package: "smithy-swift") }
    static var smithyEventStreamsAPI: Self { .product(name: "SmithyEventStreamsAPI", package: "smithy-swift") }
    static var smithyEventStreamsAuthAPI: Self { .product(name: "SmithyEventStreamsAuthAPI", package: "smithy-swift") }
    static var smithyEventStreams: Self { .product(name: "SmithyEventStreams", package: "smithy-swift") }
    static var smithyChecksumsAPI: Self { .product(name: "SmithyChecksumsAPI", package: "smithy-swift") }
    static var smithyTestUtils: Self { .product(name: "SmithyTestUtil", package: "smithy-swift") }
}

// MARK: - Base Package

let package = Package(
    name: "aws-sdk-swift",
    platforms: [
        .macOS(.v10_15),
        .iOS(.v13),
        .tvOS(.v13),
        .watchOS(.v6)
    ],
    products: [
        .library(name: "AWSClientRuntime", targets: ["AWSClientRuntime"]),
        .library(name: "AWSSDKEventStreamsAuth", targets: ["AWSSDKEventStreamsAuth"]),
        .library(name: "AWSSDKIdentity", targets: ["AWSSDKIdentity"]),
        .library(name: "AWSSDKHTTPAuth", targets: ["AWSSDKHTTPAuth"]),
    ],
    targets: [
        .target(
            name: "AWSSDKForSwift",
            path: "Sources/Core/AWSSDKForSwift",
            exclude: ["Documentation.docc/AWSSDKForSwift.md"]
        ),
        .target(
            name: "AWSClientRuntime",
            dependencies: [
                .crt,
                .clientRuntime,
                .smithyRetriesAPI,
                .smithyRetries,
                .smithyEventStreamsAPI,
                .smithyEventStreamsAuthAPI,
                .awsSDKCommon,
                "AWSSDKIdentity",
            ],
            path: "./Sources/Core/AWSClientRuntime",
            resources: [
                .copy("PrivacyInfo.xcprivacy")
            ]
        ),
        .target(
            name: "AWSSDKCommon",
            dependencies: [.crt],
            path: "./Sources/Core/AWSSDKCommon"
        ),
        .target(
            name: "AWSSDKIdentity",
            dependencies: [.crt, .smithyIdentity, .smithyIdentityAPI, .awsSDKCommon],
            path: "./Sources/Core/AWSSDKIdentity"
        ),
        .target(
            name: "AWSSDKHTTPAuth",
            dependencies: [.crt, .clientRuntime, .smithyChecksumsAPI, "AWSSDKIdentity"],
            path: "./Sources/Core/AWSSDKHTTPAuth"
        ),
        .target(
            name: "AWSSDKEventStreamsAuth",
            dependencies: [.smithyEventStreamsAPI, .smithyEventStreamsAuthAPI, .smithyEventStreams, .crt, .clientRuntime, "AWSSDKHTTPAuth"],
            path: "./Sources/Core/AWSSDKEventStreamsAuth"
        ),
        .testTarget(
            name: "AWSClientRuntimeTests",
            dependencies: [.awsClientRuntime, .clientRuntime, .smithyTestUtils, .smithyIdentity, "AWSSDKIdentity"],
            path: "./Tests/Core/AWSClientRuntimeTests",
            resources: [.process("Resources")]
        ),
        .testTarget(
            name: "AWSSDKHTTPAuthTests",
            dependencies: ["AWSSDKHTTPAuth", "AWSClientRuntime", "AWSSDKEventStreamsAuth", .crt, .clientRuntime, .smithyTestUtils],
            path: "./Tests/Core/AWSSDKHTTPAuthTests"
        ),
        .testTarget(
            name: "AWSSDKEventStreamsAuthTests",
            dependencies: ["AWSClientRuntime", "AWSSDKEventStreamsAuth"],
            path: "./Tests/Core/AWSSDKEventStreamsAuthTests"
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
    guard ProcessInfo.processInfo.environment["AWS_SWIFT_SDK_ENABLE_DOCC"] != nil else { return }
    package.dependencies += [
        .package(url: "https://github.com/apple/swift-docc-plugin", from: "1.0.0")
    ]
}

// MARK: - Services

let serviceTargetDependencies: [Target.Dependency] = [
    .clientRuntime,
    .awsClientRuntime,
    .smithyRetriesAPI,
    .smithyRetries,
    .smithy,
    .smithyIdentityAPI,
    .smithyEventStreamsAPI,
    .smithyEventStreamsAuthAPI,
    .smithyEventStreams,
    .smithyChecksumsAPI,
    "AWSSDKCommon",
    "AWSSDKIdentity",
    "AWSSDKHTTPAuth",
    "AWSSDKEventStreamsAuth",
]

func addServiceTarget(_ name: String) {
    package.products += [
        .library(name: name, targets: [name]),
    ]
    package.targets += [
        .target(
            name: name,
            dependencies: serviceTargetDependencies,
            path: "./Sources/Services/\(name)"
        )
    ]
}

func addServiceUnitTestTarget(_ name: String) {
    let testName = "\(name)Tests"
    package.targets += [
        .testTarget(
            name: "\(testName)",
            dependencies: [.crt, .clientRuntime, .awsClientRuntime, .byName(name: name), .smithyTestUtils],
            path: "./Tests/Services/\(testName)"
        )
    ]
}

func addIntegrationTestTarget(_ name: String) {
    let integrationTestName = "\(name)IntegrationTests"
    var additionalDependencies: [String] = []
    var exclusions: [String] = []
    switch name {
    case "AWSEC2":
        additionalDependencies = ["AWSIAM", "AWSSTS", "AWSCloudWatchLogs"]
        exclusions = [
            "Resources/IMDSIntegTestApp"
        ]
    case "AWSECS":
        additionalDependencies = ["AWSCloudWatchLogs", "AWSEC2",  "AWSIAM", "AWSSTS"]
        exclusions = [
            "README.md",
            "Resources/ECSIntegTestApp/"
        ]
    case "AWSS3":
        additionalDependencies = ["AWSSSOAdmin", "AWSS3Control", "AWSSTS"]
    case "AWSEventBridge":
        additionalDependencies = ["AWSRoute53"]
    case "AWSCloudFrontKeyValueStore":
        additionalDependencies = ["AWSCloudFront"]
    case "AWSSTS":
        additionalDependencies = ["AWSIAM", "AWSCognitoIdentity"]
    default:
        break
    }
    integrationTestServices.insert(name)
    additionalDependencies.forEach { integrationTestServices.insert($0) }
    package.targets += [
        .testTarget(
            name: integrationTestName,
            dependencies: [.crt, .clientRuntime, .awsClientRuntime, .byName(name: name), .smithyTestUtils, .smithyIdentity] + additionalDependencies.map { Target.Dependency.target(name: $0, condition: nil) },
            path: "./IntegrationTests/Services/\(integrationTestName)",
            exclude: exclusions,
            resources: [.process("Resources")]
        )
    ]
}

var enabledServices = Set<String>()

var enabledServiceUnitTests = Set<String>()

func addAllServices() {
    enabledServices = Set(serviceTargets)
    enabledServiceUnitTests = Set(serviceTargets)
}

var integrationTestServices = Set<String>()

func addIntegrationTests() {
    servicesWithIntegrationTests.forEach { addIntegrationTestTarget($0) }
}

func excludeRuntimeUnitTests() {
    package.targets.removeAll { $0.name == "AWSClientRuntimeTests" }
}

func addProtocolTests() {

    struct ProtocolTest {
        let name: String
        let sourcePath: String
        let testPath: String?
        let buildOnly: Bool

        init(name: String, sourcePath: String, testPath: String? = nil, buildOnly: Bool = false) {
            self.name = name
            self.sourcePath = sourcePath
            self.testPath = testPath
            self.buildOnly = buildOnly
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
        .init(name: "EventStream", sourcePath: "\(baseDirLocal)/EventStream", buildOnly: true),
        .init(name: "RPCEventStream", sourcePath: "\(baseDirLocal)/RPCEventStream", buildOnly: true),
        .init(name: "Waiters", sourcePath: "\(baseDirLocal)/Waiters", testPath: "codegen/protocol-test-codegen-local/Tests"),
    ]
    for protocolTest in protocolTests {
        let target = Target.target(
            name: protocolTest.name,
            dependencies: serviceTargetDependencies,
            path: "\(protocolTest.sourcePath)/swift-codegen/\(protocolTest.name)"
        )
        let testTarget = protocolTest.buildOnly ? nil : Target.testTarget(
            name: "\(protocolTest.name)Tests",
            dependencies: [.smithyTestUtils, .byNameItem(name: protocolTest.name, condition: nil)],
            path: "\(protocolTest.testPath ?? protocolTest.sourcePath)/swift-codegen/\(protocolTest.name)Tests"
        )
        package.targets += [target, testTarget].compactMap { $0 }
    }
}

func addResolvedTargets() {
    enabledServices.union(integrationTestServices).forEach(addServiceTarget)
    enabledServiceUnitTests.forEach(addServiceUnitTestTarget)
}
