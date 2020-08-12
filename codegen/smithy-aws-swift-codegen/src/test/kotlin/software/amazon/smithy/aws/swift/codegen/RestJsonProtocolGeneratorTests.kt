/*
 * Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
 *
 * Licensed under the Apache License, Version 2.0 (the "License").
 * You may not use this file except in compliance with the License.
 * A copy of the License is located at
 *
 *  http://aws.amazon.com/apache2.0
 *
 * or in the "license" file accompanying this file. This file is distributed
 * on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
 * express or implied. See the License for the specific language governing
 * permissions and limitations under the License.
 */

package software.amazon.smithy.aws.swift.codegen

import io.kotest.matchers.string.shouldContainOnlyOnce
import org.junit.jupiter.api.Test
import software.amazon.smithy.aws.traits.protocols.RestJson1Trait
import software.amazon.smithy.build.MockManifest
import software.amazon.smithy.codegen.core.SymbolProvider
import software.amazon.smithy.model.shapes.ShapeId
import software.amazon.smithy.model.traits.TimestampFormatTrait
import software.amazon.smithy.swift.codegen.SwiftCodegenPlugin
import software.amazon.smithy.swift.codegen.SwiftDelegator
import software.amazon.smithy.swift.codegen.SwiftSettings
import software.amazon.smithy.swift.codegen.integration.ProtocolGenerator

class MockRestJsonProtocolGenerator : RestJsonProtocolGenerator() {
    override val defaultContentType: String = "application/json"
    override val defaultTimestampFormat: TimestampFormatTrait.Format = TimestampFormatTrait.Format.EPOCH_SECONDS
    override val protocol: ShapeId = RestJson1Trait.ID
}

// NOTE: protocol conformance is mostly handled by the protocol tests suite
class RestJsonProtocolGeneratorTests: TestsBase() {
    val model = createModelFromSmithy("http-binding-protocol-generator-test.smithy")

    data class TestContext(val ctx: ProtocolGenerator.GenerationContext,
                           val manifest: MockManifest,
                           val generator: MockRestJsonProtocolGenerator)

    private fun newTestContext(): TestContext {
        val manifest = MockManifest()
        val provider: SymbolProvider = SwiftCodegenPlugin.createSymbolProvider(model, "Example")
        val serviceShapeIdWithNamespace = "com.test#Example"
        val service = model.getShape(ShapeId.from(serviceShapeIdWithNamespace)).get().asServiceShape().get()
        val settings = SwiftSettings.from(model, buildDefaultSwiftSettingsObjectNode(serviceShapeIdWithNamespace))
        val delegator = SwiftDelegator(settings, model, manifest, provider)
        val generator = MockRestJsonProtocolGenerator()
        val ctx = ProtocolGenerator.GenerationContext(settings, model, service, provider, listOf(), "mockHttp", delegator)
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
        val contents = getModelFileContents("Example","SmokeTestRequest.swift", newTestContext.manifest)
        contents.shouldSyntacticSanityCheck()
        val expectedContents =
                "extension SmokeTestRequest: Encodable {\n" +
                "    private enum CodingKeys: String, CodingKey {\n" +
                "        case payload1, payload2, payload3\n" +
                "    }\n" +
                "}"
        contents.shouldContainOnlyOnce(expectedContents)
    }

    @Test
    fun `define coding keys for payload member`() {
        val contents = getModelFileContents("Example","ExplicitBlobRequest.swift", newTestContext.manifest)
        contents.shouldSyntacticSanityCheck()
        val expectedContents =
                "extension ExplicitBlobRequest: Encodable {\n" +
                "    private enum CodingKeys: String, CodingKey {\n" +
                "        case payload1\n" +
                "    }\n" +
                "}"
        contents.shouldContainOnlyOnce(expectedContents)
    }

    @Test
    fun `defines coding keys for List Input requests`() {
        val contents = getModelFileContents("Example","ListInputRequest.swift", newTestContext.manifest)
        contents.shouldSyntacticSanityCheck()
        val expectedContents =
                "extension ListInputRequest: Encodable {\n" +
                "    private enum CodingKeys: String, CodingKey {\n" +
                "        case blobList, enumList, intList, nestedIntList, structList\n" +
                "    }\n" +
                "}"
        contents.shouldContainOnlyOnce(expectedContents)
    }

    @Test
    fun `generated client has encoder configured`() {
        val contents = getClientFileContents("Example","ExampleClient.swift", newTestContext.manifest)
        contents.shouldSyntacticSanityCheck()
        val expectedContents =
                "public class ExampleClient {\n" +
                "    let client: HttpClient\n" +
                "    let encoder: JSONEncoder = JSONEncoder()\n" +
                "    init(config: HttpClientConfiguration = HttpClientConfiguration()) {\n" +
                "        client = HttpClient(config: config)\n" +
                "        encoder.dateEncodingStrategy = .custom(EpochSecondsDateFormatterContainer.encode)\n" +
                "    }\n" +
                "}\n"
        contents.shouldContainOnlyOnce(expectedContents)
    }
}
