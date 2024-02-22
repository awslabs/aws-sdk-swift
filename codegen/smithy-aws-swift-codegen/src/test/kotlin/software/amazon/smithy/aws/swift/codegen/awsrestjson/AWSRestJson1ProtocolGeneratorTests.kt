/*
 * Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
 * SPDX-License-Identifier: Apache-2.0.
 */

package software.amazon.smithy.aws.swift.codegen.awsrestjson

import io.kotest.matchers.string.shouldContainOnlyOnce
import org.junit.jupiter.api.Test
import software.amazon.smithy.aws.swift.codegen.TestContext
import software.amazon.smithy.aws.swift.codegen.TestContextGenerator.Companion.getClientFileContents
import software.amazon.smithy.aws.swift.codegen.TestContextGenerator.Companion.getModelFileContents
import software.amazon.smithy.aws.swift.codegen.TestContextGenerator.Companion.initContextFrom
import software.amazon.smithy.aws.swift.codegen.restjson.AWSRestJson1ProtocolGenerator
import software.amazon.smithy.aws.swift.codegen.shouldSyntacticSanityCheck
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
            
            public class ExampleClient: Client {
                public static let clientName = "ExampleClient"
                let client: ClientRuntime.SdkHttpClient
                let config: ExampleClient.ExampleClientConfiguration
                let serviceName = "Example"
                let encoder: ClientRuntime.RequestEncoder
                let decoder: ClientRuntime.ResponseDecoder
            
                public required init(config: ExampleClient.ExampleClientConfiguration) {
                    client = ClientRuntime.SdkHttpClient(engine: config.httpClientEngine, config: config.httpClientConfiguration)
                    let encoder = ClientRuntime.JSONEncoder()
                    encoder.dateEncodingStrategy = .secondsSince1970
                    encoder.nonConformingFloatEncodingStrategy = .convertToString(positiveInfinity: "Infinity", negativeInfinity: "-Infinity", nan: "NaN")
                    self.encoder = encoder
                    let decoder = ClientRuntime.JSONDecoder()
                    decoder.dateDecodingStrategy = .secondsSince1970
                    decoder.nonConformingFloatDecodingStrategy = .convertFromString(positiveInfinity: "Infinity", negativeInfinity: "-Infinity", nan: "NaN")
                    self.decoder = decoder
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
                public class ExampleClientConfiguration: AWSDefaultClientConfiguration & AWSRegionClientConfiguration & DefaultClientConfiguration & DefaultHttpClientConfiguration {
                    public var useFIPS: Swift.Bool?
            
                    public var useDualStack: Swift.Bool?
            
                    public var appID: Swift.String?
            
                    public var credentialsProvider: AWSClientRuntime.CredentialsProviding
            
                    public var awsRetryMode: AWSClientRuntime.AWSRetryMode
            
                    public var region: Swift.String?
            
                    public var signingRegion: Swift.String?
            
                    public var endpointResolver: EndpointResolver
            
                    public var logger: ClientRuntime.LogAgent
            
                    public var retryStrategyOptions: ClientRuntime.RetryStrategyOptions
            
                    public var clientLogMode: ClientRuntime.ClientLogMode
            
                    public var endpoint: Swift.String?
            
                    public var idempotencyTokenGenerator: ClientRuntime.IdempotencyTokenGenerator
            
                    public var httpClientEngine: ClientRuntime.HTTPClient
            
                    public var httpClientConfiguration: ClientRuntime.HttpClientConfiguration
            
                    private init(_ useFIPS: Swift.Bool?, _ useDualStack: Swift.Bool?, _ appID: Swift.String?, _ credentialsProvider: AWSClientRuntime.CredentialsProviding, _ awsRetryMode: AWSClientRuntime.AWSRetryMode, _ region: Swift.String?, _ signingRegion: Swift.String?, _ endpointResolver: EndpointResolver, _ logger: ClientRuntime.LogAgent, _ retryStrategyOptions: ClientRuntime.RetryStrategyOptions, _ clientLogMode: ClientRuntime.ClientLogMode, _ endpoint: Swift.String?, _ idempotencyTokenGenerator: ClientRuntime.IdempotencyTokenGenerator, _ httpClientEngine: ClientRuntime.HTTPClient, _ httpClientConfiguration: ClientRuntime.HttpClientConfiguration) {
                        self.useFIPS = useFIPS
                        self.useDualStack = useDualStack
                        self.appID = appID
                        self.credentialsProvider = credentialsProvider
                        self.awsRetryMode = awsRetryMode
                        self.region = region
                        self.signingRegion = signingRegion
                        self.endpointResolver = endpointResolver
                        self.logger = logger
                        self.retryStrategyOptions = retryStrategyOptions
                        self.clientLogMode = clientLogMode
                        self.endpoint = endpoint
                        self.idempotencyTokenGenerator = idempotencyTokenGenerator
                        self.httpClientEngine = httpClientEngine
                        self.httpClientConfiguration = httpClientConfiguration
                    }
            
                    public convenience init(useFIPS: Bool? = nil, useDualStack: Bool? = nil, appID: String? = nil, credentialsProvider: CredentialsProviding? = nil, awsRetryMode: AWSRetryMode? = nil, region: String? = nil, signingRegion: String? = nil, endpointResolver: EndpointResolver? = nil, logger: LogAgent? = nil, retryStrategyOptions: RetryStrategyOptions? = nil, clientLogMode: ClientLogMode? = nil, endpoint: String? = nil, idempotencyTokenGenerator: IdempotencyTokenGenerator? = nil, httpClientEngine: HTTPClient? = nil, httpClientConfiguration: HttpClientConfiguration? = nil) async throws {
                        self.init(useFIPS, useDualStack, try AWSClientConfigDefaultsProvider.appID(), try AWSClientConfigDefaultsProvider.credentialsProvider(credentialsProvider), try AWSClientConfigDefaultsProvider.retryMode(), try await AWSClientConfigDefaultsProvider.region(region), try await AWSClientConfigDefaultsProvider.region(region), try DefaultEndpointResolver(), AWSClientConfigDefaultsProvider.logger(clientName), try AWSClientConfigDefaultsProvider.retryStrategyOptions(), AWSClientConfigDefaultsProvider.clientLogMode, endpoint, AWSClientConfigDefaultsProvider.idempotencyTokenGenerator, AWSClientConfigDefaultsProvider.httpClientEngine, AWSClientConfigDefaultsProvider.httpClientConfiguration)}
            
                    public convenience init(useFIPS: Bool? = nil, useDualStack: Bool? = nil, appID: String? = nil, credentialsProvider: CredentialsProviding? = nil, awsRetryMode: AWSRetryMode? = nil, region: String? = nil, signingRegion: String? = nil, endpointResolver: EndpointResolver? = nil, logger: LogAgent? = nil, retryStrategyOptions: RetryStrategyOptions? = nil, clientLogMode: ClientLogMode? = nil, endpoint: String? = nil, idempotencyTokenGenerator: IdempotencyTokenGenerator? = nil, httpClientEngine: HTTPClient? = nil, httpClientConfiguration: HttpClientConfiguration? = nil) throws {
                        self.init(useFIPS, useDualStack, try appID ?? AWSClientConfigDefaultsProvider.appID(), try credentialsProvider ?? AWSClientConfigDefaultsProvider.credentialsProvider(credentialsProvider), try awsRetryMode ?? AWSClientConfigDefaultsProvider.retryMode(), region, signingRegion, try endpointResolver ?? DefaultEndpointResolver(), logger ?? AWSClientConfigDefaultsProvider.logger(clientName), try retryStrategyOptions ?? AWSClientConfigDefaultsProvider.retryStrategyOptions(), clientLogMode ?? AWSClientConfigDefaultsProvider.clientLogMode, endpoint, idempotencyTokenGenerator ?? AWSClientConfigDefaultsProvider.idempotencyTokenGenerator, httpClientEngine ?? AWSClientConfigDefaultsProvider.httpClientEngine, httpClientConfiguration ?? AWSClientConfigDefaultsProvider.httpClientConfiguration)}
            
                    public convenience required init() async throws {
                        try await self.init(useFIPS: nil, useDualStack: nil, appID: nil, credentialsProvider: nil, awsRetryMode: nil, region: nil, signingRegion: nil, endpointResolver: nil, logger: nil, retryStrategyOptions: nil, clientLogMode: nil, endpoint: nil, idempotencyTokenGenerator: nil, httpClientEngine: nil, httpClientConfiguration: nil)
                    }
            
                    public convenience init(region: String) throws {
                        self.init(nil, nil, try AWSClientConfigDefaultsProvider.appID(), try AWSClientConfigDefaultsProvider.credentialsProvider(), try AWSClientConfigDefaultsProvider.retryMode(), region, region, try DefaultEndpointResolver(), AWSClientConfigDefaultsProvider.logger(clientName), try AWSClientConfigDefaultsProvider.retryStrategyOptions(), AWSClientConfigDefaultsProvider.clientLogMode, nil, AWSClientConfigDefaultsProvider.idempotencyTokenGenerator, AWSClientConfigDefaultsProvider.httpClientEngine, AWSClientConfigDefaultsProvider.httpClientConfiguration)
                    }
            
                    public var partitionID: String? {
                        return "\(ExampleClient.clientName) - \(region ?? "")"
                    }
                }
            
                public static func builder() -> ClientBuilder<ExampleClient> {
                    return ClientBuilder<ExampleClient>(defaultPlugins: [
                        ClientRuntime.DefaultClientPlugin(),
                        AWSClientRuntime.DefaultAWSClientPlugin(clientName: self.clientName)
                    ])
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
