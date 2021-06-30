package software.amazon.smithy.aws.swift.codegen.ec2query

import io.kotest.matchers.string.shouldContainOnlyOnce
import org.junit.jupiter.api.Test
import software.amazon.smithy.aws.swift.codegen.TestContext
import software.amazon.smithy.aws.swift.codegen.TestContextGenerator
import software.amazon.smithy.aws.swift.codegen.shouldSyntacticSanityCheck
import software.amazon.smithy.aws.traits.protocols.Ec2QueryTrait

class Ec2QueryHttpResponseBindingErrorGeneratorTests {

    @Test
    fun `001 GreetingWithErrorsOutputError has with correct cases`() {
        val context = setupTests("ec2query/query-error.smithy", "aws.protocoltests.ec2#AwsEc2")
        val contents = TestContextGenerator.getFileContents(context.manifest, "/Example/models/GreetingWithErrorsOutputError.swift")
        contents.shouldSyntacticSanityCheck()
        val expectedContents =
            """
            public enum GreetingWithErrorsOutputError: Equatable {
                case complexError(ComplexError)
                case invalidGreeting(InvalidGreeting)
                case unknown(UnknownServiceError)
            }
            """.trimIndent()
        contents.shouldContainOnlyOnce(expectedContents)
    }

    @Test
    fun `002 GreetingWithErrorsOutputError+HttpResponseBinding has with correct cases`() {
        val context = setupTests("ec2query/query-error.smithy", "aws.protocoltests.ec2#AwsEc2")
        val contents = TestContextGenerator.getFileContents(context.manifest, "/Example/models/GreetingWithErrorsOutputError+Extensions.swift")
        contents.shouldSyntacticSanityCheck()
        val expectedContents =
            """
            extension GreetingWithErrorsOutputError: HttpResponseBinding {
                public init(httpResponse: HttpResponse, decoder: ResponseDecoder? = nil) throws {
                    let errorDetails = try Ec2QueryError(httpResponse: httpResponse)
                    try self.init(errorType: errorDetails.errorCode, httpResponse: httpResponse, decoder: decoder, message: errorDetails.message, requestID: errorDetails.requestId)
                }
            }
            
            extension GreetingWithErrorsOutputError {
                public init(errorType: String?, httpResponse: HttpResponse, decoder: ResponseDecoder? = nil, message: String? = nil, requestID: String? = nil) throws {
                    switch errorType {
                    case "ComplexError" : self = .complexError(try ComplexError(httpResponse: httpResponse, decoder: decoder, message: message, requestID: requestID))
                    case "InvalidGreeting" : self = .invalidGreeting(try InvalidGreeting(httpResponse: httpResponse, decoder: decoder, message: message, requestID: requestID))
                    default : self = .unknown(UnknownAWSHttpServiceError(httpResponse: httpResponse, message: message, requestID: requestID))
                    }
                }
            }
            """.trimIndent()
        contents.shouldContainOnlyOnce(expectedContents)
    }

    @Test
    fun `003 ComplexError+Init`() {
        val context = setupTests("ec2query/query-error.smithy", "aws.protocoltests.ec2#AwsEc2")
        val contents = TestContextGenerator.getFileContents(context.manifest, "/Example/models/ComplexError+Init.swift")
        contents.shouldSyntacticSanityCheck()
        val expectedContents =
            """
            extension ComplexError: AWSHttpServiceError {
                public init (httpResponse: HttpResponse, decoder: ResponseDecoder? = nil, message: String? = nil, requestID: String? = nil) throws {
                    if case .data(let data) = httpResponse.body,
                        let unwrappedData = data,
                        let responseDecoder = decoder {
                        let output: Ec2NarrowedResponse<ComplexErrorBody> = try responseDecoder.decode(responseBody: unwrappedData)
                        self.nested = output.errors.error.nested
                        self.topLevel = output.errors.error.topLevel
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
        val context =
            TestContextGenerator.initContextFrom(smithyFile, serviceShapeId, Ec2QueryTrait.ID, "ec2query", "ec2query")

        val generator = Ec2QueryProtocolGenerator()
        generator.generateDeserializers(context.ctx)
        generator.generateCodableConformanceForNestedTypes(context.ctx)
        context.ctx.delegator.flushWriters()
        return context
    }
}
