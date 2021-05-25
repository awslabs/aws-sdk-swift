package software.amazon.smithy.aws.swift.codegen.middleware

import software.amazon.smithy.aws.traits.auth.SigV4Trait
import software.amazon.smithy.aws.traits.auth.UnsignedPayloadTrait
import software.amazon.smithy.model.shapes.OperationShape
import software.amazon.smithy.model.shapes.ServiceShape
import software.amazon.smithy.swift.codegen.SwiftWriter
import software.amazon.smithy.swift.codegen.integration.ProtocolGenerator
import software.amazon.smithy.swift.codegen.integration.ProtocolMiddleware
import software.amazon.smithy.swift.codegen.model.hasTrait

class AWSSigningMiddleware: ProtocolMiddleware {

    override val name = "AWSSigningMiddleware"

    override fun renderMiddleware(ctx: ProtocolGenerator.GenerationContext, writer: SwiftWriter, serviceShape: ServiceShape, op: OperationShape, operationStackName: String) {
        val hasUnsignedPayload = op.hasTrait<UnsignedPayloadTrait>()
        // FIXME handle indentation properly or do swift formatting after the fact
        writer.write(
            "$operationStackName.finalizeStep.intercept(position: .after,\n" +
                "                                         middleware: SigV4Middleware(unsignedBody: $hasUnsignedPayload))"
        )
    }
}
