package software.amazon.smithy.aws.swift.codegen

import software.amazon.smithy.build.MockManifest
import software.amazon.smithy.codegen.core.SymbolProvider
import software.amazon.smithy.model.shapes.ShapeId
import software.amazon.smithy.swift.codegen.AddOperationShapes
import software.amazon.smithy.swift.codegen.SwiftCodegenPlugin
import software.amazon.smithy.swift.codegen.SwiftDelegator
import software.amazon.smithy.swift.codegen.SwiftSettings
import software.amazon.smithy.swift.codegen.integration.ProtocolGenerator
import software.amazon.smithy.swift.codegen.integration.SwiftIntegration

class RestXMLProtocolNoInputNoOutputGeneratorTests : TestsBase() {
    var model = createModelFromSmithy("restxml-generator-test.smithy")

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
    /*
    @Test
    fun `smoke test`() {
        // /Example/ExampleClient.swift
        // /Example/models/NoInputAndNoOutputError+ResponseInit.swift

        // /Example/models/NoInputAndNoOutputInput+Encodable.swift
        // /Example/models/NoInputAndNoOutputInput+HeaderMiddleware.swift
        // /Example/models/NoInputAndNoOutputInput+QueryItemMiddleware.swift

        // /Example/models/NoInputAndNoOutputOutput+ResponseInit.swift

        // /ExampleTests/NoInputAndNoOutputRequestTest.swift
        // /ExampleTests/NoInputAndNoOutputResponseTest.swift


        val contents = getModelFileContents("Example", "NoInputAndNoOutputInput+Encodable.swift", newTestContext.manifest)
        contents.shouldSyntacticSanityCheck()
        print("$contents")
        val expectedContents =
            """
extension SmokeTestInput: Encodable, Reflection {
            """.trimIndent()
        contents.shouldContainOnlyOnce(expectedContents)
    }*/
}
