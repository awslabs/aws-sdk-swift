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
    private val extraHeaders: Map<String, String> = emptyMap(),
    private val overrideHeaders: Map<String, String> = emptyMap(),
    private val addMissingHeaders: Map<String, String> = emptyMap(),
) : OperationMiddlewareRenderable {
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
        val paramsString = middlewareParamsString(ctx, serviceShape, op)
        writer.write("$operationStackName.${middlewareStep.stringValue()}.intercept(position: ${position.stringValue()}, middleware: \$N($paramsString))", ClientRuntimeTypes.Middleware.MutateHeadersMiddleware)
    }

    override fun middlewareParamsString(
        ctx: ProtocolGenerator.GenerationContext,
        serviceShape: ServiceShape,
        op: OperationShape
    ): String {
        val overrideHeadersString = overrideHeaders.entries.joinToString { "\"${it.key}\": \"${it.value}\"" }
        val extraHeadersString = extraHeaders.entries.joinToString { "\"${it.key}\": \"${it.value}\"" }
        val addMissingHeadersString = addMissingHeaders.entries.joinToString { "\"${it.key}\": \"${it.value}\"" }

        var parameters = mutableListOf<String>()
        if (overrideHeadersString.isNotEmpty()) {
            parameters.add("overrides: [$overrideHeadersString]")
        }
        if (extraHeadersString.isNotEmpty()) {
            parameters.add("additional: [$extraHeadersString]")
        }
        if (addMissingHeadersString.isNotEmpty()) {
            parameters.add("conditionallySet: [$addMissingHeadersString]")
        }
        return parameters.joinToString { it }
    }
}
