//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

// Code generated by smithy-swift-codegen. DO NOT EDIT!

import class AWSClientRuntime.AWSClientConfigDefaultsProvider
import class AWSClientRuntime.AmzSdkRequestMiddleware
import class AWSClientRuntime.DefaultAWSClientPlugin
import class AWSSDKIdentity.DefaultAWSCredentialIdentityResolverChain
import class ClientRuntime.ClientBuilder
import class ClientRuntime.DefaultClientPlugin
import class ClientRuntime.HttpClientConfiguration
import class ClientRuntime.OrchestratorBuilder
import class ClientRuntime.OrchestratorTelemetry
import class ClientRuntime.SdkHttpClient
import class Smithy.Context
import class Smithy.ContextBuilder
import class SmithyHTTPAPI.HTTPRequest
import class SmithyHTTPAPI.HTTPResponse
@_spi(SmithyReadWrite) import class SmithyJSON.Writer
import enum AWSClientRuntime.AWSRetryErrorInfoProvider
import enum AWSClientRuntime.AWSRetryMode
import enum AWSSDKChecksums.AWSChecksumCalculationMode
import enum ClientRuntime.ClientLogMode
import enum ClientRuntime.DefaultTelemetry
import enum ClientRuntime.OrchestratorMetricsAttributesKeys
import protocol AWSClientRuntime.AWSDefaultClientConfiguration
import protocol AWSClientRuntime.AWSRegionClientConfiguration
import protocol ClientRuntime.Client
import protocol ClientRuntime.DefaultClientConfiguration
import protocol ClientRuntime.DefaultHttpClientConfiguration
import protocol ClientRuntime.HttpInterceptorProvider
import protocol ClientRuntime.IdempotencyTokenGenerator
import protocol ClientRuntime.InterceptorProvider
import protocol ClientRuntime.TelemetryProvider
import protocol Smithy.LogAgent
import protocol SmithyHTTPAPI.HTTPClient
import protocol SmithyHTTPAuthAPI.AuthSchemeResolver
import protocol SmithyIdentity.AWSCredentialIdentityResolver
import protocol SmithyIdentity.BearerTokenIdentityResolver
@_spi(SmithyReadWrite) import protocol SmithyReadWrite.SmithyWriter
@_spi(AWSEndpointResolverMiddleware) import struct AWSClientRuntime.AWSEndpointResolverMiddleware
import struct AWSClientRuntime.AmzSdkInvocationIdMiddleware
import struct AWSClientRuntime.UserAgentMiddleware
import struct AWSClientRuntime.XAmzTargetMiddleware
import struct AWSSDKHTTPAuth.SigV4AuthScheme
import struct ClientRuntime.AuthSchemeMiddleware
@_spi(SmithyReadWrite) import struct ClientRuntime.BodyMiddleware
import struct ClientRuntime.ContentLengthMiddleware
import struct ClientRuntime.ContentTypeMiddleware
@_spi(SmithyReadWrite) import struct ClientRuntime.DeserializeMiddleware
import struct ClientRuntime.LoggerMiddleware
import struct ClientRuntime.SignerMiddleware
import struct ClientRuntime.URLHostMiddleware
import struct ClientRuntime.URLPathMiddleware
import struct Smithy.Attributes
import struct SmithyIdentity.BearerTokenIdentity
import struct SmithyIdentity.StaticBearerTokenIdentityResolver
import struct SmithyRetries.DefaultRetryStrategy
import struct SmithyRetriesAPI.RetryStrategyOptions
import typealias SmithyHTTPAuthAPI.AuthSchemes

public class FreeTierClient: ClientRuntime.Client {
    public static let clientName = "FreeTierClient"
    public static let version = "1.3.50"
    let client: ClientRuntime.SdkHttpClient
    let config: FreeTierClient.FreeTierClientConfiguration
    let serviceName = "FreeTier"

    public required init(config: FreeTierClient.FreeTierClientConfiguration) {
        client = ClientRuntime.SdkHttpClient(engine: config.httpClientEngine, config: config.httpClientConfiguration)
        self.config = config
    }

    public convenience init(region: Swift.String) throws {
        let config = try FreeTierClient.FreeTierClientConfiguration(region: region)
        self.init(config: config)
    }

    public convenience required init() async throws {
        let config = try await FreeTierClient.FreeTierClientConfiguration()
        self.init(config: config)
    }
}

extension FreeTierClient {

