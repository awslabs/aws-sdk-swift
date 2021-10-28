package software.amazon.smithy.aws.swift.codegen.middleware

import software.amazon.smithy.model.shapes.OperationShape
import software.amazon.smithy.swift.codegen.SwiftWriter
import software.amazon.smithy.swift.codegen.middleware.MiddlewarePosition
import software.amazon.smithy.swift.codegen.middleware.MiddlewareRenderable
import software.amazon.smithy.swift.codegen.middleware.MiddlewareStep

class PredictInputEndpointURLHostMiddlewareRenderable : MiddlewareRenderable {
    override val name = "PredictInputEndpointURLHostMiddleware"

    override val middlewareStep = MiddlewareStep.INITIALIZESTEP

    override val position = MiddlewarePosition.AFTER

    override fun render(writer: SwiftWriter, op: OperationShape, operationStackName: String) {
        writer.write("$operationStackName.${middlewareStep.stringValue()}.intercept(position: ${position.stringValue()}, middleware: PredictInputEndpointURLHostMiddleware())")
    }
}
