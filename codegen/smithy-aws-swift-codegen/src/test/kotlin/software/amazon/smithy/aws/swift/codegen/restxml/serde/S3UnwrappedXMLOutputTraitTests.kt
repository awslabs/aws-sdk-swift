package software.amazon.smithy.aws.swift.codegen.restxml.serde

import io.kotest.matchers.string.shouldContainOnlyOnce
import org.junit.jupiter.api.Test
import software.amazon.smithy.aws.swift.codegen.TestContext
import software.amazon.smithy.aws.swift.codegen.TestContextGenerator
import software.amazon.smithy.aws.swift.codegen.TestContextGenerator.Companion.getFileContents
import software.amazon.smithy.aws.swift.codegen.restxml.RestXmlProtocolGenerator
import software.amazon.smithy.aws.traits.protocols.RestXmlTrait

class S3UnwrappedXMLOutputTraitTests {
    @Test
    fun `001 S3UnwrappedXmlOutputTrait`() {
        val context = setupTests("restxml/serde/s3unwrappedxmloutput.smithy", "aws.protocoltests.restxml#RestXml")
        val contents = getFileContents(context.manifest, "/Example/models/GetBucketLocationOutput+HttpResponseBinding.swift")

        val expectedContents = """
extension GetBucketLocationOutput {

    static var httpBinding: ClientRuntime.HTTPResponseOutputBinding<GetBucketLocationOutput, SmithyXML.Reader> {
        { httpResponse, responseDocumentClosure in
            let responseReader = try await responseDocumentClosure(httpResponse)
            let reader = responseReader.unwrap()
            var value = GetBucketLocationOutput()
            value.locationConstraint = try reader["LocationConstraint"].readIfPresent()
            return value
        }
    }
}
"""
        contents.shouldContainOnlyOnce(expectedContents)
    }

    private fun setupTests(smithyFile: String, serviceShapeId: String): TestContext {
        val context = TestContextGenerator.initContextFrom(smithyFile, serviceShapeId, RestXmlTrait.ID)
        val generator = RestXmlProtocolGenerator()
        generator.generateCodableConformanceForNestedTypes(context.ctx)
        generator.generateDeserializers(context.ctx)
        context.ctx.delegator.flushWriters()
        return context
    }
}
