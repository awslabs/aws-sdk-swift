/*
 * Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
 * SPDX-License-Identifier: Apache-2.0.
 */

package software.amazon.smithy.aws.swift.codegen

import io.kotest.matchers.string.shouldContainOnlyOnce
import org.junit.jupiter.api.Test
import software.amazon.smithy.aws.swift.codegen.TestContextGenerator.Companion.getClientFileContents
import software.amazon.smithy.aws.swift.codegen.TestContextGenerator.Companion.getModelFileContents
import software.amazon.smithy.aws.swift.codegen.TestContextGenerator.Companion.initContextFrom
import software.amazon.smithy.aws.swift.codegen.restjson.AWSRestJson1ProtocolGenerator
import software.amazon.smithy.aws.traits.protocols.RestJson1Trait

class RestJsonProtocolGeneratorTests {

    @Test
    fun `define coding keys for unbound document payload members`() {
        val context = setupTests("http-binding-protocol-generator-test.smithy", "com.test#Example")
        val contents = getModelFileContents("Example", "SmokeTestInput+Encodable.swift", context.manifest)
        contents.shouldSyntacticSanityCheck()
        val expectedContents =
            """
            extension SmokeTestInput: Swift.Encodable {
                enum CodingKeys: Swift.String, Swift.CodingKey {
                    case payload1
                    case payload2
                    case payload3
                }
            
                public func encode(to encoder: Swift.Encoder) throws {
                    var encodeContainer = encoder.container(keyedBy: CodingKeys.self)
                    if let payload1 = self.payload1 {
                        try encodeContainer.encode(payload1, forKey: .payload1)
                    }
                    if let payload2 = self.payload2 {
                        try encodeContainer.encode(payload2, forKey: .payload2)
                    }
                    if let payload3 = self.payload3 {
                        try encodeContainer.encode(payload3, forKey: .payload3)
                    }
                }
            }
            """.trimIndent()
        contents.shouldContainOnlyOnce(expectedContents)
    }

    @Test
    fun `define coding keys for payload member`() {
        val context = setupTests("http-binding-protocol-generator-test.smithy", "com.test#Example")
        val contents = getModelFileContents("Example", "ExplicitBlobInput+Encodable.swift", context.manifest)
        contents.shouldSyntacticSanityCheck()
        val expectedContents =
            """
            extension ExplicitBlobInput: Swift.Encodable {
                enum CodingKeys: Swift.String, Swift.CodingKey {
                    case payload1
                }
            
                public func encode(to encoder: Swift.Encoder) throws {
                    var encodeContainer = encoder.container(keyedBy: CodingKeys.self)
                    if let payload1 = self.payload1 {
                        try encodeContainer.encode(payload1.base64EncodedString(), forKey: .payload1)
                    }
                }
            }
            """.trimIndent()
        contents.shouldContainOnlyOnce(expectedContents)
    }

