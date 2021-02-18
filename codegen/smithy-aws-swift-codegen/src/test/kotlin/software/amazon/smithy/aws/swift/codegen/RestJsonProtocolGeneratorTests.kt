/*
 * Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
 * SPDX-License-Identifier: Apache-2.0.
 */

package software.amazon.smithy.aws.swift.codegen

import io.kotest.matchers.string.shouldContainOnlyOnce
import org.junit.jupiter.api.Test
import software.amazon.smithy.aws.swift.codegen.restjson.AWSErrorFromAWSRestHttpResponseGenerator
import software.amazon.smithy.aws.traits.protocols.RestJson1Trait
import software.amazon.smithy.build.MockManifest
import software.amazon.smithy.codegen.core.SymbolProvider
import software.amazon.smithy.model.shapes.ShapeId
import software.amazon.smithy.model.traits.TimestampFormatTrait
import software.amazon.smithy.swift.codegen.AddOperationShapes
import software.amazon.smithy.swift.codegen.SwiftCodegenPlugin
import software.amazon.smithy.swift.codegen.SwiftDelegator
import software.amazon.smithy.swift.codegen.SwiftSettings
import software.amazon.smithy.swift.codegen.integration.ProtocolGenerator
import software.amazon.smithy.swift.codegen.integration.SwiftIntegration

class MockRestAWSHttpBindingJsonProtocolGenerator : AWSHttpBindingProtocolGenerator() {
    override val defaultContentType: String = "application/json"
    override val defaultTimestampFormat: TimestampFormatTrait.Format = TimestampFormatTrait.Format.EPOCH_SECONDS
    override val protocol: ShapeId = RestJson1Trait.ID
    override val httpProtocolClientGeneratorFactory = AWSHttpProtocolClientGeneratorFactory()
    override val httpProtocolClientCustomizable = AWSHttpProtocolClientCustomizableFactory().constructClientCustomizable(protocol)
    override val errorFromHttpResponseGenerator = AWSErrorFromAWSRestHttpResponseGenerator()
}

// NOTE: protocol conformance is mostly handled by the protocol tests suite
class RestJsonProtocolGeneratorTests : TestsBase() {
    var model = createModelFromSmithy("http-binding-protocol-generator-test.smithy")

    data class TestContext(
        val ctx: ProtocolGenerator.GenerationContext,
        val manifest: MockManifest,
        val generator: MockRestAWSHttpBindingJsonProtocolGenerator
    )

    private fun newTestContext(): TestContext {
        val manifest = MockManifest()
        val provider: SymbolProvider = SwiftCodegenPlugin.createSymbolProvider(model, "Example", "Example")
        val serviceShapeIdWithNamespace = "com.test#Example"
        val service = model.getShape(ShapeId.from(serviceShapeIdWithNamespace)).get().asServiceShape().get()
        val settings = SwiftSettings.from(model, buildDefaultSwiftSettingsObjectNode(serviceShapeIdWithNamespace))
        model = AddOperationShapes.execute(model, settings.getService(model), settings.moduleName)
        val integrations = mutableListOf<SwiftIntegration>()
        val delegator = SwiftDelegator(settings, model, manifest, provider, integrations)
        val generator = MockRestAWSHttpBindingJsonProtocolGenerator()

        val ctx = ProtocolGenerator.GenerationContext(settings, model, service, provider, integrations, generator.protocol, delegator)
        return TestContext(ctx, manifest, generator)
    }

    val newTestContext = newTestContext()

    init {
        newTestContext.generator.generateSerializers(newTestContext.ctx)
        newTestContext.generator.generateProtocolClient(newTestContext.ctx)
        newTestContext.ctx.delegator.flushWriters()
    }

    @Test
    fun `define coding keys for unbound document payload members`() {
        val contents = getModelFileContents("Example", "SmokeTestInput+Encodable.swift", newTestContext.manifest)
        contents.shouldSyntacticSanityCheck()
        val expectedContents =
"""
extension SmokeTestInput: Encodable, Reflection {
    private enum CodingKeys: String, CodingKey {
        case payload1
        case payload2
        case payload3
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        if let payload1 = payload1 {
            try container.encode(payload1, forKey: .payload1)
        }
        if let payload2 = payload2 {
            try container.encode(payload2, forKey: .payload2)
        }
        if let payload3 = payload3 {
            try container.encode(payload3, forKey: .payload3)
        }
    }
}
            """.trimIndent()
        contents.shouldContainOnlyOnce(expectedContents)
    }

    @Test
    fun `define coding keys for payload member`() {
        val contents = getModelFileContents("Example", "ExplicitBlobInput+Encodable.swift", newTestContext.manifest)
        contents.shouldSyntacticSanityCheck()
        val expectedContents =
"""
extension ExplicitBlobInput: Encodable, Reflection {
    private enum CodingKeys: String, CodingKey {
        case payload1
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        if let payload1 = payload1 {
            try container.encode(payload1.base64EncodedString(), forKey: .payload1)
        }
    }
}
            """.trimIndent()
        contents.shouldContainOnlyOnce(expectedContents)
    }

    @Test
    fun `generated client has proper configuration`() {
        val contents = getClientFileContents("Example", "ExampleClient.swift", newTestContext.manifest)
        contents.shouldSyntacticSanityCheck()
        val expectedContents =
"""
public class ExampleClient {
    let client: SdkHttpClient
    let config: ExampleClientConfiguration
    let serviceName = "Example"
    let encoder: RequestEncoder
    let decoder: ResponseDecoder

    public init(config: ExampleClientConfiguration) throws {
        client = try SdkHttpClient(engine: config.httpClientEngine, config: config.httpClientConfiguration)
        let encoder = JSONEncoder()
        encoder.dateEncodingStrategy = .secondsSince1970
        self.encoder = config.encoder ?? encoder
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .secondsSince1970
        self.decoder = config.decoder ?? decoder
        self.config = config
    }

    public class ExampleClientConfiguration: Configuration, AWSClientConfiguration {

        public var region: String
        public var credentialsProvider: AWSCredentialsProvider
        public var signingRegion: String

        public init (
            credentialsProvider: AWSCredentialsProvider,
            region: String,
            signingRegion: String
        )
        {
            self.credentialsProvider = credentialsProvider
            self.region = region
            self.signingRegion = signingRegion
        }

        public convenience init(credentialsProvider: AWSCredentialsProvider) {
            let region = "us-east-1"
            let signingRegion = "us-east-1"
            self.init(
                credentialsProvider: credentialsProvider,
                region: region,
                signingRegion: signingRegion
            )
        }

        public static func `default`() throws -> ExampleClientConfiguration {
            let awsCredsProvider = try AWSCredentialsProvider.fromEnv()
            return ExampleClientConfiguration(credentialsProvider: awsCredsProvider)
        }
    }
}

            """.trimIndent()
        contents.shouldContainOnlyOnce(expectedContents)
    }
}
