/*
 * Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
 * SPDX-License-Identifier: Apache-2.0.
 */

package software.amazon.smithy.aws.swift.codegen.restxml

import io.kotest.matchers.string.shouldContainOnlyOnce
import org.junit.jupiter.api.Test
import software.amazon.smithy.aws.swift.codegen.TestContext
import software.amazon.smithy.aws.swift.codegen.TestContextGenerator.Companion.getClientFileContents
import software.amazon.smithy.aws.swift.codegen.TestContextGenerator.Companion.initContextFrom
import software.amazon.smithy.aws.swift.codegen.shouldSyntacticSanityCheck
import software.amazon.smithy.aws.traits.protocols.RestXmlTrait

class RestXMLProtocolXMLAttributesGeneratorTests {

    @Test
    fun `smoke test for generating request tests`() {
        val context = setupTests("restxml-attributes-generator-test.smithy", "aws.protocoltests.restxml#RestXml")
        val contents = getClientFileContents("ExampleTests", "XmlAttributesRequestTest.swift", context.manifest)
        contents.shouldSyntacticSanityCheck()

        val expectedContents =
            """
            class XmlAttributesRequestTest: HttpRequestTestBase {
            """.trimIndent()
        contents.shouldContainOnlyOnce(expectedContents)
    }

    private fun setupTests(smithyFile: String, serviceShapeId: String): TestContext {
        val context = initContextFrom(smithyFile, serviceShapeId, RestXmlTrait.ID, "restXml", "restXml")

        val generator = RestXmlProtocolGenerator()
        generator.generateProtocolUnitTests(context.ctx)
        context.ctx.delegator.flushWriters()
        return context
    }
}
