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
            extension SmokeTestInput: Encodable, Reflection {
                enum CodingKeys: String, CodingKey {
                    case payload1
                    case payload2
                    case payload3
                }
            
                public func encode(to encoder: Encoder) throws {
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
            extension ExplicitBlobInput: Encodable, Reflection {
                enum CodingKeys: String, CodingKey {
                    case payload1
                }
            
                public func encode(to encoder: Encoder) throws {
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
                let client: SdkHttpClient
                let config: AWSClientConfiguration
                let serviceName = "Example"
                let encoder: RequestEncoder
                let decoder: ResponseDecoder
            
                public init(config: AWSClientConfiguration) {
                    client = SdkHttpClient(engine: config.httpClientEngine, config: config.httpClientConfiguration)
                    let encoder = JSONEncoder()
                    encoder.dateEncodingStrategy = .secondsSince1970
                    encoder.nonConformingFloatEncodingStrategy = .convertToString(positiveInfinity: "Infinity", negativeInfinity: "-Infinity", nan: "NaN")
                    self.encoder = config.encoder ?? encoder
                    let decoder = JSONDecoder()
                    decoder.dateDecodingStrategy = .secondsSince1970
                    decoder.nonConformingFloatDecodingStrategy = .convertFromString(positiveInfinity: "Infinity", negativeInfinity: "-Infinity", nan: "NaN")
                    self.decoder = config.decoder ?? decoder
                    self.config = config
                }
            
                public convenience init(region: String? = nil) throws {
                    let unwrappedRegion = region ?? "us-east-1"
                    let config = try ExampleClientConfiguration(region: unwrappedRegion)
                    self.init(config: config)
                }
            
                deinit {
                    client.close()
                }
            
                public class ExampleClientConfiguration: AWSClientConfiguration {
            
                    public var clientLogMode: ClientLogMode
                    public var decoder: ResponseDecoder?
                    public var encoder: RequestEncoder?
                    public var httpClientConfiguration: HttpClientConfiguration
                    public var httpClientEngine: HttpClientEngine
                    public var idempotencyTokenGenerator: IdempotencyTokenGenerator
                    public var logger: LogAgent
                    public var retrier: Retrier
            
                    public var credentialsProvider: AWSCredentialsProvider
                    public var endpointResolver: EndpointResolver
                    public var region: String
                    public var signingRegion: String
            
                    public init(
                        credentialsProvider: AWSCredentialsProvider? = nil,
                        endpointResolver: EndpointResolver? = nil,
                        region: String,
                        signingRegion: String? = nil,
                        runtimeConfig: SDKRuntimeConfiguration
                    ) throws {
                        self.region = region
                        self.signingRegion = signingRegion ?? region
                        self.endpointResolver = endpointResolver ?? DefaultEndpointResolver()
                        if let credProvider = credentialsProvider {
                            self.credentialsProvider = credProvider
                        } else {
                            self.credentialsProvider = try AWSCredentialsProvider.fromChain()
                        }
                        self.clientLogMode = runtimeConfig.clientLogMode
                        self.decoder = runtimeConfig.decoder
                        self.encoder = runtimeConfig.encoder
                        self.httpClientConfiguration = runtimeConfig.httpClientConfiguration
                        self.httpClientEngine = runtimeConfig.httpClientEngine
                        self.idempotencyTokenGenerator = runtimeConfig.idempotencyTokenGenerator
                        self.logger = runtimeConfig.logger
                        self.retrier = runtimeConfig.retrier
                    }
            
                    public convenience init(
                        credentialsProvider: AWSCredentialsProvider? = nil,
                        endpointResolver: EndpointResolver? = nil,
                        region: String,
                        signingRegion: String? = nil
                    ) throws {
                        let defaultRuntimeConfig = try DefaultSDKRuntimeConfiguration("ExampleClient")
                        try self.init(credentialsProvider: credentialsProvider, endpointResolver: endpointResolver, region: region, signingRegion: signingRegion, runtimeConfig: defaultRuntimeConfig)
                    }
                }
            }
            
            public struct ExampleClientLogHandlerFactory: SDKLogHandlerFactory {
                public var label = "ExampleClient"
                let logLevel: SDKLogLevel
                public func construct(label: String) -> LogHandler {
                    var handler = StreamLogHandler.standardOutput(label: label)
                    handler.logLevel = logLevel.toLoggerType()
                    return handler
                }
                public init(logLevel: SDKLogLevel) {
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
