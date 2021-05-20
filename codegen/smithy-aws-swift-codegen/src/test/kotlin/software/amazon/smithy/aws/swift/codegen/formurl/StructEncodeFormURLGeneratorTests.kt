package software.amazon.smithy.aws.swift.codegen.formurl

import io.kotest.matchers.string.shouldContainOnlyOnce
import org.junit.jupiter.api.Test
import software.amazon.smithy.aws.swift.codegen.TestContext
import software.amazon.smithy.aws.swift.codegen.TestContextGenerator
import software.amazon.smithy.aws.swift.codegen.TestContextGenerator.Companion.listFilesFromManifest
import software.amazon.smithy.aws.swift.codegen.awsquery.AwsQueryProtocolGenerator
import software.amazon.smithy.aws.swift.codegen.shouldSyntacticSanityCheck
import software.amazon.smithy.aws.traits.protocols.AwsQueryTrait

class StructEncodeFormURLGeneratorTests {
    @Test
    fun `001 form url test driver`() {
        val context = setupTests("awsquery/query-idempotency-token.smithy", "aws.protocoltests.query#AwsQuery")
        print(listFilesFromManifest(context.manifest))
        val contents = TestContextGenerator.getFileContents(context.manifest, "/Example/models/QueryIdempotencyTokenAutoFillInput+Encodable.swift")
        contents.shouldSyntacticSanityCheck()
        val expectedContents =
            """
            extension QueryIdempotencyTokenAutoFillInput: Encodable, Reflection {
                enum CodingKeys: String, CodingKey {
                    case token
                }
            
                public func encode(to encoder: Encoder) throws {
                    var container = encoder.container(keyedBy: Key.self)
                    if let token = token {
                        try container.encode(token, forKey: Key("token"))
                    }
                    try container.encode("QueryIdempotencyTokenAutoFill", forKey:Key("Action"))
                    try container.encode("2020-01-08", forKey:Key("Version"))
                }
            }
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