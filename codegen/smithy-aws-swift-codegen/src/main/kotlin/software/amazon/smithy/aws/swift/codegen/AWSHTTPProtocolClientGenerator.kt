package software.amazon.smithy.aws.swift.codegen

import software.amazon.smithy.swift.codegen.SwiftWriter
import software.amazon.smithy.swift.codegen.integration.HTTPProtocolCustomizable
import software.amazon.smithy.swift.codegen.integration.HttpBindingResolver
import software.amazon.smithy.swift.codegen.integration.HttpProtocolClientGenerator
import software.amazon.smithy.swift.codegen.integration.ProtocolGenerator
import software.amazon.smithy.swift.codegen.integration.ServiceConfig
import software.amazon.smithy.swift.codegen.middleware.MiddlewareExecutionGenerator
import software.amazon.smithy.swift.codegen.middleware.OperationMiddleware

class AWSHTTPProtocolClientGenerator(
    private val ctx: ProtocolGenerator.GenerationContext,
    private val writer: SwiftWriter,
    serviceConfig: ServiceConfig,
    private val httpBindingResolver: HttpBindingResolver,
    private val defaultContentType: String,
    private val httpProtocolCustomizable: HTTPProtocolCustomizable,
    private val operationMiddleware: OperationMiddleware
): HttpProtocolClientGenerator(ctx, writer, serviceConfig, httpBindingResolver, defaultContentType, httpProtocolCustomizable, operationMiddleware) {

    override fun makeMiddlewareExecutionGenerator(
        ctx: ProtocolGenerator.GenerationContext,
        writer: SwiftWriter,
        httpBindingResolver: HttpBindingResolver,
        httpProtocolCustomizable: HTTPProtocolCustomizable,
        operationMiddleware: OperationMiddleware,
        operationStackName: String
    ): MiddlewareExecutionGenerator {
        return AWSMiddlewareExecutionGenerator(
            ctx,
            writer,
            httpBindingResolver,
            httpProtocolCustomizable,
            operationMiddleware,
            operationStackName
        )
    }
}