    @Test
    fun `generated client has proper configuration`() {
        val context = setupTests("http-binding-protocol-generator-test.smithy", "com.test#Example")
        val contents = getClientFileContents("Example", "ExampleClient.swift", context.manifest)
        contents.shouldSyntacticSanityCheck()
        val expectedContents =
            """
            public class ExampleClient {
                public static let clientName = "ExampleClient"
                let client: ClientRuntime.SdkHttpClient
                let config: ExampleClientConfigurationProtocol
                let serviceName = "Example"
                let encoder: ClientRuntime.RequestEncoder
                let decoder: ClientRuntime.ResponseDecoder
            
                public init(config: ExampleClientConfigurationProtocol) {
                    client = ClientRuntime.SdkHttpClient(engine: config.httpClientEngine, config: config.httpClientConfiguration)
                    let encoder = ClientRuntime.JSONEncoder()
                    encoder.dateEncodingStrategy = .secondsSince1970
                    encoder.nonConformingFloatEncodingStrategy = .convertToString(positiveInfinity: "Infinity", negativeInfinity: "-Infinity", nan: "NaN")
                    self.encoder = config.encoder ?? encoder
                    let decoder = ClientRuntime.JSONDecoder()
                    decoder.dateDecodingStrategy = .secondsSince1970
                    decoder.nonConformingFloatDecodingStrategy = .convertFromString(positiveInfinity: "Infinity", negativeInfinity: "-Infinity", nan: "NaN")
                    self.decoder = config.decoder ?? decoder
                    self.config = config
                }
            
                public convenience init(region: Swift.String) throws {
                    let config = try ExampleClientConfiguration(region: region)
                    self.init(config: config)
                }
            
                public convenience init() async throws {
                    let config = try await ExampleClientConfiguration()
                    self.init(config: config)
                }
            
                deinit {
                    client.close()
                }
            
                public class ExampleClientConfiguration: ExampleClientConfigurationProtocol {
                    public var clientLogMode: ClientRuntime.ClientLogMode
                    public var decoder: ClientRuntime.ResponseDecoder?
                    public var encoder: ClientRuntime.RequestEncoder?
                    public var httpClientConfiguration: ClientRuntime.HttpClientConfiguration
                    public var httpClientEngine: ClientRuntime.HttpClientEngine
                    public var idempotencyTokenGenerator: ClientRuntime.IdempotencyTokenGenerator
                    public var logger: ClientRuntime.LogAgent
                    public var retryer: ClientRuntime.SDKRetryer
            
                    public var credentialsProvider: AWSClientRuntime.CredentialsProvider
                    public var endpoint: Swift.String?
                    public var frameworkMetadata: AWSClientRuntime.FrameworkMetadata?
                    public var region: Swift.String?
                    public var regionResolver: AWSClientRuntime.RegionResolver?
                    public var signingRegion: Swift.String?
                    public var useDualStack: Swift.Bool?
                    public var useFips: Swift.Bool?
            
                    public var endpointResolver: EndpointResolver
            
                    public init(
                        credentialsProvider: AWSClientRuntime.CredentialsProvider? = nil,
                        endpoint: Swift.String? = nil,
                        endpointResolver: EndpointResolver? = nil,
                        frameworkMetadata: AWSClientRuntime.FrameworkMetadata? = nil,
                        region: Swift.String,
                        regionResolver: AWSClientRuntime.RegionResolver? = nil,
                        runtimeConfig: ClientRuntime.SDKRuntimeConfiguration,
                        signingRegion: Swift.String? = nil,
                        useDualStack: Swift.Bool? = nil,
                        useFips: Swift.Bool? = nil
                    ) throws {
                        if let credProvider = credentialsProvider {
                            self.credentialsProvider = try AWSClientRuntime.AWSCredentialsProvider.fromCustom(credProvider)
                        } else {
                            self.credentialsProvider = try AWSClientRuntime.AWSCredentialsProvider.fromChain()
                        }
                        self.endpoint = endpoint
                        self.endpointResolver = endpointResolver ?? DefaultEndpointResolver()
                        self.frameworkMetadata = frameworkMetadata
                        self.region = region
                        self.regionResolver = regionResolver ?? DefaultRegionResolver()
                        self.signingRegion = signingRegion ?? region
                        self.useDualStack = useDualStack
                        self.useFips = useFips
                        self.clientLogMode = runtimeConfig.clientLogMode
                        self.decoder = runtimeConfig.decoder
                        self.encoder = runtimeConfig.encoder
                        self.httpClientConfiguration = runtimeConfig.httpClientConfiguration
                        self.httpClientEngine = runtimeConfig.httpClientEngine
                        self.idempotencyTokenGenerator = runtimeConfig.idempotencyTokenGenerator
                        self.logger = runtimeConfig.logger
                        self.retryer = runtimeConfig.retryer
                    }
            
                    public convenience init(
                        credentialsProvider: AWSClientRuntime.CredentialsProvider? = nil,
                        endpoint: Swift.String? = nil,
                        endpointResolver: EndpointResolver? = nil,
                        frameworkMetadata: AWSClientRuntime.FrameworkMetadata? = nil,
                        region: Swift.String,
                        regionResolver: AWSClientRuntime.RegionResolver? = nil,
                        signingRegion: Swift.String? = nil,
                        useDualStack: Swift.Bool? = nil,
                        useFips: Swift.Bool? = nil
                    ) throws {
                        let runtimeConfig = try ClientRuntime.DefaultSDKRuntimeConfiguration("ExampleClient")
                        try self.init(
                            credentialsProvider: credentialsProvider,
                            endpoint: endpoint,
                            endpointResolver: endpointResolver,
                            frameworkMetadata: frameworkMetadata,
                            region: region,
                            regionResolver: regionResolver,
                            runtimeConfig: runtimeConfig,
                            signingRegion: signingRegion,
                            useDualStack: useDualStack,
                            useFips: useFips
                        )
                    }
            
                    public init(
                        credentialsProvider: AWSClientRuntime.CredentialsProvider? = nil,
                        endpoint: Swift.String? = nil,
                        endpointResolver: EndpointResolver? = nil,
                        frameworkMetadata: AWSClientRuntime.FrameworkMetadata? = nil,
                        regionResolver: AWSClientRuntime.RegionResolver? = nil,
                        runtimeConfig: ClientRuntime.SDKRuntimeConfiguration,
                        signingRegion: Swift.String? = nil,
                        useDualStack: Swift.Bool? = nil,
                        useFips: Swift.Bool? = nil
                    ) async throws {
                        if let credProvider = credentialsProvider {
                            self.credentialsProvider = try AWSClientRuntime.AWSCredentialsProvider.fromCustom(credProvider)
                        } else {
                            self.credentialsProvider = try AWSClientRuntime.AWSCredentialsProvider.fromChain()
                        }
                        self.endpoint = endpoint
                        self.endpointResolver = endpointResolver ?? DefaultEndpointResolver()
                        self.frameworkMetadata = frameworkMetadata
                        let resolvedRegionResolver = regionResolver ?? DefaultRegionResolver()
                        self.region = await resolvedRegionResolver.resolveRegion()
                        self.regionResolver = regionResolver ?? DefaultRegionResolver()
                        self.signingRegion = signingRegion ?? region
                        self.useDualStack = useDualStack
                        self.useFips = useFips
                        self.clientLogMode = runtimeConfig.clientLogMode
                        self.decoder = runtimeConfig.decoder
                        self.encoder = runtimeConfig.encoder
                        self.httpClientConfiguration = runtimeConfig.httpClientConfiguration
                        self.httpClientEngine = runtimeConfig.httpClientEngine
                        self.idempotencyTokenGenerator = runtimeConfig.idempotencyTokenGenerator
                        self.logger = runtimeConfig.logger
                        self.retryer = runtimeConfig.retryer
                    }
            
                    public convenience init(
                        credentialsProvider: AWSClientRuntime.CredentialsProvider? = nil,
                        endpoint: Swift.String? = nil,
                        endpointResolver: EndpointResolver? = nil,
                        frameworkMetadata: AWSClientRuntime.FrameworkMetadata? = nil,
                        regionResolver: AWSClientRuntime.RegionResolver? = nil,
                        signingRegion: Swift.String? = nil,
                        useDualStack: Swift.Bool? = nil,
                        useFips: Swift.Bool? = nil
                    ) async throws {
                        let runtimeConfig = try ClientRuntime.DefaultSDKRuntimeConfiguration("ExampleClient")
                        try await self.init(
                            credentialsProvider: credentialsProvider,
                            endpoint: endpoint,
                            endpointResolver: endpointResolver,
                            frameworkMetadata: frameworkMetadata,
                            regionResolver: regionResolver,
                            runtimeConfig: runtimeConfig,
                            signingRegion: signingRegion,
                            useDualStack: useDualStack,
                            useFips: useFips
                        )
                    }
            
                }
            }
            
            public struct ExampleClientLogHandlerFactory: ClientRuntime.SDKLogHandlerFactory {
                public var label = "ExampleClient"
                let logLevel: ClientRuntime.SDKLogLevel
                public func construct(label: String) -> LogHandler {
                    var handler = StreamLogHandler.standardOutput(label: label)
                    handler.logLevel = logLevel.toLoggerType()
                    return handler
                }
                public init(logLevel: ClientRuntime.SDKLogLevel) {
                    self.logLevel = logLevel
                }
            }
            """.trimIndent()
        contents.shouldContainOnlyOnce(expectedContents)
    }
    private fun setupTests(smithyFile: String, serviceShapeId: String): TestContext {
        val context = initContextFrom(smithyFile, serviceShapeId, RestJson1Trait.ID, "Example", "Example")

        val generator = AWSRestJson1ProtocolGenerator()
        generator.generateProtocolUnitTests(context.ctx)
        context.ctx.delegator.flushWriters()
        return context
    }
}
