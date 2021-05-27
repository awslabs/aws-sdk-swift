package software.amazon.smithy.aws.swift.codegen

import software.amazon.smithy.aws.swift.codegen.middleware.AWSSigningMiddleware
import software.amazon.smithy.aws.swift.codegen.middleware.EndpointResolverMiddleware
import software.amazon.smithy.aws.traits.auth.SigV4Trait
import software.amazon.smithy.model.node.Node
import software.amazon.smithy.model.shapes.OperationShape
import software.amazon.smithy.model.shapes.ServiceShape
import software.amazon.smithy.swift.codegen.SwiftWriter
import software.amazon.smithy.swift.codegen.integration.DefaultHttpProtocolCustomizations
import software.amazon.smithy.swift.codegen.integration.OperationMiddlewareRenderable
import software.amazon.smithy.swift.codegen.integration.ProtocolGenerator
import software.amazon.smithy.swift.codegen.model.getTrait

abstract class AWSHttpProtocolCustomizations : DefaultHttpProtocolCustomizations() {
    override fun baseMiddlewares(ctx: ProtocolGenerator.GenerationContext): List<OperationMiddlewareRenderable> {
        val defaultMiddlewares = super.baseMiddlewares(ctx)
        val protocolMiddlewares = mutableListOf<OperationMiddlewareRenderable>(EndpointResolverMiddleware())

        if (ctx.service.needsSigning) {
            protocolMiddlewares.add(AWSSigningMiddleware())
        }

        return defaultMiddlewares + protocolMiddlewares
    }

    override fun renderContextAttributes(ctx: ProtocolGenerator.GenerationContext, writer: SwiftWriter, serviceShape: ServiceShape, op: OperationShape) {
        val endpointPrefix = ctx.service.endpointPrefix // get endpoint prefix from smithy trait

        // FIXME handle indentation properly or do swift formatting after the fact
        writer.write("  .withCredentialsProvider(value: config.credentialsProvider)")
        writer.write("  .withRegion(value: config.region)")
        writer.write("  .withHost(value: \"$endpointPrefix.\\(config.region).amazonaws.com\")")
        if (serviceShape.needsSigning) {
            val signingName = serviceShape.getTrait<SigV4Trait>()?.name
            writer.write("  .withSigningName(value: \$S)", signingName)
            writer.write("  .withSigningRegion(value: config.signingRegion)")
        }
    }

    override fun renderInternals(ctx: ProtocolGenerator.GenerationContext) {
        val endpointData = Node.parse(EndpointResolverGenerator::class.java.getResource("/software.amazon.smithy.aws.swift.codegen/endpoints.json").readText()).expectObjectNode()
        EndpointResolverGenerator(endpointData).render(ctx)
    }
}
