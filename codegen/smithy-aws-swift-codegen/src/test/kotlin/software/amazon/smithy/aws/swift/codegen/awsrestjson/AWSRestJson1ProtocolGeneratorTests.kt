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
public class ExampleClient: AWSClientRuntime.AWSServiceClient {
    public static let clientName = "ExampleClient"
    let client: ClientRuntime.SdkHttpClient
    let config: ExampleClient.ExampleClientConfiguration
    let serviceName = "Example"

    public required init(config: ExampleClient.ExampleClientConfiguration) {
        client = ClientRuntime.SdkHttpClient(engine: config.httpClientEngine, config: config.httpClientConfiguration)
        self.config = config
    }

    public convenience init(region: Swift.String) throws {
        let config = try ExampleClient.ExampleClientConfiguration(region: region)
        self.init(config: config)
    }

    public convenience required init() async throws {
        let config = try await ExampleClient.ExampleClientConfiguration()
        self.init(config: config)
    }
}

extension ExampleClient {

    public struct ExampleClientConfiguration: AWSClientRuntime.AWSDefaultClientConfiguration & AWSClientRuntime.AWSRegionClientConfiguration & ClientRuntime.DefaultClientConfiguration & ClientRuntime.DefaultHttpClientConfiguration, Sendable {
        public let useFIPS: Swift.Bool?
        public let useDualStack: Swift.Bool?
        public let appID: Swift.String?
        public let awsCredentialIdentityResolver: any SmithyIdentity.AWSCredentialIdentityResolver
        public let awsRetryMode: AWSClientRuntime.AWSRetryMode
        public let maxAttempts: Swift.Int?
        public let requestChecksumCalculation: AWSSDKChecksums.AWSChecksumCalculationMode
        public let responseChecksumValidation: AWSSDKChecksums.AWSChecksumCalculationMode
        public let ignoreConfiguredEndpointURLs: Swift.Bool?
        public let region: Swift.String?
        public let signingRegion: Swift.String?
        public let endpointResolver: EndpointResolver
        public let telemetryProvider: ClientRuntime.TelemetryProvider
        public let retryStrategyOptions: SmithyRetriesAPI.RetryStrategyOptions
        public let clientLogMode: ClientRuntime.ClientLogMode
        public let endpoint: Swift.String?
        public let idempotencyTokenGenerator: ClientRuntime.IdempotencyTokenGenerator
        public let interceptorProviders: [ClientRuntime.InterceptorProvider]
        public let httpClientEngine: SmithyHTTPAPI.HTTPClient
        public let httpClientConfiguration: ClientRuntime.HttpClientConfiguration
        public let authSchemes: SmithyHTTPAuthAPI.AuthSchemes?
        public let authSchemePreference: [String]?
        public let authSchemeResolver: SmithyHTTPAuthAPI.AuthSchemeResolver
        public let httpInterceptorProviders: [ClientRuntime.HttpInterceptorProvider]
        public let bearerTokenIdentityResolver: any SmithyIdentity.BearerTokenIdentityResolver
        public let logger: Smithy.LogAgent

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
            interceptorProviders: [ClientRuntime.InterceptorProvider]? = nil,
            httpClientEngine: SmithyHTTPAPI.HTTPClient? = nil,
            httpClientConfiguration: ClientRuntime.HttpClientConfiguration? = nil,
            authSchemes: SmithyHTTPAuthAPI.AuthSchemes? = nil,
            authSchemePreference: [String]? = nil,
            authSchemeResolver: SmithyHTTPAuthAPI.AuthSchemeResolver? = nil,
            httpInterceptorProviders: [ClientRuntime.HttpInterceptorProvider]? = nil,
            bearerTokenIdentityResolver: (any SmithyIdentity.BearerTokenIdentityResolver)? = nil
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
            self.interceptorProviders = interceptorProviders ?? []
            self.httpClientEngine = httpClientEngine ?? AWSClientConfigDefaultsProvider.httpClientEngine(httpClientConfiguration)
            self.httpClientConfiguration = httpClientConfiguration ?? AWSClientConfigDefaultsProvider.httpClientConfiguration()
            self.authSchemes = authSchemes ?? [AWSSDKHTTPAuth.SigV4AuthScheme()]
            self.authSchemePreference = authSchemePreference ?? nil
            self.authSchemeResolver = authSchemeResolver ?? DefaultExampleAuthSchemeResolver()
            self.httpInterceptorProviders = httpInterceptorProviders ?? []
            self.bearerTokenIdentityResolver = bearerTokenIdentityResolver ?? SmithyIdentity.StaticBearerTokenIdentityResolver(token: SmithyIdentity.BearerTokenIdentity(token: ""))
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
            interceptorProviders: [ClientRuntime.InterceptorProvider]? = nil,
            httpClientEngine: SmithyHTTPAPI.HTTPClient? = nil,
            httpClientConfiguration: ClientRuntime.HttpClientConfiguration? = nil,
            authSchemes: SmithyHTTPAuthAPI.AuthSchemes? = nil,
            authSchemePreference: [String]? = nil,
            authSchemeResolver: SmithyHTTPAuthAPI.AuthSchemeResolver? = nil,
            httpInterceptorProviders: [ClientRuntime.HttpInterceptorProvider]? = nil,
            bearerTokenIdentityResolver: (any SmithyIdentity.BearerTokenIdentityResolver)? = nil
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
            self.interceptorProviders = interceptorProviders ?? []
            self.httpClientEngine = httpClientEngine ?? AWSClientConfigDefaultsProvider.httpClientEngine(httpClientConfiguration)
            self.httpClientConfiguration = httpClientConfiguration ?? AWSClientConfigDefaultsProvider.httpClientConfiguration()
            self.authSchemes = authSchemes ?? [AWSSDKHTTPAuth.SigV4AuthScheme()]
            self.authSchemePreference = authSchemePreference ?? nil
            self.authSchemeResolver = authSchemeResolver ?? DefaultExampleAuthSchemeResolver()
            self.httpInterceptorProviders = httpInterceptorProviders ?? []
            self.bearerTokenIdentityResolver = bearerTokenIdentityResolver ?? SmithyIdentity.StaticBearerTokenIdentityResolver(token: SmithyIdentity.BearerTokenIdentity(token: ""))
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
                interceptorProviders: nil,
                httpClientEngine: nil,
                httpClientConfiguration: nil,
                authSchemes: nil,
                authSchemePreference: nil,
                authSchemeResolver: nil,
                httpInterceptorProviders: nil,
                bearerTokenIdentityResolver: nil
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
                interceptorProviders: [],
                httpClientEngine: AWSClientConfigDefaultsProvider.httpClientEngine(),
                httpClientConfiguration: AWSClientConfigDefaultsProvider.httpClientConfiguration(),
                authSchemes: [AWSSDKHTTPAuth.SigV4AuthScheme()],
                authSchemePreference: nil,
                authSchemeResolver: DefaultExampleAuthSchemeResolver(),
                httpInterceptorProviders: [],
                bearerTokenIdentityResolver: SmithyIdentity.StaticBearerTokenIdentityResolver(token: SmithyIdentity.BearerTokenIdentity(token: ""))
            )
        }

        public var partitionID: String? {
            return "\(ExampleClient.clientName) - \(region ?? "")"
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
