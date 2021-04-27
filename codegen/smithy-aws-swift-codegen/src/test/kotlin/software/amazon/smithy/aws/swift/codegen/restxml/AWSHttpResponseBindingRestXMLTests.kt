package software.amazon.smithy.aws.swift.codegen.restxml

import org.junit.jupiter.api.Test
import software.amazon.smithy.aws.swift.codegen.MockRestXmlProtocolGenerator
import software.amazon.smithy.aws.swift.codegen.TestContext
import software.amazon.smithy.aws.swift.codegen.TestContextGenerator.Companion.getModelFileContents
import software.amazon.smithy.aws.swift.codegen.TestContextGenerator.Companion.initContextFrom
import software.amazon.smithy.aws.swift.codegen.shouldSyntacticSanityCheck
import software.amazon.smithy.aws.traits.protocols.RestXmlTrait

class AWSHttpResponseBindingRestXMLTests {

    @Test
    fun `GreetingWithErrorsOutputError ResponseInit`() {
        val context = setupTests("restxml/xml-errors.smithy", "aws.protocoltests.restxml#RestXml")
        val contents = getModelFileContents("Example", "GreetingWithErrorsOutputError+HttpResponseBinding.swift", context.manifest)
        contents.shouldSyntacticSanityCheck()
        // TODO: Fill in validation here
    }

    private fun setupTests(smithyFile: String, serviceShapeId: String): TestContext {
        val context = initContextFrom(smithyFile, serviceShapeId, RestXmlTrait.ID, "restXml", "restXml")

        val generator = MockRestXmlProtocolGenerator()
        generator.generateDeserializers(context.ctx)
        generator.generateCodableConformanceForNestedTypes(context.ctx)
        context.ctx.delegator.flushWriters()
        return context
    }
}
