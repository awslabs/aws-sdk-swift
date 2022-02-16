package software.amazon.smithy.aws.swift.codegen.middleware.handlers

import software.amazon.smithy.codegen.core.Symbol
import software.amazon.smithy.swift.codegen.ClientRuntimeTypes
import software.amazon.smithy.swift.codegen.Middleware
import software.amazon.smithy.swift.codegen.SwiftWriter
import software.amazon.smithy.swift.codegen.integration.ProtocolGenerator
import software.amazon.smithy.swift.codegen.integration.steps.OperationInitializeStep

class PredictInputEndpointURLHostMiddlewareHandler(
    private val writer: SwiftWriter,
    ctx: ProtocolGenerator.GenerationContext,
    inputSymbol: Symbol,
    outputSymbol: Symbol,
    outputErrorSymbol: Symbol
) : Middleware(writer, inputSymbol, OperationInitializeStep(inputSymbol, outputSymbol, outputErrorSymbol)) {

    override val typeName = "${inputSymbol.name}EndpointURLHostMiddleware"

    override fun generateInit() {
        writer.write("public init() { }")
    }

    override fun generateMiddlewareClosure() {
        writer.openBlock("if let endpoint = input.predictEndpoint, let url = \$N(string: endpoint), let host = url.host {", "}", ClientRuntimeTypes.Core.URL) {
            writer.write("var copiedContext = context")
            writer.write("copiedContext.attributes.set(key: AttributeKey<String>(name: \"Host\"), value: host)")
            writer.write("return try await next.handle(context: copiedContext, input: input)")
        }
    }
}
