package software.amazon.smithy.aws.swift.codegen.middleware

import software.amazon.smithy.model.shapes.OperationShape
import software.amazon.smithy.model.shapes.ServiceShape
import software.amazon.smithy.swift.codegen.SwiftWriter
import software.amazon.smithy.swift.codegen.integration.MiddlewarePosition
import software.amazon.smithy.swift.codegen.integration.MiddlewareStep
import software.amazon.smithy.swift.codegen.integration.OperationMiddlewareRenderable
import software.amazon.smithy.swift.codegen.integration.ProtocolGenerator
import software.amazon.smithy.swift.codegen.model.capitalizedName

class AWSXAmzTargetMiddleware : OperationMiddlewareRenderable {

    override val name = "AWSXAmzTargetMiddleware"

    override val middlewareStep = MiddlewareStep.SERIALIZESTEP

    override val position = MiddlewarePosition.BEFORE

    override fun render(
        ctx: ProtocolGenerator.GenerationContext,
        writer: SwiftWriter,
        serviceShape: ServiceShape,
        op: OperationShape,
        operationStackName: String
    ) {
        val inputShape = ctx.model.expectShape(op.input.get())
        val inputShapeName = ctx.symbolProvider.toSymbol(inputShape).name
        val outputShape = ctx.model.expectShape(op.output.get())
        val outputShapeName = ctx.symbolProvider.toSymbol(outputShape).name
        val outputErrorName = "${op.capitalizedName()}OutputError"
        writer.write("$operationStackName.${middlewareStep.stringValue()}.intercept(position: ${position.stringValue()}, middleware: XAmzTargetMiddleware<$inputShapeName, $outputShapeName, $outputErrorName>(${middlewareParamsString(ctx, serviceShape, op)}))")
    }

    override fun middlewareParamsString(
        ctx: ProtocolGenerator.GenerationContext,
        serviceShape: ServiceShape,
        op: OperationShape
    ): String {
        val xAmzTargetValue = xAmzTargetValue(serviceShape, op)
        return "xAmzTarget: \"${xAmzTargetValue}\""
    }

    private fun xAmzTargetValue(serviceShape: ServiceShape, op: OperationShape): String {
        return "${serviceShape.id.name}.${op.id.name}"
    }
}