    public class FreeTierClientConfiguration: AWSClientRuntime.AWSDefaultClientConfiguration & AWSClientRuntime.AWSRegionClientConfiguration & ClientRuntime.DefaultClientConfiguration & ClientRuntime.DefaultHttpClientConfiguration {
        public var useFIPS: Swift.Bool?
        public var useDualStack: Swift.Bool?
        public var appID: Swift.String?
        public var awsCredentialIdentityResolver: any SmithyIdentity.AWSCredentialIdentityResolver
        public var awsRetryMode: AWSClientRuntime.AWSRetryMode
        public var maxAttempts: Swift.Int?
        public var requestChecksumCalculation: AWSSDKChecksums.AWSChecksumCalculationMode
        public var responseChecksumValidation: AWSSDKChecksums.AWSChecksumCalculationMode
        public var ignoreConfiguredEndpointURLs: Swift.Bool?
        public var region: Swift.String?
        public var signingRegion: Swift.String?
        public var endpointResolver: EndpointResolver
        public var telemetryProvider: ClientRuntime.TelemetryProvider
        public var retryStrategyOptions: SmithyRetriesAPI.RetryStrategyOptions
        public var clientLogMode: ClientRuntime.ClientLogMode
        public var endpoint: Swift.String?
        public var idempotencyTokenGenerator: ClientRuntime.IdempotencyTokenGenerator
        public var httpClientEngine: SmithyHTTPAPI.HTTPClient
        public var httpClientConfiguration: ClientRuntime.HttpClientConfiguration
        public var authSchemes: SmithyHTTPAuthAPI.AuthSchemes?
        public var authSchemePreference: [String]?
        public var authSchemeResolver: SmithyHTTPAuthAPI.AuthSchemeResolver
        public var bearerTokenIdentityResolver: any SmithyIdentity.BearerTokenIdentityResolver
        public private(set) var interceptorProviders: [ClientRuntime.InterceptorProvider]
        public private(set) var httpInterceptorProviders: [ClientRuntime.HttpInterceptorProvider]
        public let logger: Smithy.LogAgent

        private init(
            _ useFIPS: Swift.Bool?,
            _ useDualStack: Swift.Bool?,
            _ appID: Swift.String?,
            _ awsCredentialIdentityResolver: any SmithyIdentity.AWSCredentialIdentityResolver,
            _ awsRetryMode: AWSClientRuntime.AWSRetryMode,
            _ maxAttempts: Swift.Int?,
            _ requestChecksumCalculation: AWSSDKChecksums.AWSChecksumCalculationMode,
            _ responseChecksumValidation: AWSSDKChecksums.AWSChecksumCalculationMode,
            _ ignoreConfiguredEndpointURLs: Swift.Bool?,
            _ region: Swift.String?,
            _ signingRegion: Swift.String?,
            _ endpointResolver: EndpointResolver,
            _ telemetryProvider: ClientRuntime.TelemetryProvider,
            _ retryStrategyOptions: SmithyRetriesAPI.RetryStrategyOptions,
            _ clientLogMode: ClientRuntime.ClientLogMode,
            _ endpoint: Swift.String?,
            _ idempotencyTokenGenerator: ClientRuntime.IdempotencyTokenGenerator,
            _ httpClientEngine: SmithyHTTPAPI.HTTPClient,
            _ httpClientConfiguration: ClientRuntime.HttpClientConfiguration,
            _ authSchemes: SmithyHTTPAuthAPI.AuthSchemes?,
            _ authSchemePreference: [String]?,
            _ authSchemeResolver: SmithyHTTPAuthAPI.AuthSchemeResolver,
            _ bearerTokenIdentityResolver: any SmithyIdentity.BearerTokenIdentityResolver,
            _ interceptorProviders: [ClientRuntime.InterceptorProvider],
            _ httpInterceptorProviders: [ClientRuntime.HttpInterceptorProvider]
        ) {
            self.useFIPS = useFIPS
            self.useDualStack = useDualStack
            self.appID = appID
            self.awsCredentialIdentityResolver = awsCredentialIdentityResolver
            self.awsRetryMode = awsRetryMode
            self.maxAttempts = maxAttempts
            self.requestChecksumCalculation = requestChecksumCalculation
            self.responseChecksumValidation = responseChecksumValidation
            self.ignoreConfiguredEndpointURLs = ignoreConfiguredEndpointURLs
            self.region = region
            self.signingRegion = signingRegion
            self.endpointResolver = endpointResolver
            self.telemetryProvider = telemetryProvider
            self.retryStrategyOptions = retryStrategyOptions
            self.clientLogMode = clientLogMode
            self.endpoint = endpoint
            self.idempotencyTokenGenerator = idempotencyTokenGenerator
            self.httpClientEngine = httpClientEngine
            self.httpClientConfiguration = httpClientConfiguration
            self.authSchemes = authSchemes
            self.authSchemePreference = authSchemePreference
            self.authSchemeResolver = authSchemeResolver
            self.bearerTokenIdentityResolver = bearerTokenIdentityResolver
            self.interceptorProviders = interceptorProviders
            self.httpInterceptorProviders = httpInterceptorProviders
            self.logger = telemetryProvider.loggerProvider.getLogger(name: FreeTierClient.clientName)
        }

