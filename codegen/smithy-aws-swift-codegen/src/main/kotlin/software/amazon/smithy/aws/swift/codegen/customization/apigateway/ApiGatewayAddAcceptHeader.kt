package software.amazon.smithy.aws.swift.codegen.customization.apigateway

import software.amazon.smithy.aws.swift.codegen.middleware.MutateHeadersMiddleware
import software.amazon.smithy.model.Model
import software.amazon.smithy.model.shapes.OperationShape
import software.amazon.smithy.swift.codegen.SwiftSettings
import software.amazon.smithy.swift.codegen.integration.ProtocolGenerator
import software.amazon.smithy.swift.codegen.integration.SwiftIntegration
import software.amazon.smithy.swift.codegen.middleware.OperationMiddleware

class ApiGatewayAddAcceptHeader : SwiftIntegration {
    override fun enabledForService(model: Model, settings: SwiftSettings) =
        settings.sdkId.equals("API Gateway", ignoreCase = true)

    private val acceptHeaderMiddleware = MutateHeadersMiddleware(extraHeaders = mapOf("Accept" to "application/json"))

    override fun customizeMiddleware(
        ctx: ProtocolGenerator.GenerationContext,
        operationShape: OperationShape,
        operationMiddleware: OperationMiddleware
    ) {
        operationMiddleware.appendMiddleware(operationShape, acceptHeaderMiddleware)
    }
}
