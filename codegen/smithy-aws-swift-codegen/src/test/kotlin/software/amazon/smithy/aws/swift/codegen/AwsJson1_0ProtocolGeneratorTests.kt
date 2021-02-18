package software.amazon.smithy.aws.swift.codegen

import io.kotest.matchers.string.shouldContainOnlyOnce
import org.junit.jupiter.api.Test
import software.amazon.smithy.aws.swift.codegen.awsjson.AwsJson1_0_ProtocolGenerator
import software.amazon.smithy.build.MockManifest
import software.amazon.smithy.codegen.core.SymbolProvider
import software.amazon.smithy.model.shapes.ShapeId
import software.amazon.smithy.swift.codegen.AddOperationShapes
import software.amazon.smithy.swift.codegen.SwiftCodegenPlugin
import software.amazon.smithy.swift.codegen.SwiftDelegator
import software.amazon.smithy.swift.codegen.SwiftSettings
import software.amazon.smithy.swift.codegen.integration.ProtocolGenerator
import software.amazon.smithy.swift.codegen.integration.SwiftIntegration

class AwsJson1_0ProtocolGeneratorTests : TestsBase() {
    var model = createModelFromSmithy("awsJson1_0.smithy")

    data class TestContext(
        val ctx: ProtocolGenerator.GenerationContext,
        val manifest: MockManifest,
        val generator: AwsJson1_0_ProtocolGenerator
    )

    private fun newTestContext(): TestContext {
        val manifest = MockManifest()
        val provider: SymbolProvider = SwiftCodegenPlugin.createSymbolProvider(model, "Example", "Example")
        val serviceShapeIdWithNamespace = "com.test#JsonRpc10"
        val service = model.getShape(ShapeId.from(serviceShapeIdWithNamespace)).get().asServiceShape().get()
        val settings = SwiftSettings.from(model, buildDefaultSwiftSettingsObjectNode(serviceShapeIdWithNamespace))
        model = AddOperationShapes.execute(model, settings.getService(model), settings.moduleName)
        val integrations = mutableListOf<SwiftIntegration>()
        val delegator = SwiftDelegator(settings, model, manifest, provider, integrations)
        val generator = AwsJson1_0_ProtocolGenerator()

        val ctx = ProtocolGenerator.GenerationContext(settings, model, service, provider, integrations, generator.protocol, delegator)
        return TestContext(ctx, manifest, generator)
    }

    val newTestContext = newTestContext()

    init {
        newTestContext.generator.generateSerializers(newTestContext.ctx)
        newTestContext.generator.generateProtocolClient(newTestContext.ctx)
        newTestContext.generator.generateDeserializers(newTestContext.ctx)
        newTestContext.ctx.delegator.flushWriters()
    }

    @Test
    fun `it builds response binding for EmptyInputAndEmptyOutput output`() {
        val contents = getModelFileContents("Example", "EmptyInputAndEmptyOutputOutput+ResponseInit.swift", newTestContext.manifest)
        contents.shouldSyntacticSanityCheck()
        val expectedContents =
            """
                extension EmptyInputAndEmptyOutputOutput: HttpResponseBinding {
                    public init (httpResponse: HttpResponse, decoder: ResponseDecoder? = nil) throws {

                    }
                }
            """.trimIndent()
        contents.shouldContainOnlyOnce(expectedContents)
    }

    @Test
    fun `it builds response binding for GreetingWithErrors output`() {
        val contents = getModelFileContents("Example", "GreetingWithErrorsOutput+ResponseInit.swift", newTestContext.manifest)
        contents.shouldSyntacticSanityCheck()
        val expectedContents =
            """
                extension GreetingWithErrorsOutput: HttpResponseBinding {
                    public init (httpResponse: HttpResponse, decoder: ResponseDecoder? = nil) throws {

                        if case .data(let data) = httpResponse.body,
                            let unwrappedData = data,
                            let responseDecoder = decoder {
                            let output: GreetingWithErrorsOutputBody = try responseDecoder.decode(responseBody: unwrappedData)
                            self.greeting = output.greeting
                        } else {
                            self.greeting = nil
                        }
                    }
                }
            """.trimIndent()
        contents.shouldContainOnlyOnce(expectedContents)
    }

    @Test
    fun `it builds response binding for GreetingWithErrors error`() {
        val contents = getModelFileContents("Example", "GreetingWithErrorsError+ResponseInit.swift", newTestContext.manifest)
        contents.shouldSyntacticSanityCheck()
        val expectedContents =
            """
                extension GreetingWithErrorsError {
                    public init(errorType: String?, httpResponse: HttpResponse, decoder: ResponseDecoder? = nil, message: String? = nil, requestID: String? = nil) throws {
                        switch errorType {
                        case "ComplexError" : self = .complexError(try ComplexError(httpResponse: httpResponse, decoder: decoder, message: message, requestID: requestID))
                        case "FooError" : self = .fooError(try FooError(httpResponse: httpResponse, decoder: decoder, message: message, requestID: requestID))
                        case "InvalidGreeting" : self = .invalidGreeting(try InvalidGreeting(httpResponse: httpResponse, decoder: decoder, message: message, requestID: requestID))
                        default : self = .unknown(UnknownAWSHttpServiceError(httpResponse: httpResponse, message: message))
                        }
                    }
                }
            """.trimIndent()
        contents.shouldContainOnlyOnce(expectedContents)
        // TODO: The next line should be removed after we implement error types
        // contents.shouldNotContain("RestJSONError")
    }
}
