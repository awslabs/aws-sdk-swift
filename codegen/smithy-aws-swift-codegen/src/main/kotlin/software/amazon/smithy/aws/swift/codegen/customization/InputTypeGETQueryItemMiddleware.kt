package software.amazon.smithy.aws.swift.codegen.customization

import software.amazon.smithy.codegen.core.Symbol
import software.amazon.smithy.model.shapes.IntegerShape
import software.amazon.smithy.model.shapes.ListShape
import software.amazon.smithy.model.shapes.Shape
import software.amazon.smithy.model.shapes.ShapeId
import software.amazon.smithy.model.shapes.TimestampShape
import software.amazon.smithy.swift.codegen.Middleware
import software.amazon.smithy.swift.codegen.SwiftDependency
import software.amazon.smithy.swift.codegen.SwiftTypes
import software.amazon.smithy.swift.codegen.SwiftWriter
import software.amazon.smithy.swift.codegen.integration.ProtocolGenerator
import software.amazon.smithy.swift.codegen.integration.steps.OperationSerializeStep
import software.amazon.smithy.swift.codegen.model.isEnum
import software.amazon.smithy.swift.codegen.swiftmodules.SmithyHTTPAPITypes

class InputTypeGETQueryItemMiddleware(
    private val ctx: ProtocolGenerator.GenerationContext,
    val inputSymbol: Symbol,
    outputSymbol: Symbol,
    outputErrorSymbol: Symbol,
    val inputShape: Shape,
    private val writer: SwiftWriter
) : Middleware(writer, inputSymbol, OperationSerializeStep(inputSymbol, outputSymbol, outputErrorSymbol)) {
    override val typeName = "${inputSymbol.name}GETQueryItemMiddleware"

    override fun renderExtensions() {
        writer.addImport(SwiftDependency.SMITHY.target)
        writer.addImport(SwiftDependency.SMITHY_HTTP_API.target)
        writer.write(
            """
            extension $typeName: Smithy.RequestMessageSerializer {
                public typealias InputType = ${inputSymbol.name}
                public typealias RequestType = SmithyHTTPAPI.SdkHttpRequest
                
                public func apply(input: InputType, builder: SmithyHTTPAPI.SdkHttpRequestBuilder, attributes: Smithy.Context) throws {
                    ${'$'}{C|}
                }
            }
            """.trimIndent(),
            Runnable { renderApplyBody() }
        )
    }

    override fun generateMiddlewareClosure() {
        writer.write("try self.apply(input: input.operationInput, builder: input.builder, attributes: context)")
    }

    private fun renderApplyBody() {
        for (member in inputShape.members()) {
            val memberName = ctx.symbolProvider.toMemberName(member)
            val queryKey = member.memberName

            val memberTargetShape = ctx.model.expectShape(member.target)
            if (memberTargetShape is IntegerShape || memberTargetShape is TimestampShape) {
                continue
            }
            writer.openBlock("if let $memberName = input.$memberName {", "}") {
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
        writer.write(
            "let queryItem = \$N(name: \$S.urlPercentEncoding(), value: \$S.urlPercentEncoding())",
            SmithyHTTPAPITypes.SDKURLQueryItem,
            queryValue,
            queryKey,
        )
        writer.write("builder.withQueryItem(queryItem)")
    }

    override fun generateInit() {
        writer.write("public init() {}")
    }
}
