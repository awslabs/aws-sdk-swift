package software.amazon.smithy.aws.swift.codegen.middleware

import software.amazon.smithy.aws.swift.codegen.swiftmodules.AWSClientRuntimeTypes
import software.amazon.smithy.model.shapes.OperationShape
import software.amazon.smithy.swift.codegen.SwiftWriter
import software.amazon.smithy.swift.codegen.integration.ProtocolGenerator
import software.amazon.smithy.swift.codegen.middleware.MiddlewareRenderable

class BedrockAPIKeyMiddleware : MiddlewareRenderable {
    override val name = "BedrockAPIKeyMiddleware"

    override fun renderMiddlewareInit(
        ctx: ProtocolGenerator.GenerationContext,
        writer: SwiftWriter,
        op: OperationShape,
    ) {
        writer.writeInline("\$N()", AWSClientRuntimeTypes.Customizations.BedrockAPIKeyInterceptor)
    }
}
