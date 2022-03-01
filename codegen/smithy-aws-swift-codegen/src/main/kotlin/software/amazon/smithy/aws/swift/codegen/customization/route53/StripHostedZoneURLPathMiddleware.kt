package software.amazon.smithy.aws.swift.codegen.customization.route53

import software.amazon.smithy.codegen.core.Symbol
import software.amazon.smithy.model.shapes.OperationShape
import software.amazon.smithy.swift.codegen.Middleware
import software.amazon.smithy.swift.codegen.MiddlewareGenerator
import software.amazon.smithy.swift.codegen.SwiftDependency
import software.amazon.smithy.swift.codegen.SwiftWriter
import software.amazon.smithy.swift.codegen.integration.ProtocolGenerator
import software.amazon.smithy.swift.codegen.integration.middlewares.handlers.MiddlewareShapeUtils
import software.amazon.smithy.swift.codegen.integration.steps.OperationInitializeStep

class StripHostedZoneURLPathMiddleware(
    inputSymbol: Symbol,
    outputSymbol: Symbol,
    outputErrorSymbol: Symbol,
    private val writer: SwiftWriter
) : Middleware(writer, inputSymbol, OperationInitializeStep(inputSymbol, outputSymbol, outputErrorSymbol)) {

    override val typeName = "${inputSymbol.name}StripHostedZoneMiddleware"

    companion object {
        fun renderMiddleware(ctx: ProtocolGenerator.GenerationContext, op: OperationShape) {
            val inputSymbol = MiddlewareShapeUtils.inputSymbol(ctx.symbolProvider, ctx.model, op)
            val outputSymbol = MiddlewareShapeUtils.outputSymbol(ctx.symbolProvider, ctx.model, op)
            val outputErrorSymbol = MiddlewareShapeUtils.outputErrorSymbol(op)
            val rootNamespace = MiddlewareShapeUtils.rootNamespace(ctx.settings)
            val urlPathMiddlewareSymbol = Symbol.builder()
                .definitionFile("./$rootNamespace/models/${inputSymbol.name}+StripHostedZone.swift")
                .name(inputSymbol.name)
                .build()
            ctx.delegator.useShapeWriter(urlPathMiddlewareSymbol) { writer ->
                writer.addImport(SwiftDependency.CLIENT_RUNTIME.target)
                val urlPathMiddleware = StripHostedZoneURLPathMiddleware(inputSymbol, outputSymbol, outputErrorSymbol, writer)
                MiddlewareGenerator(writer, urlPathMiddleware).generate()
            }
        }
    }
    override fun generateInit() {
        // No-op
    }

    override fun generateMiddlewareClosure() {
        writer.openBlock("guard let hostedZoneId = input.hostedZoneId else {", "}") {
            writer.write("return try await next.handle(context: context, input: input)")
        }
        writer.write("var copiedInput = input")
        writer.write("let stripped = hostedZoneId.stripFirstMatching(prefixes: [\"/hostedzone/\", \"hostedzone/\", \"/hostedzone\", \"hostedzone\"])")
        writer.write("copiedInput.hostedZoneId = stripped")
    }

    override fun renderReturn() {
        writer.write("return try await next.handle(context: context, input: copiedInput)")
    }
}