        public convenience init(
            useFIPS: Swift.Bool? = nil,
            useDualStack: Swift.Bool? = nil,
            appID: Swift.String? = nil,
            awsCredentialIdentityResolver: (any SmithyIdentity.AWSCredentialIdentityResolver)? = nil,
            awsRetryMode: AWSClientRuntime.AWSRetryMode? = nil,
            maxAttempts: Swift.Int? = nil,
            requestChecksumCalculation: AWSSDKChecksums.AWSChecksumCalculationMode? = nil,
            responseChecksumValidation: AWSSDKChecksums.AWSChecksumCalculationMode? = nil,
            ignoreConfiguredEndpointURLs: Swift.Bool? = nil,
            region: Swift.String? = nil,
            signingRegion: Swift.String? = nil,
            endpointResolver: EndpointResolver? = nil,
            telemetryProvider: ClientRuntime.TelemetryProvider? = nil,
            retryStrategyOptions: SmithyRetriesAPI.RetryStrategyOptions? = nil,
            clientLogMode: ClientRuntime.ClientLogMode? = nil,
            endpoint: Swift.String? = nil,
            idempotencyTokenGenerator: ClientRuntime.IdempotencyTokenGenerator? = nil,
            httpClientEngine: SmithyHTTPAPI.HTTPClient? = nil,
            httpClientConfiguration: ClientRuntime.HttpClientConfiguration? = nil,
            authSchemes: SmithyHTTPAuthAPI.AuthSchemes? = nil,
            authSchemePreference: [String]? = nil,
            authSchemeResolver: SmithyHTTPAuthAPI.AuthSchemeResolver? = nil,
            bearerTokenIdentityResolver: (any SmithyIdentity.BearerTokenIdentityResolver)? = nil,
            interceptorProviders: [ClientRuntime.InterceptorProvider]? = nil,
            httpInterceptorProviders: [ClientRuntime.HttpInterceptorProvider]? = nil
        ) throws {
            self.init(
                useFIPS,
                useDualStack,
                try appID ?? AWSClientRuntime.AWSClientConfigDefaultsProvider.appID(),
                awsCredentialIdentityResolver ?? AWSSDKIdentity.DefaultAWSCredentialIdentityResolverChain(),
                try awsRetryMode ?? AWSClientRuntime.AWSClientConfigDefaultsProvider.retryMode(),
                maxAttempts,
                try requestChecksumCalculation ?? AWSClientRuntime.AWSClientConfigDefaultsProvider.requestChecksumCalculation(requestChecksumCalculation),
                try responseChecksumValidation ?? AWSClientRuntime.AWSClientConfigDefaultsProvider.responseChecksumValidation(responseChecksumValidation),
                ignoreConfiguredEndpointURLs,
                region,
                signingRegion,
                try endpointResolver ?? DefaultEndpointResolver(),
                telemetryProvider ?? ClientRuntime.DefaultTelemetry.provider,
                try retryStrategyOptions ?? AWSClientConfigDefaultsProvider.retryStrategyOptions(awsRetryMode, maxAttempts),
                clientLogMode ?? AWSClientConfigDefaultsProvider.clientLogMode(),
                endpoint,
                idempotencyTokenGenerator ?? AWSClientConfigDefaultsProvider.idempotencyTokenGenerator(),
                httpClientEngine ?? AWSClientConfigDefaultsProvider.httpClientEngine(httpClientConfiguration),
                httpClientConfiguration ?? AWSClientConfigDefaultsProvider.httpClientConfiguration(),
                authSchemes ?? [AWSSDKHTTPAuth.SigV4AuthScheme()],
                authSchemePreference ?? nil,
                authSchemeResolver ?? DefaultFreeTierAuthSchemeResolver(),
                bearerTokenIdentityResolver ?? SmithyIdentity.StaticBearerTokenIdentityResolver(token: SmithyIdentity.BearerTokenIdentity(token: "")),
                interceptorProviders ?? [],
                httpInterceptorProviders ?? []
            )
        }

