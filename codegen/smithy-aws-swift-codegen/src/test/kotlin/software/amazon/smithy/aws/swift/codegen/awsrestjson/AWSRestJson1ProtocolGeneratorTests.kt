/*
 * Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
 * SPDX-License-Identifier: Apache-2.0.
 */

package software.amazon.smithy.aws.swift.codegen.awsrestjson

import io.kotest.matchers.string.shouldContainOnlyOnce
import org.junit.jupiter.api.Test
import software.amazon.smithy.aws.swift.codegen.TestContext
import software.amazon.smithy.aws.swift.codegen.TestUtils.Companion.executeDirectedCodegen
import software.amazon.smithy.aws.swift.codegen.TestUtils.Companion.getClientFileContents
import software.amazon.smithy.aws.swift.codegen.TestUtils.Companion.getModelFileContents
import software.amazon.smithy.aws.swift.codegen.protocols.restjson.AWSRestJson1ProtocolGenerator
import software.amazon.smithy.aws.swift.codegen.shouldSyntacticSanityCheck
import software.amazon.smithy.aws.traits.protocols.RestJson1Trait

class AWSRestJson1ProtocolGeneratorTests {
    @Test
    fun `define coding keys for unbound document payload members`() {
        val context = setupTests("http-binding-protocol-generator-test.smithy", "com.test#Example")
        val contents = getModelFileContents("Sources/Example", "SmokeTestInput+Write.swift", context.manifest)
        contents.shouldSyntacticSanityCheck()
        val expectedContents = """
extension SmokeTestInput {

    static func write(value: SmokeTestInput?, to writer: SmithyJSON.Writer) throws {
        guard let value else { return }
        try writer["payload1"].write(value.payload1)
        try writer["payload2"].write(value.payload2)
        try writer["payload3"].write(value.payload3, with: ExampleClientTypes.Nested.write(value:to:))
    }
}
"""
        contents.shouldContainOnlyOnce(expectedContents)
    }

    @Test
    fun `define coding keys for payload member`() {
        val context = setupTests("http-binding-protocol-generator-test.smithy", "com.test#Example")
        val contents = getModelFileContents("Sources/Example", "ExplicitBlobInput+Write.swift", context.manifest)
        contents.shouldSyntacticSanityCheck()
        val expectedContents = """
extension ExplicitBlobInput {

    static func write(value: ExplicitBlobInput?, to writer: SmithyJSON.Writer) throws {
        guard let value else { return }
        try writer["payload1"].write(value.payload1)
    }
}
"""
        contents.shouldContainOnlyOnce(expectedContents)
    }

