package software.amazon.smithy.aws.swift.codegen.middleware

import software.amazon.smithy.model.shapes.OperationShape
import software.amazon.smithy.swift.codegen.SwiftWriter
import software.amazon.smithy.swift.codegen.integration.ProtocolGenerator
import software.amazon.smithy.swift.codegen.middleware.MiddlewarePosition
import software.amazon.smithy.swift.codegen.middleware.MiddlewareRenderable
import software.amazon.smithy.swift.codegen.middleware.MiddlewareStep

// This middleware renderer inserts a custom middleware named `PutObjectPresignedURLMiddleware`
// into the operation stack.  It is only intended for use with S3 `PutObject` and only when
// generating a pre-signed URL.
class PutObjectPresignedURLMiddlewareRenderable : MiddlewareRenderable {

    override val name = "PutObjectPresignedURLMiddleware"

    override val middlewareStep = MiddlewareStep.SERIALIZESTEP

    override val position = MiddlewarePosition.AFTER

    override fun render(ctx: ProtocolGenerator.GenerationContext, writer: SwiftWriter, op: OperationShape, operationStackName: String) {
        writer.write(
            "\$L.\$L.intercept(position: \$L, middleware: \$L())",
            operationStackName,
            middlewareStep.stringValue(),
            position.stringValue(),
            name
        )
    }
}
