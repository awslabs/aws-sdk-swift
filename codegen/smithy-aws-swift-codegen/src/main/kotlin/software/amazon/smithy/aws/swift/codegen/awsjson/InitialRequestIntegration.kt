package software.amazon.smithy.swift.codegen

import software.amazon.smithy.aws.traits.protocols.AwsJson1_0Trait
import software.amazon.smithy.aws.traits.protocols.AwsJson1_1Trait
import software.amazon.smithy.codegen.core.Symbol
import software.amazon.smithy.model.Model
import software.amazon.smithy.model.knowledge.EventStreamIndex
import software.amazon.smithy.model.knowledge.TopDownIndex
import software.amazon.smithy.model.shapes.StructureShape
import software.amazon.smithy.swift.codegen.core.CodegenContext
import software.amazon.smithy.swift.codegen.integration.ProtocolGenerator
import software.amazon.smithy.swift.codegen.integration.SwiftIntegration
import software.amazon.smithy.swift.codegen.integration.serde.readwrite.DocumentWritingClosureUtils
import software.amazon.smithy.swift.codegen.integration.serde.readwrite.WritingClosureUtils
import software.amazon.smithy.swift.codegen.model.hasTrait

class InitialRequestIntegration : SwiftIntegration {
    override fun enabledForService(model: Model, settings: SwiftSettings): Boolean {
        val service = settings.getService(model)
        return service.hasTrait<AwsJson1_0Trait>() || service.hasTrait<AwsJson1_1Trait>()
    }

    override fun writeAdditionalFiles(
        ctx: CodegenContext,
        protocolGenerationContext: ProtocolGenerator.GenerationContext,
        delegator: SwiftDelegator
    ) {
        val contentType: String = ctx.protocolGenerator?.defaultContentType ?: "application/json"
        val resolvedInputShapes = getOperationInputShapesWithStreamingUnionMember(protocolGenerationContext)
        resolvedInputShapes.forEach {
            val symbol: Symbol = ctx.symbolProvider.toSymbol(it)
            val rootNamespace = ctx.settings.moduleName
            val inputStruct = Symbol.builder()
                .definitionFile("./$rootNamespace/models/${symbol.name}+MakeInitialRequestMessage.swift")
                .name(symbol.name)
                .build()
            protocolGenerationContext.delegator.useShapeWriter(inputStruct) { writer ->
                writer.apply {
                    addImport(SwiftDependency.CLIENT_RUNTIME.target)
                    openBlock("extension ${symbol.fullName} {", "}") {
                        openBlock(
                            "func makeInitialRequestMessage(encoder: ClientRuntime.RequestEncoder) throws -> EventStream.Message {",
                            "}"
                        ) {
                            val documentWritingClosure = DocumentWritingClosureUtils(protocolGenerationContext, writer).closure(it)
                            val valueWritingClosure = WritingClosureUtils(protocolGenerationContext, writer).writingClosure(it)
                            write("let initialRequestPayload = try \$L(self, \$L)", documentWritingClosure, valueWritingClosure)
                            openBlock(
                                "let initialRequestMessage = EventStream.Message(",
                                ")"
                            ) {
                                openBlock(
                                    "headers: [",
                                    "],"
                                ) {
                                    write("EventStream.Header(name: \":message-type\", value: .string(\"event\")),")
                                    write("EventStream.Header(name: \":event-type\", value: .string(\"initial-request\")),")
                                    write("EventStream.Header(name: \":content-type\", value: .string(\$S))", contentType)
                                }
                                write("payload: initialRequestPayload")
                            }
                            write("return initialRequestMessage")
                        }
                    }
                }
            }
        }
    }

    private fun getOperationInputShapesWithStreamingUnionMember(
        ctx: ProtocolGenerator.GenerationContext
    ): List<StructureShape> {
        var inputShapesWithStreamingUnion = ArrayList<StructureShape>()
        val eventStreamIndex = EventStreamIndex.of(ctx.model)
        TopDownIndex.of(ctx.model).getContainedOperations(ctx.service).forEach {
            eventStreamIndex.getInputInfo(it).ifPresent {
                inputShapesWithStreamingUnion.add(it.structure)
            }
        }
        return inputShapesWithStreamingUnion
    }
}
