package software.amazon.smithy.aws.swift.codegen.restxml

import io.kotest.matchers.string.shouldContainOnlyOnce
import org.junit.jupiter.api.Test
import software.amazon.smithy.aws.swift.codegen.TestContext
import software.amazon.smithy.aws.swift.codegen.TestContextGenerator.Companion.getFileContents
import software.amazon.smithy.aws.swift.codegen.TestContextGenerator.Companion.initContextFrom
import software.amazon.smithy.aws.swift.codegen.shouldSyntacticSanityCheck
import software.amazon.smithy.aws.traits.protocols.RestXmlTrait

class AWSHttpResponseBindingRestXMLTests {

    @Test
    fun `001 GreetingWithErrorsOutputError has with correct cases`() {
        val context = setupTests("restxml/xml-errors.smithy", "aws.protocoltests.restxml#RestXml")
        val contents = getFileContents(context.manifest, "/Example/models/GreetingWithErrorsOutputError.swift")
        contents.shouldSyntacticSanityCheck()
        val expectedContents =
            """
            public enum GreetingWithErrorsOutputError: Equatable {
                case complexXMLError(ComplexXMLError)
                case invalidGreeting(InvalidGreeting)
                case unknown(UnknownAWSHttpServiceError)
            }
            """.trimIndent()
        contents.shouldContainOnlyOnce(expectedContents)
    }

    @Test
    fun `002 GreetingWithErrorsOutputError+HttpResponseBinding`() {
        val context = setupTests("restxml/xml-errors.smithy", "aws.protocoltests.restxml#RestXml")
        val contents = getFileContents(context.manifest, "/Example/models/GreetingWithErrorsOutputError+HttpResponseBinding.swift")
        contents.shouldSyntacticSanityCheck()
        val expectedContents =
            """
            extension GreetingWithErrorsOutputError: HttpResponseBinding {
                public init(httpResponse: HttpResponse, decoder: ResponseDecoder? = nil) throws {
                    let errorDetails = try RestXMLError(httpResponse: httpResponse)
                    try self.init(errorType: errorDetails.errorCode, httpResponse: httpResponse, decoder: decoder, message: nil, requestID: errorDetails.requestId)
                }
            }

            extension GreetingWithErrorsOutputError {
                public init(errorType: String?, httpResponse: HttpResponse, decoder: ResponseDecoder? = nil, message: String? = nil, requestID: String? = nil) throws {
                    switch errorType {
                    case "ComplexXMLError" : self = .complexXMLError(try ComplexXMLError(httpResponse: httpResponse, decoder: decoder, message: message, requestID: requestID))
                    case "InvalidGreeting" : self = .invalidGreeting(try InvalidGreeting(httpResponse: httpResponse, decoder: decoder, message: message, requestID: requestID))
                    default : self = .unknown(UnknownAWSHttpServiceError(httpResponse: httpResponse, message: message))
                    }
                }
            }
            """.trimIndent()
        contents.shouldContainOnlyOnce(expectedContents)
    }
    @Test
    fun `003 ComplexXMLError+Init`() {
        val context = setupTests("restxml/xml-errors.smithy", "aws.protocoltests.restxml#RestXml")
        val contents = getFileContents(context.manifest, "/Example/models/ComplexXMLError+Init.swift")
        contents.shouldSyntacticSanityCheck()
        val expectedContents =
            """            
            extension ComplexXMLError: AWSHttpServiceError {
                public init (httpResponse: HttpResponse, decoder: ResponseDecoder? = nil, message: String? = nil, requestID: String? = nil) throws {
                    if let headerHeaderValue = httpResponse.headers.value(for: "X-Header") {
                        self.header = headerHeaderValue
                    } else {
                        self.header = nil
                    }
                    if case .data(let data) = httpResponse.body,
                        let unwrappedData = data,
                        let responseDecoder = decoder {
                        let output: ErrorResponseContainer<ComplexXMLErrorBody> = try responseDecoder.decode(responseBody: unwrappedData)
                        self.nested = output.error.nested
                        self.topLevel = output.error.topLevel
                    } else {
                        self.nested = nil
                        self.topLevel = nil
                    }
                    self._headers = httpResponse.headers
                    self._statusCode = httpResponse.statusCode
                    self._requestID = requestID
                    self._message = message
                }
            }
            """.trimIndent()
        contents.shouldContainOnlyOnce(expectedContents)
    }
    private fun setupTests(smithyFile: String, serviceShapeId: String): TestContext {
        val context = initContextFrom(smithyFile, serviceShapeId, RestXmlTrait.ID, "restXml", "restXml")

        val generator = RestXmlProtocolGenerator()
        generator.generateDeserializers(context.ctx)
        generator.generateCodableConformanceForNestedTypes(context.ctx)
        context.ctx.delegator.flushWriters()
        return context
    }
}
