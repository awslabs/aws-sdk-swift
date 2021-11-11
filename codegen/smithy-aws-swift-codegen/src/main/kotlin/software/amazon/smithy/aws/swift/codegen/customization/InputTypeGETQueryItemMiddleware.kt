package software.amazon.smithy.aws.swift.codegen.customization

import software.amazon.smithy.codegen.core.Symbol
import software.amazon.smithy.model.shapes.IntegerShape
import software.amazon.smithy.model.shapes.ListShape
import software.amazon.smithy.model.shapes.Shape
import software.amazon.smithy.model.shapes.ShapeId
import software.amazon.smithy.model.shapes.TimestampShape
import software.amazon.smithy.swift.codegen.ClientRuntimeTypes.Core.URLQueryItem
import software.amazon.smithy.swift.codegen.Middleware
import software.amazon.smithy.swift.codegen.SwiftTypes
import software.amazon.smithy.swift.codegen.SwiftWriter
import software.amazon.smithy.swift.codegen.integration.ProtocolGenerator
import software.amazon.smithy.swift.codegen.integration.steps.OperationSerializeStep
import software.amazon.smithy.swift.codegen.model.isEnum

class InputTypeGETQueryItemMiddleware(
    private val ctx: ProtocolGenerator.GenerationContext,
    inputSymbol: Symbol,
    outputSymbol: Symbol,
    outputErrorSymbol: Symbol,
    val inputShape: Shape,
    private val writer: SwiftWriter
) : Middleware(writer, inputSymbol, OperationSerializeStep(inputSymbol, outputSymbol, outputErrorSymbol)) {
    override val typeName = "${inputSymbol.name}GETQueryItemMiddleware"

    override fun generateMiddlewareClosure() {
        for (member in inputShape.members()) {
            val memberName = ctx.symbolProvider.toMemberName(member)
            val queryKey = member.memberName

            val memberTargetShape = ctx.model.expectShape(member.target)
            if (memberTargetShape is IntegerShape || memberTargetShape is TimestampShape) {
                // TODO: We should support all types in our presignable operations
                continue
            }
            writer.openBlock("if let $memberName = input.operationInput.$memberName {", "}") {
                when (memberTargetShape) {
                    is ListShape -> {
                        val rawValueIfNeeded = rawValueIfNeeded(memberTargetShape.member.target)
                        val queryValue = "item$rawValueIfNeeded"
                        writer.openBlock("$memberName.forEach { item in ", "}") {
                            writeRenderItem(queryKey, queryValue)
                        }
                    }
                    else -> {
                        val rawValueIfNeeded = rawValueIfNeeded(member.target)
                        val queryValue = "${memberName}$rawValueIfNeeded"
                        writeRenderItem(queryKey, queryValue)
                    }
                }
            }
        }
    }

    private fun rawValueIfNeeded(shapeId: ShapeId): String {
        return if (ctx.model.expectShape(shapeId).isEnum) ".rawValue" else ""
    }

    private fun writeRenderItem(queryKey: String, queryValue: String) {
        writer.write("let queryItem = \$N(name: \"${queryKey}\".urlPercentEncoding(), value: \$N($queryValue).urlPercentEncoding())", URLQueryItem, SwiftTypes.String)
        writer.write("input.builder.withQueryItem(queryItem)")
    }

    override fun generateInit() {
        writer.write("public init() {}")
    }
}
