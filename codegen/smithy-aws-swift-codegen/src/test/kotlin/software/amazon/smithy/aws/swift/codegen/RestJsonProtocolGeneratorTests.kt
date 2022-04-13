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
                    if let payload1 = payload1 {
                        try encodeContainer.encode(payload1, forKey: .payload1)
                    }
                    if let payload2 = payload2 {
                        try encodeContainer.encode(payload2, forKey: .payload2)
                    }
                    if let payload3 = payload3 {
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
                    if let payload1 = payload1 {
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
                let config: AWSClientRuntime.AWSClientConfiguration
                let serviceName = "Example"
                let encoder: ClientRuntime.RequestEncoder
                let decoder: ClientRuntime.ResponseDecoder
            
                public init(config: AWSClientRuntime.AWSClientConfiguration) {
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
            
                public class ExampleClientConfiguration: AWSClientRuntime.AWSClientConfiguration {
            
                    public var clientLogMode: ClientRuntime.ClientLogMode
                    public var decoder: ClientRuntime.ResponseDecoder?
                    public var encoder: ClientRuntime.RequestEncoder?
                    public var httpClientConfiguration: ClientRuntime.HttpClientConfiguration
                    public var httpClientEngine: ClientRuntime.HttpClientEngine
                    public var idempotencyTokenGenerator: ClientRuntime.IdempotencyTokenGenerator
                    public var logger: ClientRuntime.LogAgent
                    public var retryer: ClientRuntime.SDKRetryer
            
                    public var credentialsProvider: AWSClientRuntime.CredentialsProvider
                    public var endpointResolver: AWSClientRuntime.EndpointResolver
                    public var frameworkMetadata: AWSClientRuntime.FrameworkMetadata?
                    public var region: Swift.String?
                    public var regionResolver: AWSClientRuntime.RegionResolver?
                    public var signingRegion: Swift.String?

                    public init(
                        region: Swift.String,
                        credentialsProvider: AWSClientRuntime.CredentialsProvider? = nil,
                        endpointResolver: AWSClientRuntime.EndpointResolver? = nil,
                        frameworkMetadata: AWSClientRuntime.FrameworkMetadata? = nil,
                        signingRegion: Swift.String? = nil,
                        runtimeConfig: ClientRuntime.SDKRuntimeConfiguration
                    ) throws {
                        self.region = region
                        self.signingRegion = signingRegion ?? region
                        self.endpointResolver = endpointResolver ?? DefaultEndpointResolver()
                        if let credProvider = credentialsProvider {
                            self.credentialsProvider = try AWSClientRuntime.AWSCredentialsProvider.fromCustom(credProvider)
                        } else {
                            self.credentialsProvider = try AWSClientRuntime.AWSCredentialsProvider.fromChain()
                        }
                        self.frameworkMetadata = frameworkMetadata
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
                        region: Swift.String,
                        credentialsProvider: AWSClientRuntime.CredentialsProvider? = nil,
                        endpointResolver: AWSClientRuntime.EndpointResolver? = nil,
                        frameworkMetadata: AWSClientRuntime.FrameworkMetadata? = nil,
                        signingRegion: Swift.String? = nil
                    ) throws {
                        let defaultRuntimeConfig = try ClientRuntime.DefaultSDKRuntimeConfiguration("ExampleClient")
                        try self.init(region: region, credentialsProvider: credentialsProvider, endpointResolver: endpointResolver, frameworkMetadata: frameworkMetadata, signingRegion: signingRegion, runtimeConfig: defaultRuntimeConfig)
                    }

                    public init(
                        credentialsProvider: AWSClientRuntime.CredentialsProvider? = nil,
                        endpointResolver: AWSClientRuntime.EndpointResolver? = nil,
                        frameworkMetadata: AWSClientRuntime.FrameworkMetadata? = nil,
                        regionResolver: AWSClientRuntime.RegionResolver? = nil,
                        signingRegion: Swift.String? = nil,
                        runtimeConfig: ClientRuntime.SDKRuntimeConfiguration
                    ) async throws {
                        let resolvedRegionResolver = regionResolver ?? DefaultRegionResolver()
                        self.region = await resolvedRegionResolver.resolveRegion()
                        self.regionResolver = resolvedRegionResolver
                        self.signingRegion = signingRegion ?? region
                        self.endpointResolver = endpointResolver ?? DefaultEndpointResolver()
                        if let credProvider = credentialsProvider {
                            self.credentialsProvider = try AWSClientRuntime.AWSCredentialsProvider.fromCustom(credProvider)
                        } else {
                            self.credentialsProvider = try AWSClientRuntime.AWSCredentialsProvider.fromChain()
                        }
                        self.frameworkMetadata = frameworkMetadata
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
                        endpointResolver: AWSClientRuntime.EndpointResolver? = nil,
                        frameworkMetadata: AWSClientRuntime.FrameworkMetadata? = nil,
                        regionResolver: AWSClientRuntime.RegionResolver? = nil,
                        signingRegion: Swift.String? = nil
                    ) async throws {
                        let defaultRuntimeConfig = try ClientRuntime.DefaultSDKRuntimeConfiguration("ExampleClient")
                        try await self.init(credentialsProvider: credentialsProvider, endpointResolver: endpointResolver, frameworkMetadata: frameworkMetadata, regionResolver: regionResolver, signingRegion: signingRegion, runtimeConfig: defaultRuntimeConfig)
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
