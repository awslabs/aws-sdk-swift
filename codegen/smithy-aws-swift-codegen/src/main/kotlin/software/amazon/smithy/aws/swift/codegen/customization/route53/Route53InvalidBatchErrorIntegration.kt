package software.amazon.smithy.aws.swift.codegen.customization.route53

import software.amazon.smithy.aws.swift.codegen.restxml.AWSRestXMLHttpResponseBindingErrorGenerator
import software.amazon.smithy.model.Model
import software.amazon.smithy.model.shapes.ServiceShape
import software.amazon.smithy.swift.codegen.SmithyXMLTypes
import software.amazon.smithy.swift.codegen.SwiftDelegator
import software.amazon.smithy.swift.codegen.SwiftDependency
import software.amazon.smithy.swift.codegen.SwiftSettings
import software.amazon.smithy.swift.codegen.SwiftWriter
import software.amazon.smithy.swift.codegen.core.CodegenContext
import software.amazon.smithy.swift.codegen.integration.ProtocolGenerator
import software.amazon.smithy.swift.codegen.integration.SectionWriter
import software.amazon.smithy.swift.codegen.integration.SectionWriterBinding
import software.amazon.smithy.swift.codegen.integration.SwiftIntegration
import software.amazon.smithy.swift.codegen.model.expectShape

class Route53InvalidBatchErrorIntegration : SwiftIntegration {
    override fun enabledForService(model: Model, settings: SwiftSettings): Boolean {
        return model.expectShape<ServiceShape>(settings.service).isRoute53
    }

    override val sectionWriters: List<SectionWriterBinding>
        get() = listOf(
            SectionWriterBinding(AWSRestXMLHttpResponseBindingErrorGenerator.RestXMLResponseBindingSectionId, httpResponseBindingErrorGenerator)
        )

    private val httpResponseBindingErrorGenerator = SectionWriter { writer, previousCode ->
        val operationErrorName = writer.getContext("operationErrorName") as String
        if (operationErrorName == "ChangeResourceRecordSetsOutputError") {
            writer.openBlock("if let customBatchError = try await CustomInvalidBatchError.makeFromHttpResponse(httpResponse) {", "}") {
                writer.openBlock("return InvalidChangeBatch(", ")") {
                    writer.write("customError: customBatchError,")
                    writer.write("httpResponse: httpResponse")
                }
            }
        }
        writer.write(previousCode)
    }

    override fun writeAdditionalFiles(ctx: CodegenContext, protocolGenerationContext: ProtocolGenerator.GenerationContext, delegator: SwiftDelegator) {
        delegator.useFileWriter("${ctx.settings.moduleName}/models/ChangeResourceRecordSetsOutputError+Customization.swift") { writer ->
            writer.addImport(SwiftDependency.CLIENT_RUNTIME.target)
            renderCustomInvalidBatchError(writer)
            renderInvalidChangeBatch(writer)
        }
    }

    private fun renderCustomInvalidBatchError(writer: SwiftWriter) {
        writer.openBlock("struct CustomInvalidBatchError {", "}") {
            writer.write("")
            writer.openBlock("struct Message {", "}") {
                writer.write("var message: String?")
                writer.write("")
                writer.write("init() {}")
                writer.write("")
                writer.openBlock(
                    "static func readingClosure(from reader: \$N) throws -> Message? {",
                    "}",
                    SmithyXMLTypes.Reader,
                ) {
                    writer.write("guard reader.content != nil else { return nil }")
                    writer.write("var value = Message()")
                    writer.write("value.message = try reader[\"Message\"].readIfPresent()")
                    writer.write("return value")
                }
            }
            writer.write("")
            writer.write("var requestID: String?")
            writer.write("var message: String?")
            writer.write("var messages: [String]?")
            writer.write("")
            writer.write("init() {}")
            writer.write("")
            writer.openBlock(
                "static func readingClosure(from reader: \$N) throws -> CustomInvalidBatchError? {",
                "}",
                SmithyXMLTypes.Reader,
            ) {
                writer.write("guard reader.content != nil else { return nil }")
                writer.write("var value = CustomInvalidBatchError()")
                writer.write("value.requestID = try reader[\"RequestId\"].readIfPresent()")
                writer.write("value.message = try reader[\"Message\"].readIfPresent()")
                writer.write("value.messages = try reader[\"Messages\"].readListIfPresent(memberReadingClosure: Message.readingClosure(from:), memberNodeInfo: \"Message\", isFlattened: false)?.compactMap(\\.message)")
                writer.write("return value")
            }
            writer.write("")
            writer.openBlock("static func makeFromHttpResponse(_ httpResponse: ClientRuntime.HttpResponse) async throws -> CustomInvalidBatchError? {", "}") {
                writer.write("guard let data = try await httpResponse.body.readData() else { return nil }")
                writer.write("let reader = try \$N.from(data: data)", SmithyXMLTypes.Reader)
                writer.write("return try Self.readingClosure(from: reader)")
            }
        }
    }

    private fun renderInvalidChangeBatch(writer: SwiftWriter) {
        writer.write("")
        writer.openBlock("extension InvalidChangeBatch {", "}") {
            writer.openBlock("init(customError: CustomInvalidBatchError, httpResponse: ClientRuntime.HttpResponse) {", "}") {
                writer.write("self.init(messages: customError.messages)")
                writer.write("self.message = customError.message")
                writer.write("self.requestID = customError.requestID")
                writer.write("self.httpResponse = httpResponse")
            }
        }
    }
}
