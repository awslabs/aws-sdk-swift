package software.amazon.smithy.aws.swift.codegen.middleware.handlers

import software.amazon.smithy.codegen.core.Symbol
import software.amazon.smithy.swift.codegen.Middleware
import software.amazon.smithy.swift.codegen.SwiftWriter
import software.amazon.smithy.swift.codegen.integration.ProtocolGenerator
import software.amazon.smithy.swift.codegen.integration.steps.OperationInitializeStep
import software.amazon.smithy.swift.codegen.swiftmodules.ClientRuntimeTypes
import software.amazon.smithy.swift.codegen.swiftmodules.FoundationTypes
import software.amazon.smithy.swift.codegen.swiftmodules.SmithyTypes

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
        writer.openBlock("if let endpoint = input.predictEndpoint, let url = \$N(string: endpoint), let host = url.host {", "}", FoundationTypes.URL) {
            writer.write("context.host = host")
            writer.write("return try await next.handle(context: context, input: input)")
        }
    }

    override fun renderExtensions() {
        writer.openBlock(
            "extension \$L: \$N {",
            "}",
            typeName,
            ClientRuntimeTypes.Middleware.HttpInterceptor,
        ) {
            writer.write("public typealias InputType = PredictInput")
            writer.write("public typealias OutputType = PredictOutput")
            writer.write("")
            writer.openBlock(
                "public func modifyBeforeSerialization(context: some \$N<InputType, \$N>) async throws {",
                "}",
                ClientRuntimeTypes.Middleware.MutableInput,
                SmithyTypes.Context,
            ) {
                writer.openBlock(
                    "if let endpoint = context.getInput().predictEndpoint, let url = \$N(string: endpoint), let host = url.host {",
                    "}",
                    FoundationTypes.URL,
                ) {
                    writer.write("context.getAttributes().host = host")
                }
            }
        }
    }
}
