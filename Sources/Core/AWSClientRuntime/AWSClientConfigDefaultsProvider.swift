//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//
import ClientRuntime

typealias RuntimeConfigType = DefaultSDKRuntimeConfiguration<DefaultRetryStrategy, DefaultRetryErrorInfoProvider>

/// Provides default configuration properties for AWS services.
public class AWSClientConfigDefaultsProvider {
    public static let httpClientEngine: HTTPClient = RuntimeConfigType.makeClient(
        httpClientConfiguration: RuntimeConfigType.defaultHttpClientConfiguration)

    public static let httpClientConfiguration: HttpClientConfiguration
        = RuntimeConfigType.defaultHttpClientConfiguration

    public static let idempotencyTokenGenerator: IdempotencyTokenGenerator
        = RuntimeConfigType.defaultIdempotencyTokenGenerator

    public static func logger(_ clientName: String) -> LogAgent {
        return RuntimeConfigType.defaultLogger(clientName: clientName)
    }

    public static let clientLogMode: ClientLogMode = RuntimeConfigType.defaultClientLogMode

    public static func awsCredentialIdentityResolver(
        _ awsCredentialIdentityResolver: (any AWSCredentialIdentityResolver)? = nil) throws -> any AWSCredentialIdentityResolver {
        let resolvedAWSCredentialIdentityResolver: any AWSCredentialIdentityResolver
        let fileBasedConfig = try CRTFileBasedConfiguration.make()
        if let awsCredentialIdentityResolver {
            resolvedAWSCredentialIdentityResolver = awsCredentialIdentityResolver
        } else {
            resolvedAWSCredentialIdentityResolver = try DefaultAWSCredentialIdentityResolverChain(fileBasedConfig: fileBasedConfig)
        }
        return resolvedAWSCredentialIdentityResolver
    }

    public static func region(_ region: String? = nil) async throws -> String? {
        let resolvedRegion: String?
        let fileBasedConfig = try await CRTFileBasedConfiguration.makeAsync()
        if let region = region {
            resolvedRegion = region
        } else {
            let regionResolver = try DefaultRegionResolver { _, _ in fileBasedConfig }
            resolvedRegion = await regionResolver.getRegion()
        }

        return resolvedRegion
    }

    public static func appID(_ appID: String? = nil) throws -> String? {
        let fileBasedConfig = try CRTFileBasedConfiguration.make()
        let resolvedAppID: String?
        if let appID = appID {
            resolvedAppID = appID
        } else {
            resolvedAppID = AppIDConfig.appID(
                configValue: nil,
                profileName: nil,
                fileBasedConfig: fileBasedConfig
            )
        }
        return resolvedAppID
    }

    public static func retryMode(_ retryMode: AWSRetryMode? = nil) throws -> AWSRetryMode {
        let fileBasedConfig = try CRTFileBasedConfiguration.make()
        let resolvedRetryMode: AWSRetryMode?
        if let retryMode = retryMode {
            resolvedRetryMode = retryMode
        } else {
            resolvedRetryMode = AWSRetryConfig.retryMode(
                configValue: nil,
                profileName: nil,
                fileBasedConfig: fileBasedConfig
            )
        }
        return resolvedRetryMode!
    }

    public static func retryStrategyOptions() throws -> RetryStrategyOptions {
        let fileBasedConfig = try CRTFileBasedConfiguration.make()
        let resolvedMaxAttempts = AWSRetryConfig.maxAttempts(
            configValue: nil,
            profileName: nil,
            fileBasedConfig: fileBasedConfig
        )

        let resolvedRateLimitingMode: RetryStrategyOptions.RateLimitingMode

        switch try self.retryMode(nil) {
        case .legacy, .standard:
            resolvedRateLimitingMode = .standard
        case .adaptive:
            resolvedRateLimitingMode = .adaptive
        }

        return RetryStrategyOptions(maxRetriesBase: resolvedMaxAttempts - 1, rateLimitingMode: resolvedRateLimitingMode)
    }
}
