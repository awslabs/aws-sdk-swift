package software.amazon.smithy.aws.swift.codegen.customization.flexiblechecksums

import software.amazon.smithy.aws.traits.HttpChecksumTrait
import software.amazon.smithy.model.Model
import software.amazon.smithy.model.shapes.OperationShape
import software.amazon.smithy.model.shapes.StructureShape
import software.amazon.smithy.swift.codegen.ClientRuntimeTypes
import software.amazon.smithy.swift.codegen.SwiftSettings
import software.amazon.smithy.swift.codegen.SwiftWriter
import software.amazon.smithy.swift.codegen.integration.ProtocolGenerator
import software.amazon.smithy.swift.codegen.integration.SwiftIntegration
import software.amazon.smithy.swift.codegen.integration.middlewares.handlers.MiddlewareShapeUtils
import software.amazon.smithy.swift.codegen.middleware.MiddlewarePosition
import software.amazon.smithy.swift.codegen.middleware.MiddlewareRenderable
import software.amazon.smithy.swift.codegen.middleware.MiddlewareStep
import software.amazon.smithy.swift.codegen.middleware.OperationMiddleware
import software.amazon.smithy.swift.codegen.model.expectShape
import software.amazon.smithy.swift.codegen.model.shapes

class FlexibleChecksumsResponseIntegration : SwiftIntegration {
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

        val useFlexibleChecksum = (httpChecksumTrait != null) &&
            (httpChecksumTrait.requestValidationModeMember?.orElse(null) != null) &&
            (input?.memberNames?.any { it == httpChecksumTrait.requestValidationModeMember.get() } == true)

        if (useFlexibleChecksum) {
            operationMiddleware.appendMiddleware(operationShape, FlexibleChecksumResponseMiddleware)
        }
    }
}

private object FlexibleChecksumResponseMiddleware : MiddlewareRenderable {
    override val name = "FlexibleChecksumResponseMiddleware"

    override val middlewareStep = MiddlewareStep.DESERIALIZESTEP

    override val position = MiddlewarePosition.AFTER

    override fun render(ctx: ProtocolGenerator.GenerationContext, writer: SwiftWriter, op: OperationShape, operationStackName: String) {
        val outputShapeName = MiddlewareShapeUtils.outputSymbol(ctx.symbolProvider, ctx.model, op).name
        val httpChecksumTrait = op.getTrait(HttpChecksumTrait::class.java).orElse(null)
        val inputMemberName = httpChecksumTrait?.requestValidationModeMember?.get()
        val validationModeMember = ctx.model.expectShape(op.inputShape).getMember(inputMemberName)
        val requestValidationModeEnumShape = ctx.model.expectShape(validationModeMember.orElse(null)?.target)

        // Will pass the validation mode to validation middleware
        val validationMode: Boolean = requestValidationModeEnumShape.members().map { it.memberName }.first().equals("ENABLED")
        val middlewareInit = "${ClientRuntimeTypes.Middleware.FlexibleChecksumsResponseMiddleware}<$outputShapeName>(validationMode: $validationMode)"
        writer.write("$operationStackName.${middlewareStep.stringValue()}.intercept(position: ${position.stringValue()}, middleware: $middlewareInit)")
    }
}
