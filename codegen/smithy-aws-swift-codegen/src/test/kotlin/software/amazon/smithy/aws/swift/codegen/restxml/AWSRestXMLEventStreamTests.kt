package software.amazon.smithy.aws.swift.codegen.restxml

import org.junit.jupiter.api.Test
import software.amazon.smithy.aws.swift.codegen.TestContext
import software.amazon.smithy.aws.swift.codegen.TestContextGenerator
import software.amazon.smithy.aws.swift.codegen.shouldSyntacticSanityCheck
import software.amazon.smithy.aws.traits.protocols.RestXmlTrait

class AWSRestXMLEventStreamTests {
    @Test
    fun `001 `() {
        val context = setupTests(
            "restxml/xml-event-stream.smithy",
            "com.test#EventStreamTest"
        )
        val contents = TestContextGenerator.getFileContents(
            context.manifest,
            ""
        )
        contents.shouldSyntacticSanityCheck()
        val expectedContents = """
        
        """.trimIndent()
    }

    private fun setupTests(smithyFile: String, serviceShapeId: String): TestContext {
        val context = TestContextGenerator.initContextFrom(smithyFile, serviceShapeId, RestXmlTrait.ID)
        RestXmlProtocolGenerator().run {
            generateMessageMarshallable(context.ctx)
            generateSerializers(context.ctx)
            initializeMiddleware(context.ctx)
            generateProtocolClient(context.ctx)
        }
        context.ctx.delegator.flushWriters()
        return context
    }
}
