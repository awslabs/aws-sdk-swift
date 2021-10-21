package software.amazon.smithy.aws.swift.codegen.middleware

import software.amazon.smithy.codegen.core.SymbolProvider
import software.amazon.smithy.model.Model
import software.amazon.smithy.model.shapes.OperationShape
import software.amazon.smithy.model.shapes.StructureShape
import software.amazon.smithy.swift.codegen.ClientRuntimeTypes
import software.amazon.smithy.swift.codegen.SwiftTypes
import software.amazon.smithy.swift.codegen.SwiftWriter
import software.amazon.smithy.swift.codegen.integration.middlewares.handlers.MiddlewareShapeUtils
import software.amazon.smithy.swift.codegen.middleware.MiddlewarePosition
import software.amazon.smithy.swift.codegen.middleware.MiddlewareRenderable
import software.amazon.smithy.swift.codegen.middleware.MiddlewareStep
import software.amazon.smithy.swift.codegen.model.expectShape

class GlacierAccountIdMiddleware(private val model: Model, private val symbolProvider: SymbolProvider) : MiddlewareRenderable {
    override val name = "GlacierAccountIdAutoFill"

    override val middlewareStep = MiddlewareStep.INITIALIZESTEP

    override val position = MiddlewarePosition.BEFORE

    override fun render(writer: SwiftWriter, op: OperationShape, operationStackName: String) {
        val outputShapeName = MiddlewareShapeUtils.outputSymbol(symbolProvider, model, op).name
        val outputErrorShapeName = MiddlewareShapeUtils.outputErrorSymbolName(op)
        val accountId = model.expectShape<StructureShape>(op.input.get()).members().first { it.memberName.lowercase() == "accountid" }
        writer.openBlock(
            "$operationStackName.${middlewareStep.stringValue()}.intercept(position: ${position.stringValue()}, id: \"${name}\") { (context, input, next) -> \$N<\$N<$outputShapeName>, \$N<$outputErrorShapeName>> in", "}",
            SwiftTypes.Result,
            ClientRuntimeTypes.Middleware.OperationOutput,
            ClientRuntimeTypes.Core.SdkError
        ) {
            writer.openBlock("guard let accountId = input.${accountId.memberName}, !accountId.isEmpty else {", "}") {
                writer.write("var copiedInput = input")
                writer.write("copiedInput.${accountId.memberName} = \"-\"")
                writer.write("return next.handle(context: context, input: copiedInput)")
            }
            writer.write("return next.handle(context: context, input: input)")
        }
    }
}