        public convenience init(
            useFIPS: Swift.Bool? = nil,
            useDualStack: Swift.Bool? = nil,
            appID: Swift.String? = nil,
            awsCredentialIdentityResolver: (any SmithyIdentity.AWSCredentialIdentityResolver)? = nil,
            awsRetryMode: AWSClientRuntime.AWSRetryMode? = nil,
            maxAttempts: Swift.Int? = nil,
            requestChecksumCalculation: AWSSDKChecksums.AWSChecksumCalculationMode? = nil,
            responseChecksumValidation: AWSSDKChecksums.AWSChecksumCalculationMode? = nil,
            ignoreConfiguredEndpointURLs: Swift.Bool? = nil,
            region: Swift.String? = nil,
            signingRegion: Swift.String? = nil,
            endpointResolver: EndpointResolver? = nil,
            telemetryProvider: ClientRuntime.TelemetryProvider? = nil,
            retryStrategyOptions: SmithyRetriesAPI.RetryStrategyOptions? = nil,
            clientLogMode: ClientRuntime.ClientLogMode? = nil,
            endpoint: Swift.String? = nil,
            idempotencyTokenGenerator: ClientRuntime.IdempotencyTokenGenerator? = nil,
            httpClientEngine: SmithyHTTPAPI.HTTPClient? = nil,
            httpClientConfiguration: ClientRuntime.HttpClientConfiguration? = nil,
            authSchemes: SmithyHTTPAuthAPI.AuthSchemes? = nil,
            authSchemePreference: [String]? = nil,
            authSchemeResolver: SmithyHTTPAuthAPI.AuthSchemeResolver? = nil,
            bearerTokenIdentityResolver: (any SmithyIdentity.BearerTokenIdentityResolver)? = nil,
            interceptorProviders: [ClientRuntime.InterceptorProvider]? = nil,
            httpInterceptorProviders: [ClientRuntime.HttpInterceptorProvider]? = nil
        ) async throws {
            self.init(
                useFIPS,
                useDualStack,
                try appID ?? AWSClientRuntime.AWSClientConfigDefaultsProvider.appID(),
                awsCredentialIdentityResolver ?? AWSSDKIdentity.DefaultAWSCredentialIdentityResolverChain(),
                try awsRetryMode ?? AWSClientRuntime.AWSClientConfigDefaultsProvider.retryMode(),
                maxAttempts,
                try requestChecksumCalculation ?? AWSClientRuntime.AWSClientConfigDefaultsProvider.requestChecksumCalculation(requestChecksumCalculation),
                try responseChecksumValidation ?? AWSClientRuntime.AWSClientConfigDefaultsProvider.responseChecksumValidation(responseChecksumValidation),
                ignoreConfiguredEndpointURLs,
                try await AWSClientRuntime.AWSClientConfigDefaultsProvider.region(region),
                try await AWSClientRuntime.AWSClientConfigDefaultsProvider.region(region),
                try endpointResolver ?? DefaultEndpointResolver(),
                telemetryProvider ?? ClientRuntime.DefaultTelemetry.provider,
                try retryStrategyOptions ?? AWSClientConfigDefaultsProvider.retryStrategyOptions(awsRetryMode, maxAttempts),
                clientLogMode ?? AWSClientConfigDefaultsProvider.clientLogMode(),
                endpoint,
                idempotencyTokenGenerator ?? AWSClientConfigDefaultsProvider.idempotencyTokenGenerator(),
                httpClientEngine ?? AWSClientConfigDefaultsProvider.httpClientEngine(httpClientConfiguration),
                httpClientConfiguration ?? AWSClientConfigDefaultsProvider.httpClientConfiguration(),
                authSchemes ?? [AWSSDKHTTPAuth.SigV4AuthScheme()],
                authSchemePreference ?? nil,
                authSchemeResolver ?? DefaultFreeTierAuthSchemeResolver(),
                bearerTokenIdentityResolver ?? SmithyIdentity.StaticBearerTokenIdentityResolver(token: SmithyIdentity.BearerTokenIdentity(token: "")),
                interceptorProviders ?? [],
                httpInterceptorProviders ?? []
            )
        }

