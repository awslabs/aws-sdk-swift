package software.amazon.smithy.aws.swift.codegen

import software.amazon.smithy.aws.traits.ServiceTrait
import software.amazon.smithy.aws.traits.auth.SigV4Trait
import software.amazon.smithy.aws.traits.auth.UnsignedPayloadTrait
import software.amazon.smithy.codegen.core.CodegenException
import software.amazon.smithy.model.node.Node
import software.amazon.smithy.model.node.ObjectNode
import software.amazon.smithy.model.shapes.OperationShape
import software.amazon.smithy.model.shapes.ServiceShape
import software.amazon.smithy.swift.codegen.SwiftWriter
import software.amazon.smithy.swift.codegen.integration.ClientProperty
import software.amazon.smithy.swift.codegen.integration.HttpProtocolClientGenerator
import software.amazon.smithy.swift.codegen.integration.ProtocolGenerator
import software.amazon.smithy.swift.codegen.integration.ServiceConfig
import software.amazon.smithy.utils.IoUtils

class AwsHttpProtocolClientGenerator(
    private val ctx: ProtocolGenerator.GenerationContext,
    private val writer: SwiftWriter,
    properties: List<ClientProperty>,
    serviceConfig: ServiceConfig
) : HttpProtocolClientGenerator(ctx, writer, properties, serviceConfig) {
    override fun renderContextAttributes(op: OperationShape) {
        super.renderContextAttributes(op)
        val endpointPrefix = ctx.service.endpointPrefix // get endpoint prefix from smithy trait
        //FIXME handle indentation properly or do swift formatting after the fact
        writer.write("  .withCredentialsProvider(value: config.credentialsProvider)")
        writer.write("  .withRegion(value: config.region)")
        writer.write("  .withHost(value: \"$endpointPrefix.\\(config.region).amazonaws.com\")")
    }

    override fun renderMiddlewares(op: OperationShape) {
        super.renderMiddlewares(op)
        writer.write("operation.buildStep.intercept(position: .before, middleware: EndpointResolverMiddleware())")
        val hasUnsignedPayload = op.hasTrait(UnsignedPayloadTrait::class.java)
        val serviceShape = ctx.service
        val needsSigning = serviceShape.hasTrait(SigV4Trait::class.java)
        if (needsSigning) {
            val signingName = serviceShape.getTrait(SigV4Trait::class.java).get().name
            //FIXME handle indentation properly or do swift formatting after the fact
            writer.write(
                "operation.finalizeStep.intercept(position: .after,\n" +
                        "                                         middleware: SigV4Middleware(signingName: \"$signingName\",\n" +
                        "                                                                     signingRegion: config.signingRegion,\n" +
                        "                                                                     unsignedBody: $hasUnsignedPayload))"
            )
        }
    }
}
