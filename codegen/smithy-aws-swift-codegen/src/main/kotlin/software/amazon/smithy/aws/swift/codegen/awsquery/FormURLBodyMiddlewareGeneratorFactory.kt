package software.amazon.smithy.aws.swift.codegen.awsquery

import software.amazon.smithy.aws.swift.codegen.middleware.FormURLHttpBodyMiddleware
import software.amazon.smithy.codegen.core.Symbol
import software.amazon.smithy.model.shapes.Shape
import software.amazon.smithy.swift.codegen.Middleware
import software.amazon.smithy.swift.codegen.SwiftWriter
import software.amazon.smithy.swift.codegen.integration.HttpBindingDescriptor
import software.amazon.smithy.swift.codegen.integration.HttpProtocolBodyMiddlewareGeneratorFactory
import software.amazon.smithy.swift.codegen.integration.ProtocolGenerator

class FormURLBodyMiddlewareGeneratorFactory : HttpProtocolBodyMiddlewareGeneratorFactory {
    override fun shouldRenderHttpBodyMiddleware(shape: Shape): Boolean {
        return true
    }

    override fun httpBodyMiddleware(
        writer: SwiftWriter,
        ctx: ProtocolGenerator.GenerationContext,
        inputSymbol: Symbol,
        outputSymbol: Symbol,
        outputErrorSymbol: Symbol,
        requestBindings: List<HttpBindingDescriptor>,
    ): Middleware {
        return FormURLHttpBodyMiddleware(writer, ctx, inputSymbol, outputSymbol, outputErrorSymbol, requestBindings)
    }
}
