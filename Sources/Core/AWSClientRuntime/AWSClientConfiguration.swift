//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import ClientRuntime

/// Provides configuration properties for AWS services.
///
/// This type is used to configure every AWS service client.  It is specialized with a `AWSServiceSpecificConfiguration` that contains
/// service-specific configuration properties.
///
/// The service-specific configuration is code-generated for each AWS service; see the generated client code for implementation.
///
/// A custom `typealias` of this type is code-generated for each AWS service; i.e.
/// ```
/// public typealias S3Client.S3ClientConfiguration = AWSClientConfiguration<S3Client.ServiceSpecificConfiguration>
/// ```
public class AWSClientConfiguration<ServiceSpecificConfiguration: AWSServiceSpecificConfiguration> {

    /// The custom encoder to be used for encoding models for transmission.
    ///
    /// If no encoder is provided, one will be provided by the SDK.
    public var encoder: RequestEncoder?

    /// The custom decoder to be used for decoding models from a response.
    ///
    /// If no decoder is provided, one will be provided by the SDK.
    public var decoder: ResponseDecoder?

    /// The HTTP client engine to be used for HTTP requests.
    ///
    /// If none is provided, AWS provides its own HTTP engine for use.
    public var httpClientEngine: HttpClientEngine

    /// Configuration for the HTTP client.
    public var httpClientConfiguration: HttpClientConfiguration

    /// A token generator to ensure idempotency of requests.
    public var idempotencyTokenGenerator: IdempotencyTokenGenerator

    /// A logger to be used by the SDK for logging events.
    public var logger: LogAgent

    /// The log level to be used when logging.
    public var clientLogMode: ClientLogMode

    /// The configuation for retry of failed network requests.
    ///
    /// Default options are provided if none are set.
    public var retryStrategyOptions: RetryStrategyOptions

    /// The network host to use.
    ///
    /// If none is provided, the SDK selects the most appropriate host for the AWS service in use
    ///
    /// Note: non-secure HTTP is not supported at this time.
    public var endpoint: String?

    /// The credentials provider to be used for AWS credentials.
    ///
    /// If no credentials provider is supplied, the SDK will look for credentials in the environment, then in the `~/.aws/credentials` file.
    public var credentialsProvider: CredentialsProviding

    /// The AWS region to use, i.e. `us-east-1` or `us-west-2`, etc.
    ///
    /// If no region is specified here, one must be specified in the `~/.aws/configuration` file.
    public var region: String?

    /// The signing region to be used for signing AWS requests.
    ///
    /// If none is specified, it is supplied by the SDK.
    public var signingRegion: String?

    /// Framework Metadata for the client.
    ///
    /// If none is supplied, the SDK will supply default metadata.
    public var frameworkMetadata: FrameworkMetadata?

    /// Specifies whether FIPS endpoints should be used.
    public var useFIPS: Bool?

    /// Specifies whether dual-stack endpoints should be used.
    public var useDualStack: Bool?

    /// A structure containing AWS service-specific properties.
    ///
    /// This structure is custom code-generated for each AWS service.
    public var serviceSpecific: ServiceSpecificConfiguration

    /// Internal designated init
    /// All convenience inits should call this.
    init(
        // these params have no labels to distinguish this init from the similar convenience inits below
        _ credentialsProvider: AWSClientRuntime.CredentialsProviding,
        _ endpoint: Swift.String?,
        _ serviceSpecific: ServiceSpecificConfiguration?,
        _ frameworkMetadata: AWSClientRuntime.FrameworkMetadata?,
        _ region: Swift.String?,
        _ signingRegion: Swift.String?,
        _ useDualStack: Swift.Bool?,
        _ useFIPS: Swift.Bool?,
        _ retryStrategyOptions: RetryStrategyOptions?
    ) throws {
        typealias RuntimeConfigType =
            DefaultSDKRuntimeConfiguration<DefaultRetryStrategy, DefaultRetryErrorInfoProvider>

        self.credentialsProvider = credentialsProvider
        self.endpoint = endpoint
        self.serviceSpecific = try serviceSpecific ?? ServiceSpecificConfiguration(endpointResolver: nil)
        self.frameworkMetadata = frameworkMetadata
        self.region = region
        self.signingRegion = signingRegion ?? region
        self.useDualStack = useDualStack
        self.useFIPS = useFIPS
        self.clientLogMode = RuntimeConfigType.defaultClientLogMode
        self.httpClientConfiguration = RuntimeConfigType.defaultHttpClientConfiguration
        self.httpClientEngine = RuntimeConfigType.defaultHttpClientEngine
        self.idempotencyTokenGenerator = RuntimeConfigType.defaultIdempotencyTokenGenerator
        self.logger = RuntimeConfigType.defaultLogger(clientName: self.serviceSpecific.clientName)
        self.retryStrategyOptions = retryStrategyOptions ?? RuntimeConfigType.defaultRetryStrategyOptions
    }
}

