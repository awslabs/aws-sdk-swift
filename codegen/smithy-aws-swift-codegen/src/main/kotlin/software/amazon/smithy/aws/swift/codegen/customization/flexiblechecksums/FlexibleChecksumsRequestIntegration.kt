package software.amazon.smithy.aws.swift.codegen.customization.flexiblechecksums

import software.amazon.smithy.aws.swift.codegen.swiftmodules.AWSClientRuntimeTypes
import software.amazon.smithy.aws.traits.HttpChecksumTrait
import software.amazon.smithy.model.Model
import software.amazon.smithy.model.shapes.OperationShape
import software.amazon.smithy.model.shapes.StructureShape
import software.amazon.smithy.model.traits.HttpHeaderTrait
import software.amazon.smithy.swift.codegen.SwiftSettings
import software.amazon.smithy.swift.codegen.SwiftWriter
import software.amazon.smithy.swift.codegen.integration.ProtocolGenerator
import software.amazon.smithy.swift.codegen.integration.SwiftIntegration
import software.amazon.smithy.swift.codegen.integration.middlewares.handlers.MiddlewareShapeUtils
import software.amazon.smithy.swift.codegen.middleware.MiddlewareRenderable
import software.amazon.smithy.swift.codegen.middleware.OperationMiddleware
import software.amazon.smithy.swift.codegen.model.expectShape
import software.amazon.smithy.swift.codegen.model.getTrait
import software.amazon.smithy.swift.codegen.model.hasTrait
import software.amazon.smithy.swift.codegen.model.shapes
import kotlin.jvm.optionals.getOrNull

class FlexibleChecksumsRequestIntegration : SwiftIntegration {
    override fun enabledForService(model: Model, settings: SwiftSettings): Boolean = model
        .shapes<OperationShape>()
        .any { it.hasTrait(HttpChecksumTrait::class.java) }

    override fun customizeMiddleware(
        ctx: ProtocolGenerator.GenerationContext,
        operationShape: OperationShape,
        operationMiddleware: OperationMiddleware,
    ) {
        val httpChecksumTrait = operationShape.getTrait(HttpChecksumTrait::class.java).orElse(null)
        val input = operationShape.input.orElse(null)?.let { ctx.model.expectShape<StructureShape>(it) }

        /*
            Flexible checksum request middleware must be added only if:
              - The operation has @httpChecksum trait
              - (The `requestChecksumRequired` of @httpChecksum trait is set to `true`) ||
                  (the `requestAlgorithmMember` is modeled)
              - Of course, add the middleware if both are true as well.
            In the case that `requestAlgorithmMember` is not modeled but `requestChecksumRequired` is `true`,
              SDK clients use default checksum algorithm: CRC32.
         */
        val useFlexibleChecksum = httpChecksumTrait != null && (
            (
                (httpChecksumTrait.requestAlgorithmMember?.isPresent ?: false) &&
                    (input?.memberNames?.any { it == httpChecksumTrait.requestAlgorithmMember.get() } == true)
                ) || (httpChecksumTrait.isRequestChecksumRequired)
            )

        if (useFlexibleChecksum) {
            operationMiddleware.appendMiddleware(operationShape, FlexibleChecksumRequestMiddleware)
        }
    }
}

fun String.lowercaseFirstLetter(): String =
    takeIf { it.isNotEmpty() }?.let { it.first().lowercase() + it.substring(1) } ?: this

private object FlexibleChecksumRequestMiddleware : MiddlewareRenderable {
    override val name = "FlexibleChecksumRequestMiddleware"

    override fun renderMiddlewareInit(
        ctx: ProtocolGenerator.GenerationContext,
        writer: SwiftWriter,
        op: OperationShape
    ) {
        val inputShapeName = MiddlewareShapeUtils.inputSymbol(ctx.symbolProvider, ctx.model, op).name
        val outputShapeName = MiddlewareShapeUtils.outputSymbol(ctx.symbolProvider, ctx.model, op).name
        val httpChecksumTrait = op.getTrait(HttpChecksumTrait::class.java).orElse(null)
        val algorithmMemberName = httpChecksumTrait?.requestAlgorithmMember?.getOrNull()?.lowercaseFirstLetter()?.let {
            "input.$it?.rawValue"
        } ?: "nil"
        val requestChecksumIsRequired = httpChecksumTrait?.isRequestChecksumRequired
        val algoHeaderName = if (httpChecksumTrait?.requestAlgorithmMember?.getOrNull() != null) {
            ctx.model.expectShape(op.inputShape).getMember(httpChecksumTrait.requestAlgorithmMember.get())?.getOrNull()?.getTrait<HttpHeaderTrait>()?.value?.let {
                "\"$it\""
            } ?: "nil"
        } else { "nil" }

        writer.write(
            "\$N<\$L, \$L>(requestChecksumRequired: \$L, checksumAlgorithm: \$L, checksumAlgoHeaderName: \$L)",
            AWSClientRuntimeTypes.Core.FlexibleChecksumsRequestMiddleware,
            inputShapeName,
            outputShapeName,
            requestChecksumIsRequired,
            algorithmMemberName,
            algoHeaderName
        )
    }
}
