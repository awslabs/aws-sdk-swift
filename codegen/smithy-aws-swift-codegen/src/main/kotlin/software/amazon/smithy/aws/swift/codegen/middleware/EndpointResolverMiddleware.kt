package software.amazon.smithy.aws.swift.codegen.middleware

import software.amazon.smithy.swift.codegen.SwiftWriter
import software.amazon.smithy.swift.codegen.integration.ProtocolGenerator
import software.amazon.smithy.swift.codegen.integration.ProtocolMiddleware
import software.amazon.smithy.model.shapes.ServiceShape
import software.amazon.smithy.model.shapes.OperationShape

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
        writer.write("$operationStackName.$middlewareStep.intercept(position: $position, middleware: EndpointResolverMiddleware(${renderParams(ctx, writer, serviceShape, op)}))")
    }

    override fun renderParams(
        ctx: ProtocolGenerator.GenerationContext,
        writer: SwiftWriter,
        serviceShape: ServiceShape,
        op: OperationShape
    ) {
        writer.writeInline("endpointResolver: config.endpointResolver, serviceId: serviceName")
    }
}