// MARK: - Convenience initializers

extension AWSClientConfiguration {

    public convenience init(region: String) throws {
        try self.init(region: region, serviceSpecific: try ServiceSpecificConfiguration(endpointResolver: nil))
    }

    public convenience init() async throws {
        try await self.init(serviceSpecific: try ServiceSpecificConfiguration(endpointResolver: nil))
    }

    /// Creates a configuration asynchronously
    public convenience init(
        credentialsProvider: AWSClientRuntime.CredentialsProviding? = nil,
        endpoint: Swift.String? = nil,
        serviceSpecific: ServiceSpecificConfiguration? = nil,
        frameworkMetadata: AWSClientRuntime.FrameworkMetadata? = nil,
        region: Swift.String? = nil,
        regionResolver: AWSClientRuntime.RegionResolver? = nil,
        signingRegion: Swift.String? = nil,
        useDualStack: Swift.Bool? = nil,
        useFIPS: Swift.Bool? = nil,
        retryMode: AWSRetryMode? = nil,
        maxAttempts: Int? = nil
    ) async throws {
        let fileBasedConfig = try await CRTFileBasedConfiguration.makeAsync()
        let resolvedRegionResolver = try regionResolver ?? DefaultRegionResolver { _, _ in fileBasedConfig }
        let resolvedRegion: String?
        if let region = region {
            resolvedRegion = region
        } else {
            resolvedRegion = await resolvedRegionResolver.resolveRegion()
        }
        let resolvedCredentialsProvider: AWSClientRuntime.CredentialsProviding
        if let credentialsProvider = credentialsProvider {
            resolvedCredentialsProvider = credentialsProvider
        } else {
            resolvedCredentialsProvider = try DefaultChainCredentialsProvider(fileBasedConfig: fileBasedConfig)
        }
        let retryStrategyOptions = Self.retryStrategyOptions(
            retryMode: retryMode,
            maxAttempts: maxAttempts,
            profileName: nil,
            fileBasedConfig: fileBasedConfig
        )
        try self.init(
            resolvedCredentialsProvider,
            endpoint,
            serviceSpecific,
            frameworkMetadata,
            resolvedRegion,
            signingRegion,
            useDualStack,
            useFIPS,
            retryStrategyOptions
        )
    }

    public convenience init(
        region: Swift.String,
        credentialsProvider: AWSClientRuntime.CredentialsProviding? = nil,
        endpoint: Swift.String? = nil,
        serviceSpecific: ServiceSpecificConfiguration? = nil,
        frameworkMetadata: AWSClientRuntime.FrameworkMetadata? = nil,
        signingRegion: Swift.String? = nil,
        useDualStack: Swift.Bool? = nil,
        useFIPS: Swift.Bool? = nil,
        retryMode: AWSRetryMode? = nil,
        maxAttempts: Int? = nil
    ) throws {
        let fileBasedConfig = try CRTFileBasedConfiguration.make()
        let resolvedCredentialsProvider: CredentialsProviding
        if let credentialsProvider = credentialsProvider {
            resolvedCredentialsProvider = credentialsProvider
        } else {
            resolvedCredentialsProvider = try DefaultChainCredentialsProvider(fileBasedConfig: fileBasedConfig)
        }
        let retryStrategyOptions = Self.retryStrategyOptions(
            retryMode: retryMode,
            maxAttempts: maxAttempts,
            profileName: nil,
            fileBasedConfig: fileBasedConfig
        )
        try self.init(
            resolvedCredentialsProvider,
            endpoint,
            serviceSpecific,
            frameworkMetadata,
            region,
            signingRegion,
            useDualStack,
            useFIPS,
            retryStrategyOptions
        )
    }

    public var partitionID: String? {
        return "\(serviceSpecific.clientName) - \(region ?? "")"
    }

    private static func retryStrategyOptions(
        retryMode: AWSRetryMode?,
        maxAttempts: Int?,
        profileName: String?,
        fileBasedConfig: FileBasedConfiguration
    ) -> RetryStrategyOptions {
        let resolvedRetryMode = RetryConfig.retryMode(
            configValue: retryMode,
            profileName: profileName,
            fileBasedConfig: fileBasedConfig
        )
        let resolvedMaxAttempts = RetryConfig.maxAttempts(
            configValue: maxAttempts,
            profileName: profileName,
            fileBasedConfig: fileBasedConfig
        )
        let resolvedRateLimitingMode: RetryStrategyOptions.RateLimitingMode
        switch resolvedRetryMode {
        case .legacy, .standard:
            resolvedRateLimitingMode = .standard
        case .adaptive:
            resolvedRateLimitingMode = .adaptive
        }
        return RetryStrategyOptions(maxRetriesBase: resolvedMaxAttempts - 1, rateLimitingMode: resolvedRateLimitingMode)
    }
}
