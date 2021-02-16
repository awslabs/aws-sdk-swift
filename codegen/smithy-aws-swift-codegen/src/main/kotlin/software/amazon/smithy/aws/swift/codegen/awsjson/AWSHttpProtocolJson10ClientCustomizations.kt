package software.amazon.smithy.aws.swift.codegen.awsjson

import software.amazon.smithy.aws.swift.codegen.AWSHttpProtocolClientCustomizations
import software.amazon.smithy.aws.swift.codegen.middleware.AWSSigningMiddleware
import software.amazon.smithy.aws.swift.codegen.middleware.AWSXAmzTargetMiddleware
import software.amazon.smithy.model.shapes.OperationShape
import software.amazon.smithy.swift.codegen.SwiftWriter
import software.amazon.smithy.swift.codegen.defaultName
import software.amazon.smithy.swift.codegen.integration.ProtocolGenerator.GenerationContext

class AWSHttpProtocolJson10ClientCustomizations : AWSHttpProtocolClientCustomizations() {
    override fun renderMiddlewares(ctx: GenerationContext, writer: SwiftWriter, op: OperationShape, operationStackName: String) {
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
}
