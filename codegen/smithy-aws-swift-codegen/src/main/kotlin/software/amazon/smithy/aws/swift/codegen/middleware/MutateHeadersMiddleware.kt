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

        val overrideHeadersString: StringBuilder = StringBuilder()
        overrideHeaders.forEach {
            val terminator = if(it.key == overrideHeaders.keys.last()) "" else ","
            overrideHeadersString.append("\"${it.key}\": \"${it.value}\"$terminator")
        }
        val extraHeadersString: StringBuilder =StringBuilder()
        extraHeaders.forEach {
            val terminator = if(it.key == extraHeaders.keys.last()) "" else ","
            extraHeadersString.append("\"${it.key}\": \"${it.value}\"$terminator")
        }
        val addMissingHeadersString: StringBuilder = StringBuilder()
        addMissingHeaders.forEach {
            val terminator = if(it.key == addMissingHeaders.keys.last()) "" else ","
            addMissingHeadersString.append("\"${it.key}\": \"${it.value}\"$terminator")
        }
        val paramString = StringBuilder()
        if(overrideHeaders.isNotEmpty()) {
            paramString.append("overrides: [${overrideHeadersString}]")
        }
        if(overrideHeaders.isNotEmpty() && extraHeaders.isNotEmpty()) {
            paramString.append(", ")
        }

        if (extraHeaders.isNotEmpty()) {
            paramString.append("additional: [${extraHeadersString}]")
        }

        if((extraHeaders.isNotEmpty() || overrideHeaders.isNotEmpty()) && addMissingHeaders.isNotEmpty()) paramString.append(", ")

        if(addMissingHeaders.isNotEmpty()) {
            paramString.append("conditionallySet: [${addMissingHeadersString}]")
        }

        return paramString.toString()
    }
}