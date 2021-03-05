package software.amazon.smithy.aws.swift.codegen

import io.kotest.matchers.string.shouldContainOnlyOnce
import org.junit.jupiter.api.Test
import software.amazon.smithy.build.MockManifest
import software.amazon.smithy.codegen.core.SymbolProvider
import software.amazon.smithy.model.shapes.ShapeId
import software.amazon.smithy.swift.codegen.AddOperationShapes
import software.amazon.smithy.swift.codegen.SwiftCodegenPlugin
import software.amazon.smithy.swift.codegen.SwiftDelegator
import software.amazon.smithy.swift.codegen.SwiftSettings
import software.amazon.smithy.swift.codegen.integration.ProtocolGenerator
import software.amazon.smithy.swift.codegen.integration.SwiftIntegration

class RestXMLProtocolXMLAttributesGeneratorTests : TestsBase() {
    var model = createModelFromSmithy("restxml-attributes-generator-test.smithy")

    data class TestContext(
        val ctx: ProtocolGenerator.GenerationContext,
        val manifest: MockManifest,
        val generator: MockRestXmlProtocolGenerator
    )

    private fun newTestContext(): TestContext {
        val manifest = MockManifest()
        val provider: SymbolProvider = SwiftCodegenPlugin.createSymbolProvider(model, "Example", "Example")
        val serviceShapeIdWithNamespace = "aws.protocoltests.restxml#RestXml"
        val service = model.getShape(ShapeId.from(serviceShapeIdWithNamespace)).get().asServiceShape().get()
        val settings = SwiftSettings.from(model, buildDefaultSwiftSettingsObjectNode(serviceShapeIdWithNamespace))
        model = AddOperationShapes.execute(model, settings.getService(model), settings.moduleName)
        val integrations = mutableListOf<SwiftIntegration>()
        val delegator = SwiftDelegator(settings, model, manifest, provider, integrations)
        val generator = MockRestXmlProtocolGenerator()

        val ctx = ProtocolGenerator.GenerationContext(settings, model, service, provider, integrations, generator.protocol, delegator)
        return TestContext(ctx, manifest, generator)
    }

    val newTestContext = newTestContext()

    init {
        newTestContext.generator.generateSerializers(newTestContext.ctx)
        newTestContext.generator.generateProtocolClient(newTestContext.ctx)
        newTestContext.generator.generateDeserializers(newTestContext.ctx)
        newTestContext.generator.generateProtocolUnitTests(newTestContext.ctx)
        newTestContext.ctx.delegator.flushWriters()
    }

    @Test
    fun `smoke test for rendering encodable with dynamic node encoding`() {
        val contents = getModelFileContents("Example", "XmlAttributesOnPayloadInput+Encodable.swift", newTestContext.manifest)
        contents.shouldSyntacticSanityCheck()
        // TODO: Eventually, we will need to check for DynamicNodeEncoding that uses attribute
        val expectedContents =
            """
            extension XmlAttributesOnPayloadInput: Encodable, Reflection {
            """.trimIndent()
        contents.shouldContainOnlyOnce(expectedContents)
    }
}
