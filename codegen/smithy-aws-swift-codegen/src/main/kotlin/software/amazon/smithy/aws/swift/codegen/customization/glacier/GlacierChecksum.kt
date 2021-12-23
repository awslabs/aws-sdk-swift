package software.amazon.smithy.aws.swift.codegen.customization.glacier

import software.amazon.smithy.aws.swift.codegen.middleware.AWSSigningMiddleware
import software.amazon.smithy.aws.swift.codegen.middleware.Sha256TreeHashMiddleware
import software.amazon.smithy.aws.swift.codegen.sdkId
import software.amazon.smithy.aws.traits.auth.UnsignedPayloadTrait
import software.amazon.smithy.model.Model
import software.amazon.smithy.model.shapes.OperationShape
import software.amazon.smithy.model.shapes.ServiceShape
import software.amazon.smithy.swift.codegen.SwiftSettings
import software.amazon.smithy.swift.codegen.integration.ProtocolGenerator
import software.amazon.smithy.swift.codegen.integration.SwiftIntegration
import software.amazon.smithy.swift.codegen.middleware.MiddlewareStep
import software.amazon.smithy.swift.codegen.middleware.OperationMiddleware
import software.amazon.smithy.swift.codegen.model.expectShape
import software.amazon.smithy.swift.codegen.model.hasTrait
import java.util.Locale

/**
 * Adds a middleware for Glacier to add checksum headers needed for payloads
 * See: https://github.com/awslabs/aws-sdk-swift/issues/208
 * See also: https://docs.aws.amazon.com/amazonglacier/latest/dev/checksum-calculations.html
 */
class GlacierChecksum : SwiftIntegration {
    override fun enabledForService(model: Model, settings: SwiftSettings) =
        model.expectShape<ServiceShape>(settings.service).sdkId.lowercase(Locale.getDefault()) == "glacier"

    override fun customizeMiddleware(
        ctx: ProtocolGenerator.GenerationContext,
        operationShape: OperationShape,
        operationMiddleware: OperationMiddleware
    ) {
        operationMiddleware.removeMiddleware(operationShape, MiddlewareStep.FINALIZESTEP, "AWSSigningMiddleware")
        operationMiddleware.appendMiddleware(operationShape, AWSSigningMiddleware(::middlewareParamsString, ctx.model, ctx.symbolProvider))
        operationMiddleware.appendMiddleware(operationShape, Sha256TreeHashMiddleware(ctx.symbolProvider, ctx.model))
    }

    private fun middlewareParamsString(op: OperationShape): String {
        val hasUnsignedPayload = op.hasTrait<UnsignedPayloadTrait>()
        return "signedBodyHeader: .contentSha256, unsignedBody: $hasUnsignedPayload"
    }
}
