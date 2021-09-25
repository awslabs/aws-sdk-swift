package software.amazon.smithy.aws.swift.codegen.customization.polly

import software.amazon.smithy.codegen.core.Symbol
import software.amazon.smithy.model.shapes.Shape
import software.amazon.smithy.swift.codegen.ClientRuntimeTypes.Core.URLQueryItem
import software.amazon.smithy.swift.codegen.Middleware
import software.amazon.smithy.swift.codegen.SwiftTypes
import software.amazon.smithy.swift.codegen.SwiftWriter
import software.amazon.smithy.swift.codegen.integration.ProtocolGenerator
import software.amazon.smithy.swift.codegen.integration.steps.OperationSerializeStep
import software.amazon.smithy.swift.codegen.model.isEnum

class PollySynthesizeSpeechGETQueryItemMiddleware(private val ctx: ProtocolGenerator.GenerationContext,
                                                  inputSymbol: Symbol,
                                                  outputSymbol: Symbol,
                                                  outputErrorSymbol: Symbol,
                                                  val inputShape: Shape,
                                                  //private val queryLiterals: Map<String, String>,
                                                  //private val queryBindings: List<HttpBindingDescriptor>,
                                                  //private val defaultTimestampFormat: TimestampFormatTrait.Format,
                                                  private val writer: SwiftWriter
) : Middleware(writer, inputSymbol, OperationSerializeStep(inputSymbol, outputSymbol, outputErrorSymbol)) {
    override val typeName = "${inputSymbol.name}GETQueryItemMiddleware"

    override fun generateMiddlewareClosure() {
        for (member in inputShape.members()) {
            val rawValueIfNeeded = if (ctx.model.expectShape(member.target).isEnum) ".rawValue" else ""
            val queryKey = member.memberName
            val memberName = ctx.symbolProvider.toMemberName(member)
            writer.openBlock("if let ${memberName} = input.operationInput.${memberName} {", "}") {
                writer.write("let queryItem = \$N(name: \"${queryKey}\".urlPercentEncoding(), value: \$N(${memberName}${rawValueIfNeeded}).urlPercentEncoding())", URLQueryItem, SwiftTypes.String)
                writer.write("input.builder.withQueryItem(queryItem)")
            }
        }
    }

    override fun generateInit() {
        writer.write("public init() {}")
    }
}