    @Test
    fun `generated client has proper configuration`() {
        val context = setupTests("http-binding-protocol-generator-test.smithy", "com.test#Example")
        val contents = getClientFileContents("Sources/Example", "ExampleClient.swift", context.manifest)
        contents.shouldSyntacticSanityCheck()
        val expectedContents = """
public final class ExampleClient: AWSClientRuntime.AWSServiceClient {
    public static let clientName = "ExampleClient"
    let client: ClientRuntime.SdkHttpClient
    public let config: ExampleClient.ExampleClientConfig
    let serviceName = "Example"

    @available(*, deprecated, message: "Use ExampleClient.ExampleClientConfig instead")
    public typealias Config = ExampleClient.ExampleClientConfiguration
    public typealias Configuration = ExampleClient.ExampleClientConfig

    public required init(config: ExampleClient.ExampleClientConfig) {
        ClientRuntime.initialize()
        client = ClientRuntime.SdkHttpClient(engine: config.httpClientEngine, config: config.httpClientConfiguration)
        self.config = config
    }

    @available(*, deprecated, message: "Use init(config: ExampleClient.ExampleClientConfig) instead")
    public convenience init(config: ExampleClient.ExampleClientConfiguration) {
        do {
            try self.init(config: config.toSendable())
        } catch {
            // This should never happen since all values are already initialized in the class
            fatalError("Failed to convert deprecated configuration: \(error)")
        }
    }

    public convenience init(region: Swift.String) throws {
        let config = try ExampleClient.ExampleClientConfig(region: region)
        self.init(config: config)
    }

    public convenience init() async throws {
        let config = try await ExampleClient.ExampleClientConfig()
        self.init(config: config)
    }
}

extension ExampleClient {

    /// Client configuration for ExampleClient
    ///
    /// Conforms to `Sendable` for safe concurrent access across threads.
    public struct ExampleClientConfig: AWSClientRuntime.AWSDefaultClientConfiguration & AWSClientRuntime.AWSRegionClientConfiguration & ClientRuntime.DefaultClientConfiguration & ClientRuntime.DefaultHttpClientConfiguration, Swift.Sendable {
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
        // Interceptor providers with Sendable-safe internal storage
        private var _interceptorProviders: [ClientRuntime.SendableInterceptorProviderBox] = []
        public var interceptorProviders: [ClientRuntime.InterceptorProvider] {
            get {
                return _interceptorProviders
            }
            set {
                _interceptorProviders = newValue.map { ClientRuntime.SendableInterceptorProviderBox($0) }
            }
        }

        private var _httpInterceptorProviders: [ClientRuntime.SendableHttpInterceptorProviderBox] = []
        public var httpInterceptorProviders: [ClientRuntime.HttpInterceptorProvider] {
            get {
                return _httpInterceptorProviders
            }
            set {
                _httpInterceptorProviders = newValue.map { ClientRuntime.SendableHttpInterceptorProviderBox($0) }
            }
        }
        public var logger: Smithy.LogAgent

        public init(
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
            self.useFIPS = useFIPS
            self.useDualStack = useDualStack
            self.appID = try appID ?? AWSClientRuntime.AWSClientConfigDefaultsProvider.appID()
            self.awsCredentialIdentityResolver = awsCredentialIdentityResolver ?? AWSSDKIdentity.DefaultAWSCredentialIdentityResolverChain()
            self.awsRetryMode = try awsRetryMode ?? AWSClientRuntime.AWSClientConfigDefaultsProvider.retryMode()
            self.maxAttempts = maxAttempts
            self.requestChecksumCalculation = try requestChecksumCalculation ?? AWSClientRuntime.AWSClientConfigDefaultsProvider.requestChecksumCalculation(requestChecksumCalculation)
            self.responseChecksumValidation = try responseChecksumValidation ?? AWSClientRuntime.AWSClientConfigDefaultsProvider.responseChecksumValidation(responseChecksumValidation)
            self.ignoreConfiguredEndpointURLs = ignoreConfiguredEndpointURLs
            self.region = region
            self.signingRegion = signingRegion
            self.endpointResolver = try endpointResolver ?? DefaultEndpointResolver()
            self.telemetryProvider = telemetryProvider ?? ClientRuntime.DefaultTelemetry.provider
            self.retryStrategyOptions = try retryStrategyOptions ?? AWSClientConfigDefaultsProvider.retryStrategyOptions(awsRetryMode, maxAttempts)
            self.clientLogMode = clientLogMode ?? AWSClientConfigDefaultsProvider.clientLogMode()
            self.endpoint = endpoint
            self.idempotencyTokenGenerator = idempotencyTokenGenerator ?? AWSClientConfigDefaultsProvider.idempotencyTokenGenerator()
            self.httpClientEngine = httpClientEngine ?? AWSClientConfigDefaultsProvider.httpClientEngine(httpClientConfiguration)
            self.httpClientConfiguration = httpClientConfiguration ?? AWSClientConfigDefaultsProvider.httpClientConfiguration()
            self.authSchemes = authSchemes ?? [AWSSDKHTTPAuth.SigV4AuthScheme()]
            self.authSchemePreference = authSchemePreference ?? nil
            self.authSchemeResolver = authSchemeResolver ?? DefaultExampleAuthSchemeResolver()
            self.bearerTokenIdentityResolver = bearerTokenIdentityResolver ?? SmithyIdentity.StaticBearerTokenIdentityResolver(token: SmithyIdentity.BearerTokenIdentity(token: ""))
            self._interceptorProviders = (interceptorProviders ?? []).map { ClientRuntime.SendableInterceptorProviderBox($0) }
            self._httpInterceptorProviders = (httpInterceptorProviders ?? []).map { ClientRuntime.SendableHttpInterceptorProviderBox($0) }
            self.logger = (telemetryProvider ?? ClientRuntime.DefaultTelemetry.provider).loggerProvider.getLogger(name: ExampleClient.clientName)
        }

        public init(
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
            self.useFIPS = useFIPS
            self.useDualStack = useDualStack
            self.appID = try appID ?? AWSClientRuntime.AWSClientConfigDefaultsProvider.appID()
            self.awsCredentialIdentityResolver = awsCredentialIdentityResolver ?? AWSSDKIdentity.DefaultAWSCredentialIdentityResolverChain()
            self.awsRetryMode = try awsRetryMode ?? AWSClientRuntime.AWSClientConfigDefaultsProvider.retryMode()
            self.maxAttempts = maxAttempts
            self.requestChecksumCalculation = try requestChecksumCalculation ?? AWSClientRuntime.AWSClientConfigDefaultsProvider.requestChecksumCalculation(requestChecksumCalculation)
            self.responseChecksumValidation = try responseChecksumValidation ?? AWSClientRuntime.AWSClientConfigDefaultsProvider.responseChecksumValidation(responseChecksumValidation)
            self.ignoreConfiguredEndpointURLs = ignoreConfiguredEndpointURLs
            self.region = try await AWSClientRuntime.AWSClientConfigDefaultsProvider.region(region)
            self.signingRegion = try await AWSClientRuntime.AWSClientConfigDefaultsProvider.region(region)
            self.endpointResolver = try endpointResolver ?? DefaultEndpointResolver()
            self.telemetryProvider = telemetryProvider ?? ClientRuntime.DefaultTelemetry.provider
            self.retryStrategyOptions = try retryStrategyOptions ?? AWSClientConfigDefaultsProvider.retryStrategyOptions(awsRetryMode, maxAttempts)
            self.clientLogMode = clientLogMode ?? AWSClientConfigDefaultsProvider.clientLogMode()
            self.endpoint = endpoint
            self.idempotencyTokenGenerator = idempotencyTokenGenerator ?? AWSClientConfigDefaultsProvider.idempotencyTokenGenerator()
            self.httpClientEngine = httpClientEngine ?? AWSClientConfigDefaultsProvider.httpClientEngine(httpClientConfiguration)
            self.httpClientConfiguration = httpClientConfiguration ?? AWSClientConfigDefaultsProvider.httpClientConfiguration()
            self.authSchemes = authSchemes ?? [AWSSDKHTTPAuth.SigV4AuthScheme()]
            self.authSchemePreference = authSchemePreference ?? nil
            self.authSchemeResolver = authSchemeResolver ?? DefaultExampleAuthSchemeResolver()
            self.bearerTokenIdentityResolver = bearerTokenIdentityResolver ?? SmithyIdentity.StaticBearerTokenIdentityResolver(token: SmithyIdentity.BearerTokenIdentity(token: ""))
            self._interceptorProviders = (interceptorProviders ?? []).map { ClientRuntime.SendableInterceptorProviderBox($0) }
            self._httpInterceptorProviders = (httpInterceptorProviders ?? []).map { ClientRuntime.SendableHttpInterceptorProviderBox($0) }
            self.logger = (telemetryProvider ?? ClientRuntime.DefaultTelemetry.provider).loggerProvider.getLogger(name: ExampleClient.clientName)
        }

        public init() async throws {
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

        public init(region: Swift.String) throws {
            try self.init(
                useFIPS: nil,
                useDualStack: nil,
                appID: try AWSClientRuntime.AWSClientConfigDefaultsProvider.appID(),
                awsCredentialIdentityResolver: AWSSDKIdentity.DefaultAWSCredentialIdentityResolverChain(),
                awsRetryMode: try AWSClientRuntime.AWSClientConfigDefaultsProvider.retryMode(),
                maxAttempts: nil,
                requestChecksumCalculation: try AWSClientConfigDefaultsProvider.requestChecksumCalculation(),
                responseChecksumValidation: try AWSClientConfigDefaultsProvider.responseChecksumValidation(),
                ignoreConfiguredEndpointURLs: nil,
                region: region,
                signingRegion: region,
                endpointResolver: try DefaultEndpointResolver(),
                telemetryProvider: ClientRuntime.DefaultTelemetry.provider,
                retryStrategyOptions: try AWSClientConfigDefaultsProvider.retryStrategyOptions(),
                clientLogMode: AWSClientConfigDefaultsProvider.clientLogMode(),
                endpoint: nil,
                idempotencyTokenGenerator: AWSClientConfigDefaultsProvider.idempotencyTokenGenerator(),
                httpClientEngine: AWSClientConfigDefaultsProvider.httpClientEngine(),
                httpClientConfiguration: AWSClientConfigDefaultsProvider.httpClientConfiguration(),
                authSchemes: [AWSSDKHTTPAuth.SigV4AuthScheme()],
                authSchemePreference: nil,
                authSchemeResolver: DefaultExampleAuthSchemeResolver(),
                bearerTokenIdentityResolver: SmithyIdentity.StaticBearerTokenIdentityResolver(token: SmithyIdentity.BearerTokenIdentity(token: "")),
                interceptorProviders: [],
                httpInterceptorProviders: []
            )
        }

        public var partitionID: String? {
            return "\(ExampleClient.clientName) - \(region ?? "")"
        }

        public mutating func addInterceptorProvider(_ provider: ClientRuntime.InterceptorProvider) {
            self._interceptorProviders.append(ClientRuntime.SendableInterceptorProviderBox(provider))
        }

        public mutating func addInterceptorProvider(_ provider: ClientRuntime.HttpInterceptorProvider) {
            self._httpInterceptorProviders.append(ClientRuntime.SendableHttpInterceptorProviderBox(provider))
        }

    }

    @available(*, deprecated, message: "Use ExampleClientConfig instead. This class will be removed in a future version.")
    public final class ExampleClientConfiguration: AWSClientRuntime.AWSDefaultClientConfiguration & AWSClientRuntime.AWSRegionClientConfiguration & ClientRuntime.DefaultClientConfiguration & ClientRuntime.DefaultHttpClientConfiguration {
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
        // Interceptor providers with Sendable-safe internal storage
        private var _interceptorProviders: [ClientRuntime.SendableInterceptorProviderBox] = []
        public var interceptorProviders: [ClientRuntime.InterceptorProvider] {
            get {
                return _interceptorProviders
            }
            set {
                _interceptorProviders = newValue.map { ClientRuntime.SendableInterceptorProviderBox($0) }
            }
        }

        private var _httpInterceptorProviders: [ClientRuntime.SendableHttpInterceptorProviderBox] = []
        public var httpInterceptorProviders: [ClientRuntime.HttpInterceptorProvider] {
            get {
                return _httpInterceptorProviders
            }
            set {
                _httpInterceptorProviders = newValue.map { ClientRuntime.SendableHttpInterceptorProviderBox($0) }
            }
        }
        public var logger: Smithy.LogAgent

        public init(
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
            self.useFIPS = useFIPS
            self.useDualStack = useDualStack
            self.appID = try appID ?? AWSClientRuntime.AWSClientConfigDefaultsProvider.appID()
            self.awsCredentialIdentityResolver = awsCredentialIdentityResolver ?? AWSSDKIdentity.DefaultAWSCredentialIdentityResolverChain()
            self.awsRetryMode = try awsRetryMode ?? AWSClientRuntime.AWSClientConfigDefaultsProvider.retryMode()
            self.maxAttempts = maxAttempts
            self.requestChecksumCalculation = try requestChecksumCalculation ?? AWSClientRuntime.AWSClientConfigDefaultsProvider.requestChecksumCalculation(requestChecksumCalculation)
            self.responseChecksumValidation = try responseChecksumValidation ?? AWSClientRuntime.AWSClientConfigDefaultsProvider.responseChecksumValidation(responseChecksumValidation)
            self.ignoreConfiguredEndpointURLs = ignoreConfiguredEndpointURLs
            self.region = region
            self.signingRegion = signingRegion
            self.endpointResolver = try endpointResolver ?? DefaultEndpointResolver()
            self.telemetryProvider = telemetryProvider ?? ClientRuntime.DefaultTelemetry.provider
            self.retryStrategyOptions = try retryStrategyOptions ?? AWSClientConfigDefaultsProvider.retryStrategyOptions(awsRetryMode, maxAttempts)
            self.clientLogMode = clientLogMode ?? AWSClientConfigDefaultsProvider.clientLogMode()
            self.endpoint = endpoint
            self.idempotencyTokenGenerator = idempotencyTokenGenerator ?? AWSClientConfigDefaultsProvider.idempotencyTokenGenerator()
            self.httpClientEngine = httpClientEngine ?? AWSClientConfigDefaultsProvider.httpClientEngine(httpClientConfiguration)
            self.httpClientConfiguration = httpClientConfiguration ?? AWSClientConfigDefaultsProvider.httpClientConfiguration()
            self.authSchemes = authSchemes ?? [AWSSDKHTTPAuth.SigV4AuthScheme()]
            self.authSchemePreference = authSchemePreference ?? nil
            self.authSchemeResolver = authSchemeResolver ?? DefaultExampleAuthSchemeResolver()
            self.bearerTokenIdentityResolver = bearerTokenIdentityResolver ?? SmithyIdentity.StaticBearerTokenIdentityResolver(token: SmithyIdentity.BearerTokenIdentity(token: ""))
            self._interceptorProviders = (interceptorProviders ?? []).map { ClientRuntime.SendableInterceptorProviderBox($0) }
            self._httpInterceptorProviders = (httpInterceptorProviders ?? []).map { ClientRuntime.SendableHttpInterceptorProviderBox($0) }
            self.logger = (telemetryProvider ?? ClientRuntime.DefaultTelemetry.provider).loggerProvider.getLogger(name: ExampleClient.clientName)
        }

        public init(
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
            self.useFIPS = useFIPS
            self.useDualStack = useDualStack
            self.appID = try appID ?? AWSClientRuntime.AWSClientConfigDefaultsProvider.appID()
            self.awsCredentialIdentityResolver = awsCredentialIdentityResolver ?? AWSSDKIdentity.DefaultAWSCredentialIdentityResolverChain()
            self.awsRetryMode = try awsRetryMode ?? AWSClientRuntime.AWSClientConfigDefaultsProvider.retryMode()
            self.maxAttempts = maxAttempts
            self.requestChecksumCalculation = try requestChecksumCalculation ?? AWSClientRuntime.AWSClientConfigDefaultsProvider.requestChecksumCalculation(requestChecksumCalculation)
            self.responseChecksumValidation = try responseChecksumValidation ?? AWSClientRuntime.AWSClientConfigDefaultsProvider.responseChecksumValidation(responseChecksumValidation)
            self.ignoreConfiguredEndpointURLs = ignoreConfiguredEndpointURLs
            self.region = try await AWSClientRuntime.AWSClientConfigDefaultsProvider.region(region)
            self.signingRegion = try await AWSClientRuntime.AWSClientConfigDefaultsProvider.region(region)
            self.endpointResolver = try endpointResolver ?? DefaultEndpointResolver()
            self.telemetryProvider = telemetryProvider ?? ClientRuntime.DefaultTelemetry.provider
            self.retryStrategyOptions = try retryStrategyOptions ?? AWSClientConfigDefaultsProvider.retryStrategyOptions(awsRetryMode, maxAttempts)
            self.clientLogMode = clientLogMode ?? AWSClientConfigDefaultsProvider.clientLogMode()
            self.endpoint = endpoint
            self.idempotencyTokenGenerator = idempotencyTokenGenerator ?? AWSClientConfigDefaultsProvider.idempotencyTokenGenerator()
            self.httpClientEngine = httpClientEngine ?? AWSClientConfigDefaultsProvider.httpClientEngine(httpClientConfiguration)
            self.httpClientConfiguration = httpClientConfiguration ?? AWSClientConfigDefaultsProvider.httpClientConfiguration()
            self.authSchemes = authSchemes ?? [AWSSDKHTTPAuth.SigV4AuthScheme()]
            self.authSchemePreference = authSchemePreference ?? nil
            self.authSchemeResolver = authSchemeResolver ?? DefaultExampleAuthSchemeResolver()
            self.bearerTokenIdentityResolver = bearerTokenIdentityResolver ?? SmithyIdentity.StaticBearerTokenIdentityResolver(token: SmithyIdentity.BearerTokenIdentity(token: ""))
            self._interceptorProviders = (interceptorProviders ?? []).map { ClientRuntime.SendableInterceptorProviderBox($0) }
            self._httpInterceptorProviders = (httpInterceptorProviders ?? []).map { ClientRuntime.SendableHttpInterceptorProviderBox($0) }
            self.logger = (telemetryProvider ?? ClientRuntime.DefaultTelemetry.provider).loggerProvider.getLogger(name: ExampleClient.clientName)
        }

        public convenience init() async throws {
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
            try self.init(
                useFIPS: nil,
                useDualStack: nil,
                appID: try AWSClientRuntime.AWSClientConfigDefaultsProvider.appID(),
                awsCredentialIdentityResolver: AWSSDKIdentity.DefaultAWSCredentialIdentityResolverChain(),
                awsRetryMode: try AWSClientRuntime.AWSClientConfigDefaultsProvider.retryMode(),
                maxAttempts: nil,
                requestChecksumCalculation: try AWSClientConfigDefaultsProvider.requestChecksumCalculation(),
                responseChecksumValidation: try AWSClientConfigDefaultsProvider.responseChecksumValidation(),
                ignoreConfiguredEndpointURLs: nil,
                region: region,
                signingRegion: region,
                endpointResolver: try DefaultEndpointResolver(),
                telemetryProvider: ClientRuntime.DefaultTelemetry.provider,
                retryStrategyOptions: try AWSClientConfigDefaultsProvider.retryStrategyOptions(),
                clientLogMode: AWSClientConfigDefaultsProvider.clientLogMode(),
                endpoint: nil,
                idempotencyTokenGenerator: AWSClientConfigDefaultsProvider.idempotencyTokenGenerator(),
                httpClientEngine: AWSClientConfigDefaultsProvider.httpClientEngine(),
                httpClientConfiguration: AWSClientConfigDefaultsProvider.httpClientConfiguration(),
                authSchemes: [AWSSDKHTTPAuth.SigV4AuthScheme()],
                authSchemePreference: nil,
                authSchemeResolver: DefaultExampleAuthSchemeResolver(),
                bearerTokenIdentityResolver: SmithyIdentity.StaticBearerTokenIdentityResolver(token: SmithyIdentity.BearerTokenIdentity(token: "")),
                interceptorProviders: [],
                httpInterceptorProviders: []
            )
        }

        public var partitionID: String? {
            return "\(ExampleClient.clientName) - \(region ?? "")"
        }

        public func toSendable() throws -> ExampleClientConfig {
            return try ExampleClientConfig(
                useFIPS: self.useFIPS,
                useDualStack: self.useDualStack,
                appID: self.appID,
                awsCredentialIdentityResolver: self.awsCredentialIdentityResolver,
                awsRetryMode: self.awsRetryMode,
                maxAttempts: self.maxAttempts,
                requestChecksumCalculation: self.requestChecksumCalculation,
                responseChecksumValidation: self.responseChecksumValidation,
                ignoreConfiguredEndpointURLs: self.ignoreConfiguredEndpointURLs,
                region: self.region,
                signingRegion: self.signingRegion,
                endpointResolver: self.endpointResolver,
                telemetryProvider: self.telemetryProvider,
                retryStrategyOptions: self.retryStrategyOptions,
                clientLogMode: self.clientLogMode,
                endpoint: self.endpoint,
                idempotencyTokenGenerator: self.idempotencyTokenGenerator,
                httpClientEngine: self.httpClientEngine,
                httpClientConfiguration: self.httpClientConfiguration,
                authSchemes: self.authSchemes,
                authSchemePreference: self.authSchemePreference,
                authSchemeResolver: self.authSchemeResolver,
                bearerTokenIdentityResolver: self.bearerTokenIdentityResolver,
                interceptorProviders: self.interceptorProviders,
                httpInterceptorProviders: self.httpInterceptorProviders
            )
        }

        public func addInterceptorProvider(_ provider: ClientRuntime.InterceptorProvider) {
            self._interceptorProviders.append(ClientRuntime.SendableInterceptorProviderBox(provider))
        }

        public func addInterceptorProvider(_ provider: ClientRuntime.HttpInterceptorProvider) {
            self._httpInterceptorProviders.append(ClientRuntime.SendableHttpInterceptorProviderBox(provider))
        }

    }

    public static func builder() -> ClientRuntime.ClientBuilder<ExampleClient> {
        return ClientRuntime.ClientBuilder<ExampleClient>(defaultPlugins: [
            ClientRuntime.DefaultClientPlugin(),
            AWSClientRuntime.DefaultAWSClientPlugin(clientName: self.clientName),
            DefaultAWSAuthSchemePlugin()
        ])
    }
}
"""
        contents.shouldContainOnlyOnce(expectedContents)
    }

    private fun setupTests(
        smithyFile: String,
        serviceShapeId: String,
    ): TestContext {
        val context = executeDirectedCodegen(smithyFile, serviceShapeId, RestJson1Trait.ID)

        val generator = AWSRestJson1ProtocolGenerator()
        generator.generateProtocolUnitTests(context.ctx)
        context.ctx.delegator.flushWriters()
        return context
    }
}
