//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import Foundation
import XCTest
import ClientRuntime
import Smithy
import SmithyRetries
import SmithyRetriesAPI
import SmithyIdentity
import AWSSDKChecksums
import AWSSDKIdentity
@testable import AWSClientRuntime

final class AWSRetryStrategyOptionsDefaultsTests: XCTestCase {

    private let isolatedEnvVars = [
        "AWS_CONFIG_FILE",
        "AWS_SHARED_CREDENTIALS_FILE",
        "AWS_PROFILE",
        "AWS_RETRY_MODE",
        "AWS_MAX_ATTEMPTS",
    ]
    private var savedEnv = [String: String]()

    override func setUp() {
        let environment = ProcessInfo.processInfo.environment
        savedEnv = [:]
        for name in isolatedEnvVars {
            if let value = environment[name] { savedEnv[name] = value }
            unsetenv(name)
        }
        setenv("AWS_CONFIG_FILE", "/tmp/aws-retry-defaults-tests-nonexistent-config", 1)
        setenv("AWS_SHARED_CREDENTIALS_FILE", "/tmp/aws-retry-defaults-tests-nonexistent-credentials", 1)
    }

    override func tearDown() {
        for name in isolatedEnvVars {
            if let value = savedEnv[name] {
                setenv(name, value, 1)
            } else {
                unsetenv(name)
            }
        }
    }

    // MARK: - Retry modes

    func test_default_isStandardWithNewRetries() throws {
        let options = try AWSClientConfigDefaultsProvider.retryStrategyOptions(nil, nil, sdkID: "S3")
        XCTAssertTrue(options.useNewRetries2026)
        XCTAssertEqual(options.rateLimitingMode, .standard)
        XCTAssertEqual(options.maxRetriesBase, 2)
    }

    func test_default_withoutSDKID_isStandardWithNewRetries() throws {
        let options = try AWSClientConfigDefaultsProvider.retryStrategyOptions()
        XCTAssertTrue(options.useNewRetries2026)
        XCTAssertEqual(options.maxRetriesBase, 2)
    }

    func test_standard_usesNewRetries() throws {
        let options = try AWSClientConfigDefaultsProvider.retryStrategyOptions(.standard, nil, sdkID: "S3")
        XCTAssertTrue(options.useNewRetries2026)
        XCTAssertEqual(options.rateLimitingMode, .standard)
    }

    func test_adaptive_usesNewRetriesAndAdaptiveRateLimiting() throws {
        let options = try AWSClientConfigDefaultsProvider.retryStrategyOptions(.adaptive, nil, sdkID: "S3")
        XCTAssertTrue(options.useNewRetries2026)
        XCTAssertEqual(options.rateLimitingMode, .adaptive)
    }

    func test_legacy_doesNotUseNewRetries() throws {
        let options = try AWSClientConfigDefaultsProvider.retryStrategyOptions(.legacy, nil, sdkID: "S3")
        XCTAssertFalse(options.useNewRetries2026)
        XCTAssertEqual(options.rateLimitingMode, .standard)
        XCTAssertEqual(options.maxRetriesBase, 2)
    }

    func test_legacyFromEnvironment_doesNotUseNewRetries() throws {
        setenv("AWS_RETRY_MODE", "legacy", 1)
        let options = try AWSClientConfigDefaultsProvider.retryStrategyOptions(nil, nil, sdkID: "S3")
        XCTAssertFalse(options.useNewRetries2026)
    }

    func test_onlyMaxAttempts_usesNewRetries() throws {
        let options = try AWSClientConfigDefaultsProvider.retryStrategyOptions(nil, 5, sdkID: "S3")
        XCTAssertTrue(options.useNewRetries2026)
        XCTAssertEqual(options.maxRetriesBase, 4)
    }

    // MARK: - DynamoDB max attempts

    func test_dynamoDB_defaultsToFourAttempts() throws {
        let options = try AWSClientConfigDefaultsProvider.retryStrategyOptions(nil, nil, sdkID: "DynamoDB")
        XCTAssertEqual(options.maxRetriesBase, 3)
    }

    func test_dynamoDBStreams_defaultsToFourAttempts() throws {
        let options = try AWSClientConfigDefaultsProvider.retryStrategyOptions(nil, nil, sdkID: "DynamoDB Streams")
        XCTAssertEqual(options.maxRetriesBase, 3)
    }

    func test_dynamoDB_sdkIDOnlyOverload_defaultsToFourAttempts() throws {
        let options = try AWSClientConfigDefaultsProvider.retryStrategyOptions(sdkID: "DynamoDB")
        XCTAssertEqual(options.maxRetriesBase, 3)
    }

    func test_dynamoDB_keepsMaxAttemptsFromCode() throws {
        let options = try AWSClientConfigDefaultsProvider.retryStrategyOptions(nil, 2, sdkID: "DynamoDB")
        XCTAssertEqual(options.maxRetriesBase, 1)
    }

