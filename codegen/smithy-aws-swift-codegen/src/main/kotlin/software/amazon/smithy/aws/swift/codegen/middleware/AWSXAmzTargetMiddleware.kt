package software.amazon.smithy.aws.swift.codegen.middleware

import software.amazon.smithy.model.shapes.OperationShape
import software.amazon.smithy.model.shapes.ServiceShape
import software.amazon.smithy.swift.codegen.SwiftWriter
import software.amazon.smithy.swift.codegen.integration.ProtocolGenerator
import software.amazon.smithy.swift.codegen.integration.ProtocolMiddleware
import software.amazon.smithy.swift.codegen.capitalizedName

class AWSXAmzTargetMiddleware: ProtocolMiddleware {

    override val name = "AWSXAmzTargetMiddleware"

    override fun renderMiddleware(ctx: ProtocolGenerator.GenerationContext, writer: SwiftWriter, serviceShape: ServiceShape, op: OperationShape, operationStackName: String) {
        val inputShape = ctx.model.expectShape(op.input.get())
        val inputShapeName = ctx.symbolProvider.toSymbol(inputShape).name
        val outputShape = ctx.model.expectShape(op.output.get())
        val outputShapeName = ctx.symbolProvider.toSymbol(outputShape).name
        val outputErrorName = "${op.capitalizedName()}OutputError"
        val xAmzTargetValue = xAmzTargetValue(serviceShape, op)
        writer.write("$operationStackName.serializeStep.intercept(position: .before, middleware: XAmzTargetMiddleware<$inputShapeName, $outputShapeName, $outputErrorName>(xAmzTarget: \"${xAmzTargetValue}\"))")
    }

    private fun xAmzTargetValue(serviceShape: ServiceShape, op: OperationShape): String {
        return "${serviceShape.id.name}.${op.id.name}"
    }
}
