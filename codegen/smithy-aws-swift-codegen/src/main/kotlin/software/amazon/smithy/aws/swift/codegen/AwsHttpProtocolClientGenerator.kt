package software.amazon.smithy.aws.swift.codegen

import software.amazon.smithy.aws.traits.auth.SigV4Trait
import software.amazon.smithy.aws.traits.auth.UnsignedPayloadTrait
import software.amazon.smithy.model.shapes.OperationShape
import software.amazon.smithy.swift.codegen.SwiftWriter
import software.amazon.smithy.swift.codegen.integration.ClientProperty
import software.amazon.smithy.swift.codegen.integration.HttpBindingResolver
import software.amazon.smithy.swift.codegen.integration.HttpProtocolClientGenerator
import software.amazon.smithy.swift.codegen.integration.ProtocolGenerator
import software.amazon.smithy.swift.codegen.integration.ServiceConfig

class AwsHttpProtocolClientGenerator(
    private val ctx: ProtocolGenerator.GenerationContext,
    private val writer: SwiftWriter,
    properties: List<ClientProperty>,
    serviceConfig: ServiceConfig,
    httpBindingResolver: HttpBindingResolver
) : HttpProtocolClientGenerator(ctx, writer, properties, serviceConfig, httpBindingResolver) {
    override fun renderContextAttributes(op: OperationShape) {
        super.renderContextAttributes(op)
        val endpointPrefix = ctx.service.endpointPrefix // get endpoint prefix from smithy trait
        // FIXME handle indentation properly or do swift formatting after the fact
        writer.write("  .withCredentialsProvider(value: config.credentialsProvider)")
        writer.write("  .withRegion(value: config.region)")
        writer.write("  .withHost(value: \"$endpointPrefix.\\(config.region).amazonaws.com\")")
    }

    override fun renderMiddlewares(op: OperationShape, operationStackName: String) {
        super.renderMiddlewares(op, operationStackName)
        writer.write("$operationStackName.buildStep.intercept(position: .before, middleware: EndpointResolverMiddleware())")
        val hasUnsignedPayload = op.hasTrait(UnsignedPayloadTrait::class.java)
        val serviceShape = ctx.service
        val needsSigning = serviceShape.hasTrait(SigV4Trait::class.java)
        if (needsSigning) {
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
}
