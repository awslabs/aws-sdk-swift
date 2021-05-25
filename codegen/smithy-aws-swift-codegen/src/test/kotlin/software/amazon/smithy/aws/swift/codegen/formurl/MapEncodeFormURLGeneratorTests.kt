package software.amazon.smithy.aws.swift.codegen.formurl

import io.kotest.matchers.string.shouldContainOnlyOnce
import org.junit.jupiter.api.Test
import software.amazon.smithy.aws.swift.codegen.TestContext
import software.amazon.smithy.aws.swift.codegen.TestContextGenerator
import software.amazon.smithy.aws.swift.codegen.awsquery.AwsQueryProtocolGenerator
import software.amazon.smithy.aws.swift.codegen.shouldSyntacticSanityCheck
import software.amazon.smithy.aws.traits.protocols.AwsQueryTrait

class MapEncodeFormURLGeneratorTests {
    @Test
    fun `001 encode different types of maps`() {
        val context = setupTests("awsquery/query-maps.smithy", "aws.protocoltests.query#AwsQuery")
        print(TestContextGenerator.listFilesFromManifest(context.manifest))
        val contents = TestContextGenerator.getFileContents(context.manifest, "/Example/models/QueryMapsInput+Encodable.swift")
        contents.shouldSyntacticSanityCheck()
        val expectedContents =
            """

            """.trimIndent()
        contents.shouldContainOnlyOnce(expectedContents)
    }

    private fun setupTests(smithyFile: String, serviceShapeId: String): TestContext {
        val context =
            TestContextGenerator.initContextFrom(smithyFile, serviceShapeId, AwsQueryTrait.ID, "awsQuery", "awsQuery")

        val generator = AwsQueryProtocolGenerator()
        generator.generateDeserializers(context.ctx)
        generator.generateCodableConformanceForNestedTypes(context.ctx)
        context.ctx.delegator.flushWriters()
        return context
    }
}