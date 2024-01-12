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

    /// The HTTP client to be used for SDK HTTP requests.
    ///
    /// If none is provided, AWS SDK for Swift selects its own HTTP client for use:
    /// - On Mac and Linux, a AWS-provided HTTP client is used for the best stability and performance with heavy AWS workloads.
    /// - On iOS, tvOS, watchOS, and visionOS, a `URLSession`-based client is used for maximum compatibility and performance on Apple devices.
    public var httpClientEngine: HTTPClient

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

    /// Specifies whether FIPS endpoints should be used.
    public var useFIPS: Bool?

    /// Specifies whether dual-stack endpoints should be used.
    public var useDualStack: Bool?

    /// An identifying string for the application being used with this SDK.
    ///
    /// This value is set after resolving app ID from the standard progression of potential sources.
    ///
    /// The application ID is submitted as part of the `user-agent` and allows for better tracking and troubleshooting.
    /// The application ID may also be retrieved from the environment variable `AWS_SDK_UA_APP_ID` or from the
    /// configuration file field `sdk_ua_app_id` if it is not set here.
    public var appID: String?

    /// The AWS retry mode to be used.
    ///
    /// This value is set after resolving retry mode from the standard progression of potential sources.
    ///
    /// May be one of `legacy`, `standard`, or `adaptive`.  `standard` and `adaptive` retry strategies are as defined in
    /// Smithy Reference Architecture.  For the Swift SDK, `legacy` is the same behavior as `standard`.
    public var awsRetryMode: AWSRetryMode

    /// A structure containing AWS service-specific properties.
    ///
    /// This structure is custom code-generated for each AWS service.
    public var serviceSpecific: ServiceSpecificConfiguration

    /// Internal designated init
    /// All convenience inits should call this.
    private init(
        // these params have no labels to distinguish this init from the similar convenience inits below
        _ credentialsProvider: AWSClientRuntime.CredentialsProviding,
        _ endpoint: Swift.String?,
        _ serviceSpecific: ServiceSpecificConfiguration?,
        _ region: Swift.String?,
        _ signingRegion: Swift.String?,
        _ useDualStack: Swift.Bool?,
        _ useFIPS: Swift.Bool?,
        _ retryStrategyOptions: RetryStrategyOptions?,
        _ appID: String?,
        _ awsRetryMode: AWSRetryMode,
        _ httpClientConfiguration: HttpClientConfiguration?
    ) throws {
        typealias RuntimeConfigType =
            DefaultSDKRuntimeConfiguration<DefaultRetryStrategy, DefaultRetryErrorInfoProvider>

        self.credentialsProvider = credentialsProvider
        self.endpoint = endpoint
        self.serviceSpecific = try serviceSpecific ?? ServiceSpecificConfiguration(endpointResolver: nil)
        self.region = region
        self.signingRegion = signingRegion ?? region
        self.useDualStack = useDualStack
        self.useFIPS = useFIPS
        self.clientLogMode = RuntimeConfigType.defaultClientLogMode
        self.httpClientConfiguration = httpClientConfiguration ?? RuntimeConfigType.defaultHttpClientConfiguration
        self.httpClientEngine = RuntimeConfigType.makeClient(httpClientConfiguration: self.httpClientConfiguration)
        self.idempotencyTokenGenerator = RuntimeConfigType.defaultIdempotencyTokenGenerator
        self.logger = RuntimeConfigType.defaultLogger(clientName: self.serviceSpecific.clientName)
        self.retryStrategyOptions = retryStrategyOptions ?? RuntimeConfigType.defaultRetryStrategyOptions
        self.appID = appID
        self.awsRetryMode = awsRetryMode
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
        region: Swift.String? = nil,
        regionResolver: AWSClientRuntime.RegionResolver? = nil,
        signingRegion: Swift.String? = nil,
        useDualStack: Swift.Bool? = nil,
        useFIPS: Swift.Bool? = nil,
        retryMode: AWSRetryMode? = nil,
        maxAttempts: Int? = nil,
        appID: String? = nil,
        httpClientConfiguration: HttpClientConfiguration? = nil
    ) async throws {
        let fileBasedConfig = try await CRTFileBasedConfiguration.makeAsync()
        let resolvedRegionResolver = try regionResolver ?? DefaultRegionResolver { _, _ in fileBasedConfig }
        let resolvedRegion: String?
        if let region = region {
            resolvedRegion = region
        } else {
            resolvedRegion = await resolvedRegionResolver.getRegion()
        }
        let resolvedCredentialsProvider: AWSClientRuntime.CredentialsProviding
        if let credentialsProvider = credentialsProvider {
            resolvedCredentialsProvider = credentialsProvider
        } else {
            resolvedCredentialsProvider = try DefaultChainCredentialsProvider(fileBasedConfig: fileBasedConfig)
        }
        let resolvedAWSRetryMode = AWSRetryConfig.retryMode(
            configValue: retryMode,
            profileName: nil,
            fileBasedConfig: fileBasedConfig
        )
        let retryStrategyOptions = Self.retryStrategyOptions(
            resolvedAWSRetryMode: resolvedAWSRetryMode,
            maxAttempts: maxAttempts,
            profileName: nil,
            fileBasedConfig: fileBasedConfig
        )
        let resolvedAppID = AppIDConfig.appID(configValue: appID, profileName: nil, fileBasedConfig: fileBasedConfig)
        try self.init(
            resolvedCredentialsProvider,
            endpoint,
            serviceSpecific,
            resolvedRegion,
            signingRegion,
            useDualStack,
            useFIPS,
            retryStrategyOptions,
            resolvedAppID,
            resolvedAWSRetryMode,
            httpClientConfiguration
        )
    }

    public convenience init(
        region: Swift.String,
        credentialsProvider: AWSClientRuntime.CredentialsProviding? = nil,
        endpoint: Swift.String? = nil,
        serviceSpecific: ServiceSpecificConfiguration? = nil,
        signingRegion: Swift.String? = nil,
        useDualStack: Swift.Bool? = nil,
        useFIPS: Swift.Bool? = nil,
        retryMode: AWSRetryMode? = nil,
        maxAttempts: Int? = nil,
        appID: String? = nil,
        httpClientConfiguration: HttpClientConfiguration? = nil
    ) throws {
        let fileBasedConfig = try CRTFileBasedConfiguration.make()
        let resolvedCredentialsProvider: CredentialsProviding
        if let credentialsProvider = credentialsProvider {
            resolvedCredentialsProvider = credentialsProvider
        } else {
            resolvedCredentialsProvider = try DefaultChainCredentialsProvider(fileBasedConfig: fileBasedConfig)
        }
        let resolvedAWSRetryMode = AWSRetryConfig.retryMode(
            configValue: retryMode,
            profileName: nil,
            fileBasedConfig: fileBasedConfig
        )
        let retryStrategyOptions = Self.retryStrategyOptions(
            resolvedAWSRetryMode: resolvedAWSRetryMode,
            maxAttempts: maxAttempts,
            profileName: nil,
            fileBasedConfig: fileBasedConfig
        )
        let resolvedAppID = AppIDConfig.appID(configValue: appID, profileName: nil, fileBasedConfig: fileBasedConfig)
        try self.init(
            resolvedCredentialsProvider,
            endpoint,
            serviceSpecific,
            region,
            signingRegion,
            useDualStack,
            useFIPS,
            retryStrategyOptions,
            resolvedAppID,
            resolvedAWSRetryMode,
            httpClientConfiguration
        )
    }

    public var partitionID: String? {
        return "\(serviceSpecific.clientName) - \(region ?? "")"
    }

    private static func retryStrategyOptions(
        resolvedAWSRetryMode: AWSRetryMode,
        maxAttempts: Int?,
        profileName: String?,
        fileBasedConfig: FileBasedConfiguration
    ) -> RetryStrategyOptions {
        let resolvedMaxAttempts = AWSRetryConfig.maxAttempts(
            configValue: maxAttempts,
            profileName: profileName,
            fileBasedConfig: fileBasedConfig
        )
        let resolvedRateLimitingMode: RetryStrategyOptions.RateLimitingMode
        switch resolvedAWSRetryMode {
        case .legacy, .standard:
            resolvedRateLimitingMode = .standard
        case .adaptive:
            resolvedRateLimitingMode = .adaptive
        }
        return RetryStrategyOptions(maxRetriesBase: resolvedMaxAttempts - 1, rateLimitingMode: resolvedRateLimitingMode)
    }
}
