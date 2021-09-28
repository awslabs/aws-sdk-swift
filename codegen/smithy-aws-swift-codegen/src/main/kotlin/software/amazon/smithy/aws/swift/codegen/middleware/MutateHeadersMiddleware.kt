package software.amazon.smithy.aws.swift.codegen.middleware

import software.amazon.smithy.model.shapes.OperationShape
import software.amazon.smithy.swift.codegen.ClientRuntimeTypes
import software.amazon.smithy.swift.codegen.SwiftWriter
import software.amazon.smithy.swift.codegen.middleware.MiddlewarePosition
import software.amazon.smithy.swift.codegen.middleware.MiddlewareRenderable
import software.amazon.smithy.swift.codegen.middleware.MiddlewareStep

class MutateHeadersMiddleware(
    private val extraHeaders: Map<String, String> = emptyMap(),
    private val overrideHeaders: Map<String, String> = emptyMap(),
    private val addMissingHeaders: Map<String, String> = emptyMap(),
) : MiddlewareRenderable {
    override val name = "MutateHeaderMiddleware"

    override val middlewareStep = MiddlewareStep.BUILDSTEP

    override val position = MiddlewarePosition.AFTER

    override fun render(writer: SwiftWriter, op: OperationShape, operationStackName: String) {
        val paramsString = middlewareParamsString()
        writer.write("$operationStackName.${middlewareStep.stringValue()}.intercept(position: ${position.stringValue()}, middleware: \$N($paramsString))", ClientRuntimeTypes.Middleware.MutateHeadersMiddleware)
    }

    private fun middlewareParamsString(): String {
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
