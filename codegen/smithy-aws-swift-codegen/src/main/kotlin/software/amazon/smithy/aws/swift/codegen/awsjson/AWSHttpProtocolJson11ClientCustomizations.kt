package software.amazon.smithy.aws.swift.codegen.awsjson

import software.amazon.smithy.aws.swift.codegen.AWSHttpProtocolClientCustomizations
import software.amazon.smithy.aws.swift.codegen.AWSSwiftDependency
import software.amazon.smithy.aws.swift.codegen.middleware.AWSSigningMiddleware
import software.amazon.smithy.aws.swift.codegen.middleware.AWSXAmzTargetMiddleware
import software.amazon.smithy.codegen.core.Symbol
import software.amazon.smithy.model.shapes.OperationShape
import software.amazon.smithy.protocoltests.traits.HttpRequestTestCase
import software.amazon.smithy.swift.codegen.SwiftWriter
import software.amazon.smithy.swift.codegen.defaultName
import software.amazon.smithy.swift.codegen.integration.ProtocolGenerator

class AWSHttpProtocolJson11ClientCustomizations : AWSHttpProtocolClientCustomizations() {
    override fun renderMiddlewares(ctx: ProtocolGenerator.GenerationContext, writer: SwiftWriter, op: OperationShape, operationStackName: String) {
        writer.write("$operationStackName.buildStep.intercept(position: .before, middleware: EndpointResolverMiddleware())")

        val signingMiddleware = AWSSigningMiddleware()
        val serviceShape = ctx.service
        if (signingMiddleware.needsSigningMiddleware(serviceShape)) {
            signingMiddleware.renderSigningMiddleware(writer, serviceShape, op, operationStackName)
        }

        val xAmzTargetMiddleware = AWSXAmzTargetMiddleware()
        val inputShape = ctx.model.expectShape(op.input.get())
        val inputShapeName = ctx.symbolProvider.toSymbol(inputShape).name
        val outputShape = ctx.model.expectShape(op.output.get())
        val outputShapeName = ctx.symbolProvider.toSymbol(outputShape).name
        val outputErrorName = "${op.defaultName()}Error"
        xAmzTargetMiddleware.xAmzTargetMiddleware(writer, serviceShape, op, operationStackName, inputShapeName, outputShapeName, outputErrorName)
    }
    override fun renderSerializeMiddleware(
        writer: SwiftWriter,
        test: HttpRequestTestCase,
        operationStack: String,
        inputSymbol: Symbol,
        outputSymbol: Symbol,
        outputErrorName: String,
        hasHttpBody: Boolean
    ) {
        if (test.headers.keys.contains("X-Amz-Target")) {
            val XAmzTargetValue = test.headers["X-Amz-Target"]
            writer.write("$operationStack.serializeStep.intercept(position: .before, middleware: XAmzTargetMiddleware<${inputSymbol.name}, $outputSymbol, $outputErrorName>(xAmzTarget: \"${XAmzTargetValue}\"))")
        }
    }

    override fun addImport(writer: SwiftWriter) {
        writer.addImport(AWSSwiftDependency.AWS_CLIENT_RUNTIME.namespace)
    }
}
