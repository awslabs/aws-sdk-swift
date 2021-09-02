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
        val contents = getFileContents(context.manifest, "/Example/models/GetBucketLocationOutputResponseBody+Decodable.swift")

        val expectedContents =
            """
            extension GetBucketLocationOutputResponseBody: Swift.Decodable {
                enum CodingKeys: Swift.String, Swift.CodingKey {
                    case locationConstraint = "LocationConstraint"
                }
            
                public init (from decoder: Swift.Decoder) throws {
                    var containerValues = try decoder.unkeyedContainer()
                    let locationConstraintDecoded = try containerValues.decodeIfPresent(BucketLocationConstraint.self)
                    locationConstraint = locationConstraintDecoded
                }
            }
            """.trimIndent()

        contents.shouldContainOnlyOnce(expectedContents)
    }

    private fun setupTests(smithyFile: String, serviceShapeId: String): TestContext {
        val context = TestContextGenerator.initContextFrom(smithyFile, serviceShapeId, RestXmlTrait.ID, "RestXml", "RestXml")
        val generator = RestXmlProtocolGenerator()
        generator.generateCodableConformanceForNestedTypes(context.ctx)
        generator.generateDeserializers(context.ctx)
        context.ctx.delegator.flushWriters()
        return context
    }
}
