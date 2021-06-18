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
                let config: ExampleClientConfiguration
                let serviceName = "Example"
                let encoder: RequestEncoder
                let decoder: ResponseDecoder
            
                public init(config: ExampleClientConfiguration) {
                    client = SdkHttpClient(engine: config.httpClientEngine, config: config.httpClientConfiguration)
                    let encoder = JSONEncoder()
                    encoder.dateEncodingStrategy = .secondsSince1970
                    self.encoder = config.encoder ?? encoder
                    let decoder = JSONDecoder()
                    decoder.dateDecodingStrategy = .secondsSince1970
                    self.decoder = config.decoder ?? decoder
                    self.config = config
                }
            
                public class ExampleClientConfiguration: ClientRuntime.Configuration, AWSClientConfiguration {
            
                    public var region: String
                    public var credentialsProvider: AWSCredentialsProvider
                    public var signingRegion: String
                    public var endpointResolver: EndpointResolver
            
                    public init (
                        credentialsProvider: AWSCredentialsProvider,
                        endpointResolver: EndpointResolver,
                        region: String,
                        signingRegion: String
                    ) throws
                    {
                        self.credentialsProvider = credentialsProvider
                        self.endpointResolver = endpointResolver
                        self.region = region
                        self.signingRegion = signingRegion
                    }
            
                    public convenience init(credentialsProvider: AWSCredentialsProvider) throws {
                        let region = "us-east-1"
                        let signingRegion = "us-east-1"
                        let endpointResolver = DefaultEndpointResolver()
                        try self.init(
                            credentialsProvider: credentialsProvider,
                            endpointResolver: endpointResolver,
                            region: region,
                            signingRegion: signingRegion
                        )
                    }
            
                    public static func `default`() throws -> ExampleClientConfiguration {
                        let awsCredsProvider = try AWSCredentialsProvider.fromEnv()
                        return try ExampleClientConfiguration(credentialsProvider: awsCredsProvider)
                    }
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
