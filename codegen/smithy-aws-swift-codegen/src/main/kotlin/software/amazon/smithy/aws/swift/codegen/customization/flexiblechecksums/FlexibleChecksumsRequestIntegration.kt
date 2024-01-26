package software.amazon.smithy.aws.swift.codegen.customization.flexiblechecksums

import software.amazon.smithy.aws.traits.HttpChecksumTrait
import software.amazon.smithy.model.Model
import software.amazon.smithy.model.shapes.OperationShape
import software.amazon.smithy.model.shapes.StructureShape
import software.amazon.smithy.swift.codegen.ClientRuntimeTypes
import software.amazon.smithy.swift.codegen.SwiftSettings
import software.amazon.smithy.swift.codegen.SwiftWriter
import software.amazon.smithy.swift.codegen.getOrNull
import software.amazon.smithy.swift.codegen.integration.ProtocolGenerator
import software.amazon.smithy.swift.codegen.integration.SwiftIntegration
import software.amazon.smithy.swift.codegen.integration.middlewares.handlers.MiddlewareShapeUtils
import software.amazon.smithy.swift.codegen.middleware.MiddlewarePosition
import software.amazon.smithy.swift.codegen.middleware.MiddlewareRenderable
import software.amazon.smithy.swift.codegen.middleware.MiddlewareStep
import software.amazon.smithy.swift.codegen.middleware.OperationMiddleware
import software.amazon.smithy.swift.codegen.model.expectShape
import software.amazon.smithy.swift.codegen.model.shapes

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

        val useFlexibleChecksum = (httpChecksumTrait != null) &&
            (httpChecksumTrait.requestAlgorithmMember?.orElse(null) != null) &&
            (input?.memberNames?.any { it == httpChecksumTrait.requestAlgorithmMember.get() } == true)

        if (useFlexibleChecksum) {
            operationMiddleware.appendMiddleware(operationShape, FlexibleChecksumRequestMiddleware)
        }
    }
}

private object FlexibleChecksumRequestMiddleware : MiddlewareRenderable {
    override val name = "FlexibleChecksumRequestMiddleware"

    override val middlewareStep = MiddlewareStep.SERIALIZESTEP

    override val position = MiddlewarePosition.AFTER

    override fun render(ctx: ProtocolGenerator.GenerationContext, writer: SwiftWriter, op: OperationShape, operationStackName: String) {
        val inputShapeName = MiddlewareShapeUtils.inputSymbol(ctx.symbolProvider, ctx.model, op).name
        val outputShapeName = MiddlewareShapeUtils.outputSymbol(ctx.symbolProvider, ctx.model, op).name
        val httpChecksumTrait = op.getTrait(HttpChecksumTrait::class.java).orElse(null)
        val inputMemberName = httpChecksumTrait?.requestAlgorithmMember?.get()
        val algorithmMember = ctx.model.expectShape(op.inputShape).getMember(inputMemberName)
        val algorithmEnumShape = ctx.model.expectShape(algorithmMember.orElse(null)?.target)

        // Will pass list of checksums to Swift middleware to handle the rest
        val algorithmNames: List<String> = algorithmEnumShape.members().map { it.memberName }

        // Convert algorithmNames list to a Swift array representation
        val algorithmNamesSwiftArray = algorithmNames.joinToString(separator = ", ") { "\"$it\"" }
        val middlewareInit = "${ClientRuntimeTypes.Middleware.FlexibleChecksumsRequestMiddleware}<$inputShapeName, $outputShapeName>(checksumAlgorithms: [$algorithmNamesSwiftArray])"

        writer.write("$operationStackName.${middlewareStep.stringValue()}.intercept(position: ${position.stringValue()}, middleware: $middlewareInit)")
    }
}
