package software.amazon.smithy.aws.swift.codegen.middleware

import software.amazon.smithy.model.shapes.OperationShape
import software.amazon.smithy.model.shapes.ServiceShape
import software.amazon.smithy.swift.codegen.SwiftWriter

class AWSXAmzTargetMiddleware {

    fun xAmzTargetMiddleware(writer: SwiftWriter, serviceShape: ServiceShape, op: OperationShape, operationStackName: String, inputShapeName: String, outputShapeName: String, errorShapeName: String) {
        val xAmzTargetValue = xAmzTargetValue(serviceShape, op)
        writer.write("$operationStackName.serializeStep.intercept(position: .before, middleware: XAmzTargetMiddleware<$inputShapeName, $outputShapeName, $errorShapeName>(xAmzTarget: \"${xAmzTargetValue}\"))")
    }

    private fun xAmzTargetValue(serviceShape: ServiceShape, op: OperationShape): String {
        return "${serviceShape.id.name}.${op.id.name}"
    }
}
