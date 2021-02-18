package software.amazon.smithy.aws.swift.codegen.restjson

import software.amazon.smithy.aws.swift.codegen.AWSHttpProtocolCustomizations
import software.amazon.smithy.aws.swift.codegen.middleware.AWSSigningMiddleware
import software.amazon.smithy.model.shapes.OperationShape
import software.amazon.smithy.swift.codegen.SwiftWriter
import software.amazon.smithy.swift.codegen.integration.ProtocolGenerator

class AWSHttpProtocolRestJsonCustomizations : AWSHttpProtocolCustomizations() {
    override fun renderMiddlewares(ctx: ProtocolGenerator.GenerationContext, writer: SwiftWriter, op: OperationShape, operationStackName: String) {
        writer.write("$operationStackName.buildStep.intercept(position: .before, middleware: EndpointResolverMiddleware())")

        val signingMiddleware = AWSSigningMiddleware()
        val serviceShape = ctx.service
        if (signingMiddleware.needsSigningMiddleware(serviceShape)) {
            signingMiddleware.renderSigningMiddleware(writer, serviceShape, op, operationStackName)
        }
    }
}
