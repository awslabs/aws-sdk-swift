package software.amazon.smithy.aws.swift.codegen.middleware

import software.amazon.smithy.aws.traits.auth.SigV4Trait
import software.amazon.smithy.aws.traits.auth.UnsignedPayloadTrait
import software.amazon.smithy.model.shapes.OperationShape
import software.amazon.smithy.model.shapes.ServiceShape
import software.amazon.smithy.swift.codegen.SwiftWriter

class AWSSigningMiddleware {

    fun needsSigningMiddleware(serviceShape: ServiceShape): Boolean {
        return serviceShape.hasTrait(SigV4Trait::class.java)
    }

    fun renderSigningMiddleware(writer: SwiftWriter, serviceShape: ServiceShape, op: OperationShape, operationStackName: String) {
        val hasUnsignedPayload = op.hasTrait(UnsignedPayloadTrait::class.java)
        val signingName = serviceShape.getTrait(SigV4Trait::class.java).get().name
        // FIXME handle indentation properly or do swift formatting after the fact
        writer.write(
            "$operationStackName.finalizeStep.intercept(position: .after,\n" +
                "                                         middleware: SigV4Middleware(signingName: \"$signingName\",\n" +
                "                                                                     signingRegion: config.signingRegion,\n" +
                "                                                                     unsignedBody: $hasUnsignedPayload))"
        )
    }
}
