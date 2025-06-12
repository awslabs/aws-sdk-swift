//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

@_spi(FileBasedConfig) import class AWSSDKCommon.CRTFileBasedConfiguration
import struct SmithyRetries.ExponentialBackoffStrategy
import struct SmithyRetriesAPI.RetryStrategyOptions
import enum AWSSDKChecksums.AWSChecksumCalculationMode
import class ClientRuntime.ClientConfigDefaultsProvider

/// Provides default configuration properties for AWS services.
public class AWSClientConfigDefaultsProvider: ClientConfigDefaultsProvider {
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

    public static func authSchemePreference(_ preference: String? = nil) throws -> [String]? {
        let fileBasedConfig = try CRTFileBasedConfiguration.make()
        let resolvedPreference: [String]?
        if let authSchemePreference = preference {
            resolvedPreference = AuthSchemeConfig.normalizeSchemes(authSchemePreference)
        } else {
            resolvedPreference = AuthSchemeConfig.authSchemePreference(
                configValue: nil,
                profileName: nil,
                fileBasedConfig: fileBasedConfig
            )
        }
        return resolvedPreference
    }

    public static func requestChecksumCalculation(
        _ requestChecksumCalculation: AWSChecksumCalculationMode? = nil
    ) throws -> AWSChecksumCalculationMode {
        let fileBasedConfig = try CRTFileBasedConfiguration.make()
        let resolvedRequestChecksumCalculation: AWSChecksumCalculationMode
        if let requestChecksumCalculation {
            resolvedRequestChecksumCalculation = requestChecksumCalculation
        } else {
            resolvedRequestChecksumCalculation = AWSChecksumsConfig.requestChecksumCalculation(
                configValue: nil,
                profileName: nil,
                fileBasedConfig: fileBasedConfig
            )
        }
        return resolvedRequestChecksumCalculation
    }

    public static func responseChecksumValidation(
        _ responseChecksumValidation: AWSChecksumCalculationMode? = nil
    ) throws -> AWSChecksumCalculationMode {
        let fileBasedConfig = try CRTFileBasedConfiguration.make()
        let resolvedResponseChecksumValidation: AWSChecksumCalculationMode
        if let responseChecksumValidation {
            resolvedResponseChecksumValidation = responseChecksumValidation
        } else {
            resolvedResponseChecksumValidation = AWSChecksumsConfig.responseChecksumValidation(
                configValue: nil,
                profileName: nil,
                fileBasedConfig: fileBasedConfig
            )
        }
        return resolvedResponseChecksumValidation
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

    private static func maxAttempts(_ maxAttempts: Int? = nil) throws -> Int {
        let fileBasedConfig = try CRTFileBasedConfiguration.make()
        let resolvedMaxAttempts: Int?
        if let maxAttempts {
            resolvedMaxAttempts = maxAttempts
        } else {
            resolvedMaxAttempts = AWSRetryConfig.maxAttempts(
                configValue: nil,
                profileName: nil,
                fileBasedConfig: fileBasedConfig
            )
        }
        return resolvedMaxAttempts!
    }

    public static func retryStrategyOptions(
        _ retryMode: AWSRetryMode? = nil,
        _ maxAttempts: Int? = nil
    ) throws -> RetryStrategyOptions {
        let resolvedMaxAttempts = try self.maxAttempts(maxAttempts)

        let resolvedRateLimitingMode: RetryStrategyOptions.RateLimitingMode

        switch try self.retryMode(retryMode) {
        case .legacy, .standard:
            resolvedRateLimitingMode = .standard
        case .adaptive:
            resolvedRateLimitingMode = .adaptive
        }

        return RetryStrategyOptions(
            backoffStrategy: ExponentialBackoffStrategy(),
            maxRetriesBase: resolvedMaxAttempts - 1,
            rateLimitingMode: resolvedRateLimitingMode
        )
    }

    public static func configuredEndpoint(
        _ sdkID: String,
        _ ignoreConfiguredEndpointURLs: Bool? = nil
    ) throws -> String? {
        let fileBasedConfig = try CRTFileBasedConfiguration.make()
        return try AWSEndpointConfig.configuredEndpoint(
            sdkID: sdkID,
            ignoreConfiguredEndpointURLs: ignoreConfiguredEndpointURLs,
            fileBasedConfig: fileBasedConfig
        )
    }

    public static func accountIDEndpointMode(
        _ accountIDEndpointMode: AccountIDEndpointMode? = nil
    ) throws -> AccountIDEndpointMode {
        let fileBasedConfig = try CRTFileBasedConfiguration.make()
        if let accountIDEndpointMode {
            return accountIDEndpointMode
        } else {
            return AWSEndpointConfig.accountIDEndpointMode(
                configValue: accountIDEndpointMode,
                profileName: nil,
                fileBasedConfig: fileBasedConfig
            )
        }
    }
}
