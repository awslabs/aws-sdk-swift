package software.amazon.smithy.aws.swift.codegen.awsquery

//import software.amazon.smithy.aws.swift.codegen.middleware.FormURLHttpBodyMiddleware

//class FormURLBodyMiddlewareGeneratorFactory : HttpProtocolBodyMiddlewareGeneratorFactory {
//    override fun shouldRenderHttpBodyMiddleware(shape: Shape): Boolean {
//        return true
//    }
//
//    override fun httpBodyMiddleware(
//        writer: SwiftWriter,
//        ctx: ProtocolGenerator.GenerationContext,
//        inputSymbol: Symbol,
//        outputSymbol: Symbol,
//        outputErrorSymbol: Symbol,
//        requestBindings: List<HttpBindingDescriptor>,
//    ): Middleware {
//        return FormURLHttpBodyMiddleware(writer, ctx, inputSymbol, outputSymbol, outputErrorSymbol, requestBindings)
//    }
//}
