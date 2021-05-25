package software.amazon.smithy.aws.swift.codegen.middleware

import software.amazon.smithy.model.shapes.OperationShape
import software.amazon.smithy.model.shapes.ServiceShape
import software.amazon.smithy.swift.codegen.SwiftWriter
import software.amazon.smithy.swift.codegen.integration.ProtocolGenerator
import software.amazon.smithy.swift.codegen.integration.ProtocolMiddleware

class EndpointResolverMiddleware : ProtocolMiddleware {

    override val name = "EndpointResolverMiddleware"

    override val middlewareStep = "buildStep"

    override val position = ".before"

    override fun renderMiddleware(
        ctx: ProtocolGenerator.GenerationContext,
        writer: SwiftWriter,
        serviceShape: ServiceShape,
        op: OperationShape,
        operationStackName: String
    ) {
        writer.write("$operationStackName.$middlewareStep.intercept(position: $position, middleware: EndpointResolverMiddleware(${getParamsString(ctx, writer, serviceShape, op)}))")
    }

    override fun getParamsString(
        ctx: ProtocolGenerator.GenerationContext,
        writer: SwiftWriter,
        serviceShape: ServiceShape,
        op: OperationShape
    ): String {
        return "endpointResolver: config.endpointResolver, serviceId: serviceName"
    }
}
