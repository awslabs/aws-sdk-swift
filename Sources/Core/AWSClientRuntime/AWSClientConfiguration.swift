/*
 * Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
 * SPDX-License-Identifier: Apache-2.0.
 */

import ClientRuntime

public class AWSClientConfiguration<ClientRetryStrategy: RetryStrategy, ClientRetryErrorInfoProvider: RetryErrorInfoProvider, ServiceSpecificConfiguration: AWSServiceSpecificConfiguration> {
    public typealias SDKRetryStrategy = ClientRetryStrategy
    public typealias SDKRetryErrorInfoProvider = ClientRetryErrorInfoProvider

    public var encoder: RequestEncoder?
    public var decoder: ResponseDecoder?
    public var httpClientEngine: HttpClientEngine
    public var httpClientConfiguration: HttpClientConfiguration
    public var idempotencyTokenGenerator: IdempotencyTokenGenerator
    public var logger: LogAgent
    public var clientLogMode: ClientLogMode
    public var retryStrategyOptions: RetryStrategyOptions
    public var endpoint: String?

    public var credentialsProvider: CredentialsProviding
    public var region: String?
    public var signingRegion: String?
    public var frameworkMetadata: FrameworkMetadata?
    public var useFIPS: Bool?
    public var useDualStack: Bool?

    public var serviceSpecific: ServiceSpecificConfiguration

    /// Internal designated init
    /// All convenience inits should call this.
    init(
        // these params have no label to distinguish this init from the similar convenience inits below
        _ credentialsProvider: AWSClientRuntime.CredentialsProviding,
        _ endpoint: Swift.String?,
        _ serviceSpecific: ServiceSpecificConfiguration?,
        _ frameworkMetadata: AWSClientRuntime.FrameworkMetadata?,
        _ region: Swift.String?,
        _ signingRegion: Swift.String?,
        _ useDualStack: Swift.Bool?,
        _ useFIPS: Swift.Bool?
    ) throws {
        typealias RuntimeConfigType = DefaultSDKRuntimeConfiguration<ClientRetryStrategy, ClientRetryErrorInfoProvider>

        self.credentialsProvider = credentialsProvider
        self.serviceSpecific = try serviceSpecific ?? ServiceSpecificConfiguration(endpointResolver: nil)
        self.frameworkMetadata = frameworkMetadata
        self.region = region
        self.signingRegion = signingRegion ?? region
        self.useDualStack = useDualStack
        self.useFIPS = useFIPS
        self.clientLogMode = RuntimeConfigType.defaultClientLogMode
        self.decoder = nil
        self.encoder = nil
        self.httpClientConfiguration = RuntimeConfigType.defaultHttpClientConfiguration
        self.httpClientEngine = RuntimeConfigType.defaultHttpClientEngine
        self.idempotencyTokenGenerator = RuntimeConfigType.defaultIdempotencyTokenGenerator
        self.logger = RuntimeConfigType.defaultLogger(clientName: self.serviceSpecific.clientName)
        self.retryStrategyOptions = RuntimeConfigType.defaultRetryStrategyOptions
    }

}

extension AWSClientConfiguration {

    public convenience init(region: String) throws {
        try self.init(region: region, serviceSpecific: try ServiceSpecificConfiguration(endpointResolver: nil))
    }

    public convenience init() async throws {
        try await self.init(serviceSpecific: try ServiceSpecificConfiguration(endpointResolver: nil), regionResolver: nil)
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
        useFIPS: Swift.Bool? = nil
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

        try self.init(
            resolvedCredentialsProvider,
            endpoint,
            serviceSpecific,
            frameworkMetadata,
            resolvedRegion,
            signingRegion,
            useDualStack,
            useFIPS
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
        useFIPS: Swift.Bool? = nil
    ) throws {
        let resolvedCredentialsProvider: CredentialsProviding
        if let credentialsProvider = credentialsProvider {
            resolvedCredentialsProvider = credentialsProvider
        } else {
            let fileBasedConfig = try CRTFileBasedConfiguration.make()
            resolvedCredentialsProvider = try DefaultChainCredentialsProvider(fileBasedConfig: fileBasedConfig)
        }

        try self.init(
            resolvedCredentialsProvider,
            endpoint,
            serviceSpecific,
            frameworkMetadata,
            region,
            signingRegion,
            useDualStack,
            useFIPS
        )
    }

    public var partitionID: String? {
        return "\(serviceSpecific.clientName) - \(region ?? "")"
    }
}
