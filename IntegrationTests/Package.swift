// swift-tools-version: 6.0

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
    static var awsSDKIdentityAPI: Self { .product(name: "AWSSDKIdentityAPI", package: "aws-sdk-swift") }
    static var awsSDKIdentity: Self { .product(name: "AWSSDKIdentity", package: "aws-sdk-swift") }

    /// A service client product from the SDK, i.e. `AWSIAM`.
    static func awsSDK(_ name: String) -> Self { .product(name: name, package: "aws-sdk-swift") }

    // Smithy modules
    static var clientRuntime: Self { .product(name: "ClientRuntime", package: "smithy-swift") }
    static var smithyIdentity: Self { .product(name: "SmithyIdentity", package: "smithy-swift") }
    static var smithyTestUtil: Self { .product(name: "SmithyTestUtil", package: "smithy-swift") }
    static var smithyHttpApi: Self { .product(name: "SmithyHTTPAPI", package: "smithy-swift") }
}

// MARK: - Base Package

let package = Package(
    name: "aws-sdk-swift-integration-tests",
    platforms: [
        .macOS(.v11),
        .iOS(.v15),
        .tvOS(.v15),
        .watchOS(.v8),
    ],
    dependencies: [
        .package(path: "../../smithy-swift"),
        .package(path: "../../aws-sdk-swift"),
        .package(url: "https://github.com/smithy-lang/smithy-swift-opentelemetry.git", from: "3.0.0"),
        .package(url: "https://github.com/open-telemetry/opentelemetry-swift-core", from: "2.3.0"),
    ],
    targets: integrationTestTargets
)

private var integrationTestTargets: [Target] {
    let integrationTests = [
        "AWSCloudFrontKeyValueStore",
        "AWSDynamoDB",
        "AWSEC2",
        "AWSECS",
        "AWSKinesis",
        "AWSMediaConvert",
        "AWSRoute53",
        "AWSS3",
        "AWSSQS",
        "AWSSTS",
        "AWSTranscribeStreaming",
        "AWSCognitoIdentity",
        "AWSBedrockRuntime",
        "AWSCloudWatch",
    ].map { integrationTestTarget($0) }
    return integrationTests + [.target(name: "AWSIntegrationTestUtils", dependencies: [.clientRuntime], path: "./AWSIntegrationTestUtils")]
}

/// Whether this service's integration tests bundle resource files at runtime.
///
/// Keep this list in sync with the services that have a `Resources` directory holding
/// files loaded via `Bundle.module`.  Every other service has no `Resources` directory at
/// all, except AWSEC2 & AWSECS, which keep helper apps there and exclude them from the
/// target.  Declaring resources for a target with nothing to bundle produces a bundle with
/// no payload, which codesign rejects on simulator destinations with "bundle format
/// unrecognized, invalid, or unsuitable".
///
/// This is a hardcoded list rather than a `FileManager` check because SwiftPM caches the
/// evaluated manifest and does not invalidate that cache when the files a manifest read
/// change, so a derived value would go stale until `Package.swift` itself was edited.
private func hasResources(_ name: String) -> Bool {
    [
        "AWSBedrockRuntime",
        "AWSS3",
        "AWSTranscribeStreaming",
    ].contains(name)
}

private func integrationTestTarget(_ name: String) -> Target {
    let integrationTestName = "\(name)IntegrationTests"
    var additionalDependencies: [Target.Dependency] = []
    var exclusions: [String] = []
    switch name {
    case "AWSEC2":
        additionalDependencies = [.awsSDK("AWSIAM"), .awsSDK("AWSSTS"), .awsSDK("AWSCloudWatchLogs")]
        exclusions = [
            "README.md",
            "Resources"
        ]
    case "AWSECS":
        additionalDependencies = [
            .awsSDK("AWSCloudWatchLogs"), .awsSDK("AWSEC2"), .awsSDK("AWSIAM"), .awsSDK("AWSSTS"),
        ]
        exclusions = [
            "README.md",
            "Resources"
        ]
    case "AWSS3":
        additionalDependencies = [.awsSDK("AWSSSOAdmin"), .awsSDK("AWSS3Control"), .awsSDK("AWSSTS")]
    case "AWSCloudFrontKeyValueStore":
        additionalDependencies = [.awsSDK("AWSCloudFront")]
    case "AWSSTS":
        additionalDependencies = [
            .awsSDK("AWSIAM"),
            .awsSDK("AWSCognitoIdentity"),
            .product(name: "SmithyOpenTelemetry", package: "smithy-swift-opentelemetry"),
            .product(name: "OpenTelemetrySdk", package: "opentelemetry-swift-core"),
        ]
    case "AWSCognitoIdentity":
        additionalDependencies = [.awsSDK("AWSSTS"), .awsSDK("AWSIAM")]
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
            .awsSDKIdentityAPI,
            .smithyIdentity,
            .awsSDKCommon,
            .awsIntegrationTestUtils,
            .smithyHttpApi,
            .product(name: name, package: "aws-sdk-swift")
        ] + additionalDependencies,
        path: "./Services/\(integrationTestName)",
        exclude: exclusions,
        resources: hasResources(name) ? [.process("Resources")] : []
    )
}

