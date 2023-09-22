package software.amazon.smithy.aws.swift.codegen.middleware

import software.amazon.smithy.model.shapes.OperationShape
import software.amazon.smithy.swift.codegen.SwiftWriter
import software.amazon.smithy.swift.codegen.middleware.MiddlewarePosition
import software.amazon.smithy.swift.codegen.middleware.MiddlewareRenderable
import software.amazon.smithy.swift.codegen.middleware.MiddlewareStep

class PutObjectPresignedURLMiddlewareRenderable : MiddlewareRenderable {

    override val name = "PutObjectPresignedURLMiddleware"

    override val middlewareStep = MiddlewareStep.SERIALIZESTEP

    override val position = MiddlewarePosition.AFTER

    override fun render(writer: SwiftWriter, op: OperationShape, operationStackName: String) {
        writer.write(
            "\$L.\$L.intercept(position: \$L, middleware: \$L<PutObjectInput, PutObjectOutputResponse>())",
            operationStackName,
            middlewareStep.stringValue(),
            position.stringValue(),
            name
        )
    }
}