        public convenience required init() async throws {
            try await self.init(
                useFIPS: nil,
                useDualStack: nil,
                appID: nil,
                awsCredentialIdentityResolver: nil,
                awsRetryMode: nil,
                maxAttempts: nil,
                requestChecksumCalculation: nil,
                responseChecksumValidation: nil,
                ignoreConfiguredEndpointURLs: nil,
                region: nil,
                signingRegion: nil,
                endpointResolver: nil,
                telemetryProvider: nil,
                retryStrategyOptions: nil,
                clientLogMode: nil,
                endpoint: nil,
                idempotencyTokenGenerator: nil,
                httpClientEngine: nil,
                httpClientConfiguration: nil,
                authSchemes: nil,
                authSchemePreference: nil,
                authSchemeResolver: nil,
                bearerTokenIdentityResolver: nil,
                interceptorProviders: nil,
                httpInterceptorProviders: nil
            )
        }

        public convenience init(region: Swift.String) throws {
            self.init(
                nil,
                nil,
                try AWSClientRuntime.AWSClientConfigDefaultsProvider.appID(),
                AWSSDKIdentity.DefaultAWSCredentialIdentityResolverChain(),
                try AWSClientRuntime.AWSClientConfigDefaultsProvider.retryMode(),
                nil,
                try AWSClientConfigDefaultsProvider.requestChecksumCalculation(),
                try AWSClientConfigDefaultsProvider.responseChecksumValidation(),
                nil,
                region,
                region,
                try DefaultEndpointResolver(),
                ClientRuntime.DefaultTelemetry.provider,
                try AWSClientConfigDefaultsProvider.retryStrategyOptions(),
                AWSClientConfigDefaultsProvider.clientLogMode(),
                nil,
                AWSClientConfigDefaultsProvider.idempotencyTokenGenerator(),
                AWSClientConfigDefaultsProvider.httpClientEngine(),
                AWSClientConfigDefaultsProvider.httpClientConfiguration(),
                [AWSSDKHTTPAuth.SigV4AuthScheme()],
                nil,
                DefaultFreeTierAuthSchemeResolver(),
                SmithyIdentity.StaticBearerTokenIdentityResolver(token: SmithyIdentity.BearerTokenIdentity(token: "")),
                [],
                []
            )
        }

        public var partitionID: String? {
            return "\(FreeTierClient.clientName) - \(region ?? "")"
        }

        public func addInterceptorProvider(_ provider: ClientRuntime.InterceptorProvider) {
            self.interceptorProviders.append(provider)
        }

        public func addInterceptorProvider(_ provider: ClientRuntime.HttpInterceptorProvider) {
            self.httpInterceptorProviders.append(provider)
        }

    }

    public static func builder() -> ClientRuntime.ClientBuilder<FreeTierClient> {
        return ClientRuntime.ClientBuilder<FreeTierClient>(defaultPlugins: [
            ClientRuntime.DefaultClientPlugin(),
            AWSClientRuntime.DefaultAWSClientPlugin(clientName: self.clientName),
            DefaultAWSAuthSchemePlugin()
        ])
    }
}

