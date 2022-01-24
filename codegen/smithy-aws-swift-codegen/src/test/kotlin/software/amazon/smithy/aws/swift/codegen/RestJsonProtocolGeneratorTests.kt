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
            extension SmokeTestInput: Swift.Encodable, Runtime.Reflection {
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
            extension ExplicitBlobInput: Swift.Encodable, Runtime.Reflection {
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
                let client: Runtime.SdkHttpClient
                let config: AWSRuntime.AWSClientConfiguration
                let serviceName = "Example"
                let encoder: Runtime.RequestEncoder
                let decoder: Runtime.ResponseDecoder
            
                public init(config: AWSRuntime.AWSClientConfiguration) {
                    client = Runtime.SdkHttpClient(engine: config.httpClientEngine, config: config.httpClientConfiguration)
                    let encoder = JSONRuntime.JSONEncoder()
                    encoder.dateEncodingStrategy = .secondsSince1970
                    encoder.nonConformingFloatEncodingStrategy = .convertToString(positiveInfinity: "Infinity", negativeInfinity: "-Infinity", nan: "NaN")
                    self.encoder = config.encoder ?? encoder
                    let decoder = JSONRuntime.JSONDecoder()
                    decoder.dateDecodingStrategy = .secondsSince1970
                    decoder.nonConformingFloatDecodingStrategy = .convertFromString(positiveInfinity: "Infinity", negativeInfinity: "-Infinity", nan: "NaN")
                    self.decoder = config.decoder ?? decoder
                    self.config = config
                }
            
                public convenience init(region: Swift.String? = nil) throws {
                    let config = try ExampleClientConfiguration(region: region)
                    self.init(config: config)
                }
            
                deinit {
                    client.close()
                }
            
                public class ExampleClientConfiguration: AWSRuntime.AWSClientConfiguration {
            
                    public var clientLogMode: Runtime.ClientLogMode
                    public var decoder: Runtime.ResponseDecoder?
                    public var encoder: Runtime.RequestEncoder?
                    public var httpClientConfiguration: Runtime.HttpClientConfiguration
                    public var httpClientEngine: Runtime.HttpClientEngine
                    public var idempotencyTokenGenerator: Runtime.IdempotencyTokenGenerator
                    public var logger: Runtime.LogAgent
                    public var retryer: Runtime.SDKRetryer
            
                    public var credentialsProvider: AWSRuntime.CredentialsProvider
                    public var endpointResolver: AWSRuntime.EndpointResolver
                    public var frameworkMetadata: AWSRuntime.FrameworkMetadata?
                    public var region: Swift.String?
                    public var regionResolver: AWSRuntime.RegionResolver?
                    public var signingRegion: Swift.String?
            
                    public init(
                        credentialsProvider: AWSRuntime.CredentialsProvider? = nil,
                        endpointResolver: AWSRuntime.EndpointResolver? = nil,
                        frameworkMetadata: AWSRuntime.FrameworkMetadata? = nil,
                        region: Swift.String? = nil,
                        regionResolver: AWSRuntime.RegionResolver? = nil,
                        signingRegion: Swift.String? = nil,
                        runtimeConfig: Runtime.SDKRuntimeConfiguration
                    ) throws {
                        if let region = region {
                            self.region = region
                            self.regionResolver = nil
                            self.signingRegion = signingRegion ?? region
                        } else {
                            let resolvedRegionResolver = regionResolver ?? DefaultRegionResolver()
                            let region = resolvedRegionResolver.resolveRegion()
                            self.region = region
                            self.regionResolver = resolvedRegionResolver
                            self.signingRegion = signingRegion ?? region
                        }
                        self.endpointResolver = endpointResolver ?? DefaultEndpointResolver()
                        if let credProvider = credentialsProvider {
                            self.credentialsProvider = try AWSRuntime.AWSCredentialsProvider.fromCustom(credProvider)
                        } else {
                            self.credentialsProvider = try AWSRuntime.AWSCredentialsProvider.fromChain()
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
                        credentialsProvider: AWSRuntime.CredentialsProvider? = nil,
                        endpointResolver: AWSRuntime.EndpointResolver? = nil,
                        frameworkMetadata: AWSRuntime.FrameworkMetadata? = nil,
                        region: Swift.String? = nil,
                        regionResolver: AWSRuntime.RegionResolver? = nil,
                        signingRegion: Swift.String? = nil
                    ) throws {
                        let defaultRuntimeConfig = try Runtime.DefaultSDKRuntimeConfiguration("ExampleClient")
                        try self.init(credentialsProvider: credentialsProvider, endpointResolver: endpointResolver, frameworkMetadata: frameworkMetadata, region: region, regionResolver: regionResolver, signingRegion: signingRegion, runtimeConfig: defaultRuntimeConfig)
                    }
                }
            }
            
            public struct ExampleClientLogHandlerFactory: Runtime.SDKLogHandlerFactory {
                public var label = "ExampleClient"
                let logLevel: Runtime.SDKLogLevel
                public func construct(label: String) -> LogHandler {
                    var handler = StreamLogHandler.standardOutput(label: label)
                    handler.logLevel = logLevel.toLoggerType()
                    return handler
                }
                public init(logLevel: Runtime.SDKLogLevel) {
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
