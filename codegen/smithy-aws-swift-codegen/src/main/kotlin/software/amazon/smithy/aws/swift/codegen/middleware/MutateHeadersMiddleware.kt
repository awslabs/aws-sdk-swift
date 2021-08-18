package software.amazon.smithy.aws.swift.codegen.middleware

import software.amazon.smithy.model.shapes.OperationShape
import software.amazon.smithy.model.shapes.ServiceShape
import software.amazon.smithy.swift.codegen.ClientRuntimeTypes
import software.amazon.smithy.swift.codegen.SwiftWriter
import software.amazon.smithy.swift.codegen.integration.MiddlewarePosition
import software.amazon.smithy.swift.codegen.integration.MiddlewareStep
import software.amazon.smithy.swift.codegen.integration.OperationMiddlewareRenderable
import software.amazon.smithy.swift.codegen.integration.ProtocolGenerator

class MutateHeadersMiddleware(
    val extraHeaders: Map<String, String> = emptyMap(),
    val overrideHeaders: Map<String, String> = emptyMap(),
    val addMissingHeaders: Map<String, String> = emptyMap(),
): OperationMiddlewareRenderable {
    override val name = "MutateHeaderMiddleware"

    override val middlewareStep = MiddlewareStep.BUILDSTEP

    override val position = MiddlewarePosition.AFTER

    override fun render(
        ctx: ProtocolGenerator.GenerationContext,
        writer: SwiftWriter,
        serviceShape: ServiceShape,
        op: OperationShape,
        operationStackName: String
    ) {
        writer.write("$operationStackName.${middlewareStep.stringValue()}.intercept(position: ${position.stringValue()}, middleware: \$N(${middlewareParamsString(ctx, serviceShape, op)}))", ClientRuntimeTypes.Middleware.MutateHeadersMiddleware)
    }

    override fun middlewareParamsString(
        ctx: ProtocolGenerator.GenerationContext,
        serviceShape: ServiceShape,
        op: OperationShape
    ): String {
        val overrideHeadersString = ""
        overrideHeaders.forEach {
            val terminator = if(it.key == overrideHeaders.keys.last()) "" else ","
            overrideHeadersString.plus("\"${it.key}\": \"${it.value}\"$terminator")
        }
        val extraHeadersString = ""
        extraHeaders.forEach {
            val terminator = if(it.key == extraHeaders.keys.last()) "" else ","
            extraHeadersString.plus("\"${it.key}\": \"${it.value}\"$terminator")
        }
        val missingHeadersString = ""
        addMissingHeaders.forEach {
            val terminator = if(it.key == addMissingHeaders.keys.last()) "" else ","
            missingHeadersString.plus("\"${it.key}\": \"${it.value}\"$terminator")
        }
        return "overrides: [$overrideHeadersString], additional: [$extraHeadersString], conditionallySet: [$addMissingHeaders]"
    }
}