// swift-tools-version:5.9

//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import PackageDescription

// MARK: - Target dependencies

extension Target.Dependency {
    // Test utility module
    static var awsIntegrationTestUtils: Self { "AWSIntegrationTestUtils" }

    // AWS modules
    static var awsClientRuntime: Self { .product(name: "AWSClientRuntime", package: "aws-sdk-swift") }
    static var awsSDKCommon: Self { .product(name: "AWSSDKCommon", package: "aws-sdk-swift") }
    static var awsSDKIdentity: Self { .product(name: "AWSSDKIdentity", package: "aws-sdk-swift") }

    // Smithy modules
    static var clientRuntime: Self { .product(name: "ClientRuntime", package: "smithy-swift") }
    static var smithyIdentity: Self { .product(name: "SmithyIdentity", package: "smithy-swift") }
    static var smithyTestUtil: Self { .product(name: "SmithyTestUtil", package: "smithy-swift") }
}

// MARK: - Base Package

let package = Package(
    name: "aws-sdk-swift-integration-tests",
    platforms: [
        .macOS(.v10_15),
        .iOS(.v13),
        .tvOS(.v13),
        .watchOS(.v6)
    ],
    dependencies: [
        .package(path: "../../smithy-swift"),
        .package(path: "../../aws-sdk-swift"),
    ],
    targets: integrationTestTargets
)

private var integrationTestTargets: [Target] {
    let integrationTests = [
        "AWSCloudFrontKeyValueStore",
        "AWSDynamoDB",
        "AWSEC2",
        "AWSECS",
        "AWSEventBridge",
        "AWSGlacier",
        "AWSKinesis",
        "AWSMediaConvert",
        "AWSRoute53",
        "AWSS3",
        "AWSSQS",
        "AWSSTS",
        "AWSTranscribeStreaming",
        "AWSCognitoIdentity",
        "AWSBedrockRuntime",
    ].map { integrationTestTarget($0) }
    return integrationTests + [.target(name: "AWSIntegrationTestUtils", path: "./AWSIntegrationTestUtils")]
}

private func integrationTestTarget(_ name: String) -> Target {
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
    case "AWSGlacier":
        additionalDependencies = ["AWSSTS"]
    case "AWSS3":
        additionalDependencies = ["AWSSSOAdmin", "AWSS3Control", "AWSSTS"]
    case "AWSEventBridge":
        additionalDependencies = ["AWSRoute53"]
    case "AWSCloudFrontKeyValueStore":
        additionalDependencies = ["AWSCloudFront"]
    case "AWSSTS":
        additionalDependencies = ["AWSIAM", "AWSCognitoIdentity"]
    case "AWSCognitoIdentity":
        additionalDependencies = ["AWSSTS"]
    default:
        break
    }
    return .testTarget(
        name: integrationTestName,
        dependencies: [
            .clientRuntime,
            .awsClientRuntime,
            .smithyTestUtil,
            .awsSDKIdentity,
            .smithyIdentity,
            .awsSDKCommon,
            .awsIntegrationTestUtils,
            .product(name: name, package: "aws-sdk-swift")
        ] + additionalDependencies.map {
            Target.Dependency.product(name: $0, package: "aws-sdk-swift", condition: nil)
        },
        path: "./Services/\(integrationTestName)",
        exclude: exclusions,
        resources: [.process("Resources")]
    )
}

