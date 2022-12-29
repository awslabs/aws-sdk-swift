package software.amazon.smithy.aws.swift.codegen.customization.route53

import software.amazon.smithy.aws.swift.codegen.restxml.AWSRestXMLHttpResponseBindingErrorGenerator
import software.amazon.smithy.model.Model
import software.amazon.smithy.model.shapes.ServiceShape
import software.amazon.smithy.swift.codegen.SwiftSettings
import software.amazon.smithy.swift.codegen.SwiftDelegator
import software.amazon.smithy.swift.codegen.SwiftDependency
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
            writer.openBlock("if let customBatchError = CustomInvalidBatchError.makeFromHttpResponse(httpResponse) {", "}") {
                writer.openBlock("let invalidChangeBatchError = InvalidChangeBatch(", ")") {
                    writer.write("customError: customBatchError,")
                    writer.write("headers: httpResponse.headers,")
                    writer.write("statusCode: httpResponse.statusCode")
                }
                writer.write("self = .invalidChangeBatch(invalidChangeBatchError)")
                writer.write("return")
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
        writer.openBlock("struct CustomInvalidBatchError: Decodable {", "}") {
            writer.openBlock("struct Message: Decodable {", "}") {
                writer.write("let message: String")
                writer.openBlock("enum CodingKeys: String, CodingKey {", "}") {
                    writer.write("case message = \"Message\"")
                }
            }
            writer.write("let requestId: String")
            writer.write("let messages: [String]?")
            writer.openBlock("enum CodingKeys: String, CodingKey {", "}") {
                writer.write("case messages = \"Messages\"")
                writer.write("case requestId = \"RequestId\"")
            }
            writer.openBlock("init(from decoder: Decoder) throws {", "}") {
                writer.write("let container = try decoder.container(keyedBy: CodingKeys.self)")
                writer.write("self.requestId = try container.decode(String.self, forKey: .requestId)")
                writer.write("let messages = try container.decodeIfPresent([Message].self, forKey: .messages)")
                writer.write("self.messages = messages?.map(\\.message)")
            }
            writer.openBlock("static func makeFromHttpResponse(_ httpResponse: ClientRuntime.HttpResponse) -> CustomInvalidBatchError? {", "}") {
                writer.openBlock("guard let data = httpResponse.body.toBytes()?.getData() else {", "}") {
                    writer.write("return nil")
                }
                writer.write("return try? XMLDecoder().decode(CustomInvalidBatchError.self, from: data)")
            }
        }

    }

    private fun renderInvalidChangeBatch(writer: SwiftWriter) {
        writer.openBlock("extension InvalidChangeBatch {", "}") {
            writer.openBlock("init(customError: CustomInvalidBatchError, headers: Headers?, statusCode: HttpStatusCode?) {", "}") {
                writer.write("self.init(messages: customError.messages)")
                writer.write("self._requestID = customError.requestId")
                writer.write("self._headers = headers")
                writer.write("self._statusCode = statusCode")
            }
        }
    }
}