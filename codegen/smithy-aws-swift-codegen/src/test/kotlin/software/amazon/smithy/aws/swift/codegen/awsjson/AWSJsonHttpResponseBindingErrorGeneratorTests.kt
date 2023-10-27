package software.amazon.smithy.aws.swift.codegen.awsjson

import io.kotest.matchers.string.shouldContainOnlyOnce
import org.junit.jupiter.api.Test
import software.amazon.smithy.aws.swift.codegen.TestContext
import software.amazon.smithy.aws.swift.codegen.TestContextGenerator
import software.amazon.smithy.aws.swift.codegen.shouldSyntacticSanityCheck
import software.amazon.smithy.aws.traits.protocols.AwsJson1_0Trait

// The model used in the tests below uses AWS Json 1.0 as the protocol.
// However, AWSJsonHttpResponseBindingErrorGenerator.kt is used for both AWS Json 1.0 and AWS Json 1.1 protocols.
// Therefore, this file tests both versions of AWS Json, 1.0 and 1.1, for the error generation.
class AWSJsonHttpResponseBindingErrorGeneratorTests {
    @Test
    fun `001 GreetingWithErrorsOutputError+HttpResponseBinding`() {
        val context = setupTests("awsjson/json-error.smithy", "aws.protocoltests.json10#AwsJson10")
        val contents = TestContextGenerator.getFileContents(
            context.manifest,
            "/Example/models/GreetingWithErrorsOutputError+HttpResponseErrorBinding.swift"
        )
        contents.shouldSyntacticSanityCheck()
        val expectedContents =
            """
            enum GreetingWithErrorsOutputError: ClientRuntime.HttpResponseErrorBinding {
                static func makeError(httpResponse: ClientRuntime.HttpResponse, decoder: ClientRuntime.ResponseDecoder? = nil) async throws -> Swift.Error {
                    let restJSONError = try await AWSClientRuntime.RestJSONError(httpResponse: httpResponse)
                    let requestID = httpResponse.requestId
                    let serviceError = try await Json10ProtocolClientTypes.makeServiceError(httpResponse, decoder, restJSONError, requestID)
                    if let error = serviceError { return error }
                    switch restJSONError.errorType {
                        case "ComplexError": return try await ComplexError(httpResponse: httpResponse, decoder: decoder, message: restJSONError.errorMessage, requestID: requestID)
                        case "InvalidGreeting": return try await InvalidGreeting(httpResponse: httpResponse, decoder: decoder, message: restJSONError.errorMessage, requestID: requestID)
                        default: return try await AWSClientRuntime.UnknownAWSHTTPServiceError.makeError(httpResponse: httpResponse, message: restJSONError.errorMessage, requestID: requestID, typeName: restJSONError.errorType)
                    }
                }
            }
            """.trimIndent()
        contents.shouldContainOnlyOnce(expectedContents)
    }

    @Test
    fun `002 AWSJson+ServiceErrorHelperMethod AWSHttpServiceError`() {
        val context = setupTests("awsjson/json-error.smithy", "aws.protocoltests.json10#AwsJson10")
        val contents = TestContextGenerator.getFileContents(
            context.manifest,
            "/Example/models/AwsJson10+ServiceErrorHelperMethod.swift"
        )
        contents.shouldSyntacticSanityCheck()
        val expectedContents =
            """
            extension Json10ProtocolClientTypes {
                static func makeServiceError(_ httpResponse: ClientRuntime.HttpResponse, _ decoder: ClientRuntime.ResponseDecoder? = nil, _ error: AWSClientRuntime.RestJSONError, _ id: String?) async throws -> Swift.Error? {
                    switch error.errorType {
                        case "ExampleServiceError": return try await ExampleServiceError(httpResponse: httpResponse, decoder: decoder, message: error.errorMessage, requestID: id)
                        default: return nil
                    }
                }
            }
            """.trimIndent()
        contents.shouldContainOnlyOnce(expectedContents)
    }

    private fun setupTests(smithyFile: String, serviceShapeId: String): TestContext {
        val context = TestContextGenerator.initContextFrom(smithyFile, serviceShapeId, AwsJson1_0Trait.ID)

        AwsJson1_0_ProtocolGenerator().run {
            generateDeserializers(context.ctx)
            generateCodableConformanceForNestedTypes(context.ctx)
        }

        context.ctx.delegator.flushWriters()
        return context
    }
}
