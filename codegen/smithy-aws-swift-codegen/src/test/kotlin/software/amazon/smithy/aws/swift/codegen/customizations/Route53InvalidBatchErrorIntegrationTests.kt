package software.amazon.smithy.aws.swift.codegen.customizations

import io.kotest.matchers.string.shouldContainOnlyOnce
import org.junit.jupiter.api.Test
import software.amazon.smithy.aws.swift.codegen.TestContext
import software.amazon.smithy.aws.swift.codegen.TestContextGenerator
import software.amazon.smithy.aws.swift.codegen.shouldSyntacticSanityCheck
import software.amazon.smithy.aws.traits.protocols.RestXmlTrait

class Route53InvalidBatchErrorIntegrationTests {

    @Test
    fun `001 test additional structs and extensions are generated`() {
        val context = setupTests("route53-invalidbatch.smithy", "com.amazonaws.route53#Route53")
        val contents = TestContextGenerator.getFileContents(context.manifest, "/Example/models/ChangeResourceRecordSetsOutputError+Customization.swift")
        contents.shouldSyntacticSanityCheck()
        val expectedContents = """
struct CustomInvalidBatchError {

    struct Message {
        var message: String?

        init() {}

        static func readingClosure(from reader: SmithyXML.Reader) throws -> Message? {
            guard reader.content != nil else { return nil }
            var value = Message()
            value.message = try reader["Message"].readIfPresent()
            return value
        }
    }

    var requestID: String?
    var message: String?
    var messages: [String]?

    init() {}

    static func readingClosure(from reader: SmithyXML.Reader) throws -> CustomInvalidBatchError? {
        guard reader.content != nil else { return nil }
        var value = CustomInvalidBatchError()
        value.requestID = try reader["RequestId"].readIfPresent()
        value.message = try reader["Message"].readIfPresent()
        value.messages = try reader["Messages"].readListIfPresent(memberReadingClosure: Message.readingClosure(from:), memberNodeInfo: "Message", isFlattened: false)?.compactMap(\.message)
        return value
    }

    static func makeFromHttpResponse(_ httpResponse: ClientRuntime.HttpResponse) async throws -> CustomInvalidBatchError? {
        guard let data = try await httpResponse.body.readData() else { return nil }
        let reader = try SmithyXML.Reader.from(data: data)
        return try Self.readingClosure(from: reader)
    }
}

extension InvalidChangeBatch {
    init(customError: CustomInvalidBatchError, httpResponse: ClientRuntime.HttpResponse) {
        self.init(messages: customError.messages)
        self.message = customError.message
        self.requestID = customError.requestID
        self.httpResponse = httpResponse
    }
}
"""
        contents.shouldContainOnlyOnce(expectedContents)
    }

    @Test
    fun `002 test ChangeResourceRecordSetsOutputError+HttpResponseBinding is customized`() {
        val context = setupTests("route53-invalidbatch.smithy", "com.amazonaws.route53#Route53")
        val contents = TestContextGenerator.getFileContents(context.manifest, "/Example/models/ChangeResourceRecordSetsOutputError+HttpResponseErrorBinding.swift")
        contents.shouldSyntacticSanityCheck()
        val expectedContents = """
enum ChangeResourceRecordSetsOutputError {

    static var httpBinding: ClientRuntime.HTTPResponseErrorBinding<SmithyXML.Reader> {
        { httpResponse, responseDocumentClosure in
            if let customBatchError = try await CustomInvalidBatchError.makeFromHttpResponse(httpResponse) {
                return InvalidChangeBatch(
                    customError: customBatchError,
                    httpResponse: httpResponse
                )
            }
            let responseReader = try await responseDocumentClosure(httpResponse)
            let errorBodyReader = AWSClientRuntime.RestXMLError.errorBodyReader(responseReader: responseReader, noErrorWrapping: false)
            let restXMLError = try AWSClientRuntime.RestXMLError(responseReader: responseReader, noErrorWrapping: false)
            switch restXMLError.code {
                case "InvalidChangeBatch": return try await InvalidChangeBatch.responseErrorBinding(httpResponse: httpResponse, reader: errorBodyReader, message: restXMLError.message, requestID: restXMLError.requestID)
                default: return try await AWSClientRuntime.UnknownAWSHTTPServiceError.makeError(httpResponse: httpResponse, message: restXMLError.message, requestID: restXMLError.requestID, typeName: restXMLError.code)
            }
        }
    }
}
"""
        contents.shouldContainOnlyOnce(expectedContents)
    }

    private fun setupTests(smithyFile: String, serviceShapeId: String): TestContext {
        val context = TestContextGenerator.initContextFrom(smithyFile, serviceShapeId, RestXmlTrait.ID)
        return context
    }
}
