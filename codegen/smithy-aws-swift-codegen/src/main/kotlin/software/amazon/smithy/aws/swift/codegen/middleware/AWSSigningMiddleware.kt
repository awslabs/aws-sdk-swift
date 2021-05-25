package software.amazon.smithy.aws.swift.codegen.middleware

import software.amazon.smithy.aws.traits.auth.UnsignedPayloadTrait
import software.amazon.smithy.model.shapes.OperationShape
import software.amazon.smithy.model.shapes.ServiceShape
import software.amazon.smithy.swift.codegen.SwiftWriter
import software.amazon.smithy.swift.codegen.integration.ProtocolGenerator
import software.amazon.smithy.swift.codegen.integration.ProtocolMiddleware
import software.amazon.smithy.swift.codegen.model.hasTrait

class AWSSigningMiddleware : ProtocolMiddleware {

    override val name = "AWSSigningMiddleware"

    override val middlewareStep = "finalizeStep"

    override val position = ".after"

    override fun renderMiddleware(
        ctx: ProtocolGenerator.GenerationContext,
        writer: SwiftWriter,
        serviceShape: ServiceShape,
        op: OperationShape,
        operationStackName: String
    ) {
        // FIXME handle indentation properly or do swift formatting after the fact
        writer.write(
            "$operationStackName.$middlewareStep.intercept(position: $position,\n" +
                "                                         middleware: SigV4Middleware(${getParamsString(ctx, writer, serviceShape, op)}))"
        )
    }

    override fun getParamsString(
        ctd: ProtocolGenerator.GenerationContext,
        writer: SwiftWriter,
        serviceShape: ServiceShape,
        op: OperationShape
    ): String {
        val hasUnsignedPayload = op.hasTrait<UnsignedPayloadTrait>()
        return "unsignedBody: $hasUnsignedPayload"
    }
}
