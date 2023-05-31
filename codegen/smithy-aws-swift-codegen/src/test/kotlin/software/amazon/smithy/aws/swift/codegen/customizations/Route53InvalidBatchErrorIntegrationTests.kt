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
        val expectedContents =
            """
            struct CustomInvalidBatchError: Decodable {
                struct Message: Decodable {
                    let message: String
                    enum CodingKeys: String, CodingKey {
                        case message = "Message"
                    }
                }
                let requestId: String
                let messages: [String]?
                enum CodingKeys: String, CodingKey {
                    case messages = "Messages"
                    case requestId = "RequestId"
                }
                init(from decoder: Decoder) throws {
                    let container = try decoder.container(keyedBy: CodingKeys.self)
                    self.requestId = try container.decode(String.self, forKey: .requestId)
                    let messages = try container.decodeIfPresent([Message].self, forKey: .messages)
                    self.messages = messages?.map(\.message)
                }
                static func makeFromHttpResponse(_ httpResponse: ClientRuntime.HttpResponse) async -> CustomInvalidBatchError? {
                    guard let data = try await httpResponse.body.readData() else {
                        return nil
                    }
                    return try? XMLDecoder().decode(CustomInvalidBatchError.self, from: data)
                }
            }
            extension InvalidChangeBatch {
                init(customError: CustomInvalidBatchError, headers: Headers?, statusCode: HttpStatusCode?) {
                    self.init(messages: customError.messages)
                    self._requestID = customError.requestId
                    self._headers = headers
                    self._statusCode = statusCode
                }
            }
            """.trimIndent()
        contents.shouldContainOnlyOnce(expectedContents)
    }

    @Test
    fun `002 test ChangeResourceRecordSetsOutputError+HttpResponseBinding is customized`() {
        val context = setupTests("route53-invalidbatch.smithy", "com.amazonaws.route53#Route53")
        val contents = TestContextGenerator.getFileContents(context.manifest, "/Example/models/ChangeResourceRecordSetsOutputError+HttpResponseErrorBinding.swift")
        contents.shouldSyntacticSanityCheck()
        val expectedContents =
            """
            public enum ChangeResourceRecordSetsOutputError: ClientRuntime.HttpResponseErrorBinding {
                public static func makeError(httpResponse: ClientRuntime.HttpResponse, decoder: ClientRuntime.ResponseDecoder? = nil) async throws -> Swift.Error {
                    if let customBatchError = CustomInvalidBatchError.makeFromHttpResponse(httpResponse) {
                        let invalidChangeBatchError = InvalidChangeBatch(
                            customError: customBatchError,
                            headers: httpResponse.headers,
                            statusCode: httpResponse.statusCode
                        )
                        self = .invalidChangeBatch(invalidChangeBatchError)
                        return
                    }
                    let restXMLError = try await AWSClientRuntime.RestXMLError(httpResponse: httpResponse)
                    switch restXMLError.errorCode {
                        case "InvalidChangeBatch": return try await InvalidChangeBatch(httpResponse: httpResponse, decoder: decoder, message: restXMLError.message, requestID: restXMLError.requestId)
                        default: return try await AWSClientRuntime.UnknownAWSHttpServiceError.makeError(httpResponse: httpResponse, message: restXMLError.message, requestID: restXMLError.requestId)
                    }
                }
            }
            """.trimIndent()
        contents.shouldContainOnlyOnce(expectedContents)
    }

    private fun setupTests(smithyFile: String, serviceShapeId: String): TestContext {
        val context = TestContextGenerator.initContextFrom(smithyFile, serviceShapeId, RestXmlTrait.ID)
        return context
    }
}