    func test_dynamoDB_keepsMaxAttemptsFromEnvironment() throws {
        setenv("AWS_MAX_ATTEMPTS", "2", 1)
        let options = try AWSClientConfigDefaultsProvider.retryStrategyOptions(nil, nil, sdkID: "DynamoDB")
        XCTAssertEqual(options.maxRetriesBase, 1)
    }

    func test_dynamoDB_keepsMaxAttemptsFromConfigFile() throws {
        let configURL = FileManager.default.temporaryDirectory
            .appendingPathComponent("aws-retry-defaults-tests-\(UUID().uuidString)")
        try "[default]\nmax_attempts = 2\n".write(to: configURL, atomically: true, encoding: .utf8)
        defer { try? FileManager.default.removeItem(at: configURL) }
        setenv("AWS_CONFIG_FILE", configURL.path, 1)
        let options = try AWSClientConfigDefaultsProvider.retryStrategyOptions(nil, nil, sdkID: "DynamoDB")
        XCTAssertEqual(options.maxRetriesBase, 1)
    }

    func test_dynamoDB_legacy_defaultsToThreeAttempts() throws {
        let options = try AWSClientConfigDefaultsProvider.retryStrategyOptions(.legacy, nil, sdkID: "DynamoDB")
        XCTAssertEqual(options.maxRetriesBase, 2)
        XCTAssertFalse(options.useNewRetries2026)
    }

    // MARK: - DefaultAWSClientPlugin

    func test_defaultAWSClientPlugin_dynamoDB_defaultsToFourAttempts() async throws {
        var config = try TestAWSClientConfiguration()
        try await DefaultAWSClientPlugin(clientName: "DynamoDBClient", sdkID: "DynamoDB")
            .configureClient(clientConfiguration: &config)
        XCTAssertEqual(config.retryStrategyOptions.maxRetriesBase, 3)
        XCTAssertTrue(config.retryStrategyOptions.useNewRetries2026)
    }

    func test_defaultAWSClientPlugin_withoutSDKID_defaultsToThreeAttempts() async throws {
        var config = try TestAWSClientConfiguration()
        try await DefaultAWSClientPlugin(clientName: "S3Client").configureClient(clientConfiguration: &config)
        XCTAssertEqual(config.retryStrategyOptions.maxRetriesBase, 2)
        XCTAssertTrue(config.retryStrategyOptions.useNewRetries2026)
    }

    func test_defaultAWSClientPlugin_legacy_doesNotUseNewRetries() async throws {
        var config = try TestAWSClientConfiguration()
        config.awsRetryMode = .legacy
        try await DefaultAWSClientPlugin(clientName: "DynamoDBClient", sdkID: "DynamoDB")
            .configureClient(clientConfiguration: &config)
        XCTAssertEqual(config.retryStrategyOptions.maxRetriesBase, 2)
        XCTAssertFalse(config.retryStrategyOptions.useNewRetries2026)
    }
}

/// A minimal AWS client configuration for exercising `DefaultAWSClientPlugin`.
private struct TestAWSClientConfiguration: DefaultClientConfiguration,
    AWSDefaultClientConfiguration, AWSRegionClientConfiguration {
    var retryStrategyOptions: RetryStrategyOptions
    var logger: LogAgent
    var clientLogMode: ClientLogMode = .none
    var endpoint: String?
    var idempotencyTokenGenerator: IdempotencyTokenGenerator = DefaultIdempotencyTokenGenerator()
    var telemetryProvider: TelemetryProvider = DefaultTelemetry.provider
    var awsCredentialIdentityResolver: any AWSCredentialIdentityResolver =
        StaticAWSCredentialIdentityResolver(AWSCredentialIdentity(accessKey: "AKID", secret: "SECRET"))
    var authSchemePreference: [String]?
    var useFIPS: Bool?
    var useDualStack: Bool?
    var appID: String?
    var awsRetryMode: AWSRetryMode = .standard
    var maxAttempts: Int?
    var requestChecksumCalculation: AWSChecksumCalculationMode = .whenSupported
    var responseChecksumValidation: AWSChecksumCalculationMode = .whenSupported
    var ignoreConfiguredEndpointURLs: Bool?
    var region: String? = "us-east-1"
    var signingRegion: String? = "us-east-1"

    init() throws {
        // Start from options that the plugin must replace.
        self.retryStrategyOptions = RetryStrategyOptions(
            backoffStrategy: ExponentialBackoffStrategy(),
            maxRetriesBase: 9,
            useNewRetries2026: false
        )
        self.logger = DefaultTelemetry.provider.loggerProvider.getLogger(name: "TestAWSClientConfiguration")
    }

    mutating func addInterceptorProvider(_ provider: InterceptorProvider) {}
}
