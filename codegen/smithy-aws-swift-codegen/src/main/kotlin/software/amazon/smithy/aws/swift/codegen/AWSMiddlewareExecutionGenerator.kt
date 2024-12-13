package software.amazon.smithy.aws.swift.codegen

import software.amazon.smithy.swift.codegen.SwiftWriter
import software.amazon.smithy.swift.codegen.config.ConfigProperty
import software.amazon.smithy.swift.codegen.integration.HTTPProtocolCustomizable
import software.amazon.smithy.swift.codegen.integration.HttpBindingResolver
import software.amazon.smithy.swift.codegen.integration.ProtocolGenerator
import software.amazon.smithy.swift.codegen.middleware.MiddlewareExecutionGenerator
import software.amazon.smithy.swift.codegen.middleware.OperationMiddleware

class AWSMiddlewareExecutionGenerator(
    ctx: ProtocolGenerator.GenerationContext,
    private val writer: SwiftWriter,
    httpBindingResolver: HttpBindingResolver,
    httpProtocolCustomizable: HTTPProtocolCustomizable,
    operationMiddleware: OperationMiddleware, operationStackName: String
): MiddlewareExecutionGenerator(
    ctx, writer, httpBindingResolver, httpProtocolCustomizable, operationMiddleware, operationStackName
) {

    override fun renderConfigPropertyToContext(configProperty: ConfigProperty) {
        when (configProperty.name) {
            "accountIdEndpointMode" -> { // Used for business metrics
                writer.write("  .withAccountIDEndpointMode(value: config.accountIdEndpointMode)")
            }
        }
    }
}