extension FreeTierClient {
    /// Performs the `GetFreeTierUsage` operation on the `FreeTier` service.
    ///
    /// Returns a list of all Free Tier usage objects that match your filters.
    ///
    /// - Parameter GetFreeTierUsageInput : [no documentation found]
    ///
    /// - Returns: `GetFreeTierUsageOutput` : [no documentation found]
    ///
    /// - Throws: One of the exceptions listed below __Possible Exceptions__.
    ///
    /// __Possible Exceptions:__
    /// - `InternalServerException` : An unexpected error occurred during the processing of your request.
    /// - `ThrottlingException` : The request was denied due to request throttling.
    /// - `ValidationException` : The input fails to satisfy the constraints specified by an Amazon Web Service.
    public func getFreeTierUsage(input: GetFreeTierUsageInput) async throws -> GetFreeTierUsageOutput {
        let context = Smithy.ContextBuilder()
                      .withMethod(value: .post)
                      .withServiceName(value: serviceName)
                      .withOperation(value: "getFreeTierUsage")
                      .withUnsignedPayloadTrait(value: false)
                      .withSmithyDefaultConfig(config)
                      .withIdentityResolver(value: config.awsCredentialIdentityResolver, schemeID: "aws.auth#sigv4a")
                      .withRegion(value: config.region)
                      .withRequestChecksumCalculation(value: config.requestChecksumCalculation)
                      .withResponseChecksumValidation(value: config.responseChecksumValidation)
                      .withSigningName(value: "freetier")
                      .withSigningRegion(value: config.signingRegion)
                      .build()
        let builder = ClientRuntime.OrchestratorBuilder<GetFreeTierUsageInput, GetFreeTierUsageOutput, SmithyHTTPAPI.HTTPRequest, SmithyHTTPAPI.HTTPResponse>()
        config.interceptorProviders.forEach { provider in
            builder.interceptors.add(provider.create())
        }
        config.httpInterceptorProviders.forEach { provider in
            builder.interceptors.add(provider.create())
        }
        builder.interceptors.add(ClientRuntime.URLPathMiddleware<GetFreeTierUsageInput, GetFreeTierUsageOutput>(GetFreeTierUsageInput.urlPathProvider(_:)))
        builder.interceptors.add(ClientRuntime.URLHostMiddleware<GetFreeTierUsageInput, GetFreeTierUsageOutput>())
        builder.interceptors.add(ClientRuntime.ContentLengthMiddleware<GetFreeTierUsageInput, GetFreeTierUsageOutput>())
        builder.deserialize(ClientRuntime.DeserializeMiddleware<GetFreeTierUsageOutput>(GetFreeTierUsageOutput.httpOutput(from:), GetFreeTierUsageOutputError.httpError(from:)))
        builder.interceptors.add(ClientRuntime.LoggerMiddleware<GetFreeTierUsageInput, GetFreeTierUsageOutput>(clientLogMode: config.clientLogMode))
        builder.retryStrategy(SmithyRetries.DefaultRetryStrategy(options: config.retryStrategyOptions))
        builder.retryErrorInfoProvider(AWSClientRuntime.AWSRetryErrorInfoProvider.errorInfo(for:))
        builder.applySigner(ClientRuntime.SignerMiddleware<GetFreeTierUsageOutput>())
        let configuredEndpoint = try config.endpoint ?? AWSClientRuntime.AWSClientConfigDefaultsProvider.configuredEndpoint("FreeTier", config.ignoreConfiguredEndpointURLs)
        let endpointParamsBlock = { [config] (context: Smithy.Context) in
            EndpointParams(endpoint: configuredEndpoint, region: config.region, useFIPS: config.useFIPS ?? false)
        }
        builder.applyEndpoint(AWSClientRuntime.AWSEndpointResolverMiddleware<GetFreeTierUsageOutput, EndpointParams>(paramsBlock: endpointParamsBlock, resolverBlock: { [config] in try config.endpointResolver.resolve(params: $0) }))
        builder.interceptors.add(AWSClientRuntime.XAmzTargetMiddleware<GetFreeTierUsageInput, GetFreeTierUsageOutput>(xAmzTarget: "AWSFreeTierService.GetFreeTierUsage"))
        builder.serialize(ClientRuntime.BodyMiddleware<GetFreeTierUsageInput, GetFreeTierUsageOutput, SmithyJSON.Writer>(rootNodeInfo: "", inputWritingClosure: GetFreeTierUsageInput.write(value:to:)))
        builder.interceptors.add(ClientRuntime.ContentTypeMiddleware<GetFreeTierUsageInput, GetFreeTierUsageOutput>(contentType: "application/x-amz-json-1.0"))
        builder.selectAuthScheme(ClientRuntime.AuthSchemeMiddleware<GetFreeTierUsageOutput>())
        builder.interceptors.add(AWSClientRuntime.AmzSdkInvocationIdMiddleware<GetFreeTierUsageInput, GetFreeTierUsageOutput>())
        builder.interceptors.add(AWSClientRuntime.AmzSdkRequestMiddleware<GetFreeTierUsageInput, GetFreeTierUsageOutput>(maxRetries: config.retryStrategyOptions.maxRetriesBase))
        builder.interceptors.add(AWSClientRuntime.UserAgentMiddleware<GetFreeTierUsageInput, GetFreeTierUsageOutput>(serviceID: serviceName, version: FreeTierClient.version, config: config))
        var metricsAttributes = Smithy.Attributes()
        metricsAttributes.set(key: ClientRuntime.OrchestratorMetricsAttributesKeys.service, value: "FreeTier")
        metricsAttributes.set(key: ClientRuntime.OrchestratorMetricsAttributesKeys.method, value: "GetFreeTierUsage")
        let op = builder.attributes(context)
            .telemetry(ClientRuntime.OrchestratorTelemetry(
                telemetryProvider: config.telemetryProvider,
                metricsAttributes: metricsAttributes,
                meterScope: serviceName,
                tracerScope: serviceName
            ))
            .executeRequest(client)
            .build()
        return try await op.execute(input: input)
    }
}
