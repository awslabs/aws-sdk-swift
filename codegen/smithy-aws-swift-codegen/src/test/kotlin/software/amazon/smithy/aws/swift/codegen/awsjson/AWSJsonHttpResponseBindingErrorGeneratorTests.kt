package software.amazon.smithy.aws.swift.codegen.awsjson

import io.kotest.matchers.string.shouldContainOnlyOnce
import org.junit.jupiter.api.Test
import software.amazon.smithy.aws.swift.codegen.TestContext
import software.amazon.smithy.aws.swift.codegen.TestUtils
import software.amazon.smithy.aws.swift.codegen.shouldSyntacticSanityCheck
import software.amazon.smithy.aws.traits.protocols.AwsJson1_0Trait

// The model used in the tests below uses AWS Json 1.0 as the protocol.
// However, AWSJsonHttpResponseBindingErrorGenerator.kt is used for both AWS Json 1.0 and AWS Json 1.1 protocols.
// Therefore, this file tests both versions of AWS Json, 1.0 and 1.1, for the error generation.
class AWSJsonHttpResponseBindingErrorGeneratorTests {
    @Test
    fun `001 GreetingWithErrorsOutputError+HttpResponseBinding`() {
        val context = setupTests("awsjson/json-error.smithy", "aws.protocoltests.json10#AwsJson10")
        val contents = TestUtils.getFileContents(
            context.manifest,
            "/Example/models/GreetingWithErrorsOutputError+HttpResponseErrorBinding.swift"
        )
        contents.shouldSyntacticSanityCheck()
        val expectedContents = """
enum GreetingWithErrorsOutputError {

    static var httpErrorBinding: SmithyReadWrite.WireResponseErrorBinding<ClientRuntime.HttpResponse, SmithyJSON.Reader> {
        { httpResponse, responseDocumentClosure in
            let responseReader = try await responseDocumentClosure(httpResponse)
            let baseError = try AWSClientRuntime.AWSJSONError(httpResponse: httpResponse, responseReader: responseReader, noErrorWrapping: false)
            if let serviceError = try Json10ProtocolClientTypes.responseServiceErrorBinding(baseError: baseError) {
                return serviceError
            }
            switch baseError.code {
                case "ComplexError": return try ComplexError.makeError(baseError: baseError)
                case "InvalidGreeting": return try InvalidGreeting.makeError(baseError: baseError)
                default: return try AWSClientRuntime.UnknownAWSHTTPServiceError.makeError(baseError: baseError)
            }
        }
    }
}
"""
        contents.shouldContainOnlyOnce(expectedContents)
    }

    @Test
    fun `002 AWSJson+ServiceErrorHelperMethod AWSHttpServiceError`() {
        val context = setupTests("awsjson/json-error.smithy", "aws.protocoltests.json10#AwsJson10")
        val contents = TestUtils.getFileContents(
            context.manifest,
            "/Example/models/AwsJson10+ServiceErrorHelperMethod.swift"
        )
        contents.shouldSyntacticSanityCheck()
        val expectedContents = """
extension Json10ProtocolClientTypes {
    static func responseServiceErrorBinding(baseError: AWSClientRuntime.AWSJSONError) throws -> Swift.Error? {
        switch baseError.code {
            case "ExampleServiceError": return try ExampleServiceError.makeError(baseError: baseError)
            default: return nil
        }
    }
}
"""
        contents.shouldContainOnlyOnce(expectedContents)
    }

    private fun setupTests(smithyFile: String, serviceShapeId: String): TestContext {
        val context = TestUtils.executeDirectedCodegen(smithyFile, serviceShapeId, AwsJson1_0Trait.ID)

        AwsJson1_0_ProtocolGenerator().run {
            generateDeserializers(context.ctx)
            generateCodableConformanceForNestedTypes(context.ctx)
        }

        context.ctx.delegator.flushWriters()
        return context
    }
}
