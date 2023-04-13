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
            @_spi(FileBasedConfig) import AWSClientRuntime
            import ClientRuntime
            import Foundation
            import Logging
            
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
            
                public class ExampleClientConfiguration: ExampleClientConfigurationProtocol {
                    public var clientLogMode: ClientRuntime.ClientLogMode
                    public var decoder: ClientRuntime.ResponseDecoder?
                    public var encoder: ClientRuntime.RequestEncoder?
                    public var httpClientConfiguration: ClientRuntime.HttpClientConfiguration
                    public var httpClientEngine: ClientRuntime.HttpClientEngine
                    public var idempotencyTokenGenerator: ClientRuntime.IdempotencyTokenGenerator
                    public var logger: ClientRuntime.LogAgent
                    public var retryer: ClientRuntime.SDKRetryer
            
                    public var credentialsProvider: AWSClientRuntime.CredentialsProviding
                    public var endpoint: Swift.String?
                    public var frameworkMetadata: AWSClientRuntime.FrameworkMetadata?
                    public var region: Swift.String?
                    public var regionResolver: AWSClientRuntime.RegionResolver?
                    public var signingRegion: Swift.String?
                    public var useDualStack: Swift.Bool?
                    public var useFIPS: Swift.Bool?
            
                    public var endpointResolver: EndpointResolver
            
                    /// Creates a configuration asynchronously
                    public convenience init(
                        credentialsProvider: AWSClientRuntime.CredentialsProviding? = nil,
                        endpoint: Swift.String? = nil,
                        endpointResolver: EndpointResolver? = nil,
                        frameworkMetadata: AWSClientRuntime.FrameworkMetadata? = nil,
                        region: Swift.String? = nil,
                        regionResolver: AWSClientRuntime.RegionResolver? = nil,
                        runtimeConfig: ClientRuntime.SDKRuntimeConfiguration? = nil,
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
            
                        let resolvedCredentialProvider: AWSClientRuntime.CredentialsProviding
                        if let credentialsProvider = credentialsProvider {
                            resolvedCredentialProvider = credentialsProvider
                        } else {
                            resolvedCredentialProvider = try DefaultChainCredentialsProvider(fileBasedConfig: fileBasedConfig)
                        }
            
                        try self.init(
                            credentialsProvider: resolvedCredentialProvider,
                            endpoint: endpoint,
                            endpointResolver: resolvedEndpointsResolver,
                            frameworkMetadata: frameworkMetadata,
                            region: resolvedRegion,
                            signingRegion: signingRegion,
                            useDualStack: useDualStack,
                            useFIPS: useFIPS,
                            runtimeConfig: runtimeConfig,
                        )
                    }
            
                    public convenience init(
                        region: Swift.String,
                        credentialsProvider: AWSClientRuntime.CredentialsProviding? = nil,
                        endpoint: Swift.String? = nil,
                        endpointResolver: EndpointResolver? = nil,
                        frameworkMetadata: AWSClientRuntime.FrameworkMetadata? = nil,
                        runtimeConfig: ClientRuntime.SDKRuntimeConfiguration? = nil,
                        signingRegion: Swift.String? = nil,
                        useDualStack: Swift.Bool? = nil,
                        useFIPS: Swift.Bool? = nil
                    ) throws {
                        let resolvedCredentialsProvider: CredentialsProviding
                        if let credentialsProvider = credentialsProvider {
                            resolvedCredentialsProvider = credentialsProvider
                        } else {
                            let fileBasedConfig = try CRTFileBasedConfiguration.make()
                            resolvedCredentialProvider = try DefaultChainCredentialsProvider(fileBasedConfig: fileBasedConfig)
                        }
            
                        try self.init(
                            credentialsProvider: resolvedCredentialProvider,
                            endpoint: endpoint,
                            endpointResolver: endpointResolver,
                            frameworkMetadata: frameworkMetadata,
                            region: region,
                            signingRegion: signingRegion,
                            useDualStack: useDualStack,
                            useFIPS: useFIPS,
                            runtimeConfig: runtimeConfig,
                        )
                    }
            
                    /// Internal designated init
                    /// All convenience inits should call this
                    public init(
                        credentialsProvider: AWSClientRuntime.CredentialsProviding,
                        endpoint: Swift.String?,
                        endpointResolver: EndpointResolver?,
                        frameworkMetadata: AWSClientRuntime.FrameworkMetadata?,
                        region: Swift.String?,
                        signingRegion: Swift.String?,
                        useDualStack: Swift.Bool?,
                        useFIPS: Swift.Bool?,
                        runtimeConfig: ClientRuntime.DefaultSDKRuntimeConfiguration? = nil
                    ) throws {
                        let runtimeConfig = try runtimeConfig ?? ClientRuntime.DefaultSDKRuntimeConfiguration("ExampleClient")
            
                        let resolvedSigningRegion = signingRegion ?? region
            
                        let resolvedEndpointsResolver = try endpointResolver ?? DefaultEndpointResolver()
            
                        self.credentialsProvider = credentialsProvider
                        self.endpoint = endpoint
                        self.endpointResolver = resolvedEndpointsResolver
                        self.frameworkMetadata = frameworkMetadata
                        self.region = region
                        // TODO: Remove region resolver. Region must already be resolved and there is no point in storing the resolver.
                        self.regionResolver = nil
                        self.signingRegion = resolvedSigningRegion
                        self.useDualStack = useDualStack
                        self.useFIPS = useFIPS
                        self.clientLogMode = runtimeConfig.clientLogMode
                        self.decoder = runtimeConfig.decoder
                        self.encoder = runtimeConfig.encoder
                        self.httpClientConfiguration = runtimeConfig.httpClientConfiguration
                        self.httpClientEngine = runtimeConfig.httpClientEngine
                        self.idempotencyTokenGenerator = runtimeConfig.idempotencyTokenGenerator
                        self.logger = runtimeConfig.logger
                        self.retryer = runtimeConfig.retryer
                    }

                    public var partitionID: String? {
                        return "ExampleClient - \(region ?? "")"
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
        val context = initContextFrom(smithyFile, serviceShapeId, RestJson1Trait.ID)

        val generator = AWSRestJson1ProtocolGenerator()
        generator.generateProtocolUnitTests(context.ctx)
        context.ctx.delegator.flushWriters()
        return context
    }
}
