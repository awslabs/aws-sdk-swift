package software.amazon.smithy.aws.swift.codegen.customization.route53

import software.amazon.smithy.codegen.core.SymbolProvider
import software.amazon.smithy.model.Model
import software.amazon.smithy.model.shapes.OperationShape
import software.amazon.smithy.model.shapes.StructureShape
import software.amazon.smithy.swift.codegen.SwiftWriter
import software.amazon.smithy.swift.codegen.integration.ProtocolGenerator
import software.amazon.smithy.swift.codegen.middleware.MiddlewarePosition
import software.amazon.smithy.swift.codegen.middleware.MiddlewareRenderable
import software.amazon.smithy.swift.codegen.middleware.MiddlewareStep
import software.amazon.smithy.swift.codegen.model.expectShape
import software.amazon.smithy.swift.codegen.model.hasTrait

class TrimHostedZoneURLPathMiddlewareRenderable(
    val model: Model,
    val symbolProvider: SymbolProvider
) : MiddlewareRenderable {
    override val name = "Route53TrimHostedZoneMiddleware"

    override val middlewareStep = MiddlewareStep.INITIALIZESTEP

    override val position = MiddlewarePosition.AFTER

    override fun render(ctx: ProtocolGenerator.GenerationContext, writer: SwiftWriter, op: OperationShape, operationStackName: String) {
        val inputShape = model.expectShape<StructureShape>(op.inputShape)
        val hostedZoneIDMember = inputShape.members().first { it.hasTrait<TrimHostedZone>() }
        val hostedZoneIDKeyPath = ctx.symbolProvider.toMemberName(hostedZoneIDMember)
        writer.write(
            "\$L.\$L.intercept(position: \$L, middleware: Route53TrimHostedZoneMiddleware(\\.\$L))",
            operationStackName,
            middlewareStep.stringValue(),
            position.stringValue(),
            hostedZoneIDKeyPath,
        )
    }
}
