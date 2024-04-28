package software.amazon.smithy.aws.swift.codegen.middleware

import software.amazon.smithy.model.shapes.OperationShape
import software.amazon.smithy.swift.codegen.SwiftWriter
import software.amazon.smithy.swift.codegen.integration.ProtocolGenerator
import software.amazon.smithy.swift.codegen.middleware.MiddlewarePosition
import software.amazon.smithy.swift.codegen.middleware.MiddlewareRenderable
import software.amazon.smithy.swift.codegen.middleware.MiddlewareStep

class PredictInputEndpointURLHostMiddlewareRenderable : MiddlewareRenderable {
    override val name = "PredictInputEndpointURLHostMiddleware"

    override val middlewareStep = MiddlewareStep.INITIALIZESTEP

    override val position = MiddlewarePosition.AFTER

    override fun render(ctx: ProtocolGenerator.GenerationContext, writer: SwiftWriter, op: OperationShape, operationStackName: String) {
        val inputSymbol = ctx.symbolProvider.toSymbol(ctx.model.expectShape(op.inputShape))
        writer.write(
            "\$L.\$L.intercept(position: \$L, middleware: \$LEndpointURLHostMiddleware())",
            operationStackName,
            middlewareStep.stringValue(),
            position.stringValue(),
            inputSymbol.name,
        )
    }
}
