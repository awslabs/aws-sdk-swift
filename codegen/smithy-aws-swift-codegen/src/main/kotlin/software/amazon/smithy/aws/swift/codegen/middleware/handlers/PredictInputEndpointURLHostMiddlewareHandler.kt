package software.amazon.smithy.aws.swift.codegen.middleware.handlers

import software.amazon.smithy.codegen.core.Symbol
import software.amazon.smithy.swift.codegen.FoundationTypes
import software.amazon.smithy.swift.codegen.swiftmodules.ClientRuntimeTypes
import software.amazon.smithy.swift.codegen.Middleware
import software.amazon.smithy.swift.codegen.SwiftDependency
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
        writer.addImport(SwiftDependency.SMITHY.target)
        writer.addImport(SwiftDependency.SMITHY_HTTP_API.target)
        writer.openBlock("if let endpoint = input.predictEndpoint, let url = \$N(string: endpoint), let host = url.host {", "}", FoundationTypes.URL) {
            writer.write("context.host = host")
            writer.write("return try await next.handle(context: context, input: input)")
        }
    }

    override fun renderExtensions() {
        writer.addImport("Foundation")
        writer.write(
            """
            extension $typeName: HttpInterceptor {
                public typealias InputType = PredictInput
                public typealias OutputType = PredictOutput
                
                public func modifyBeforeSerialization(context: some MutableInput<Self.InputType, Smithy.Context>) async throws {
                    if let endpoint = context.getInput().predictEndpoint, let url = ${'$'}N(string: endpoint), let host = url.host {
                        context.getAttributes().host = host
                    }
                }
            }
            """.trimIndent(),
            FoundationTypes.URL
        )
    }
}
