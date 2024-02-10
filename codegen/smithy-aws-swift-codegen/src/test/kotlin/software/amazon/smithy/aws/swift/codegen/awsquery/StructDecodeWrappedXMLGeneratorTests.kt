/*
 * Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
 * SPDX-License-Identifier: Apache-2.0.
 */

package software.amazon.smithy.aws.swift.codegen.awsquery

import io.kotest.matchers.string.shouldContainOnlyOnce
import org.junit.jupiter.api.Test
import software.amazon.smithy.aws.swift.codegen.TestContext
import software.amazon.smithy.aws.swift.codegen.TestContextGenerator
import software.amazon.smithy.aws.swift.codegen.TestContextGenerator.Companion.getFileContents
import software.amazon.smithy.aws.traits.protocols.AwsQueryTrait

class StructDecodeWrappedXMLGeneratorTests {

    @Test
    fun `wrapped map decodable`() {
        val context = setupTests("awsquery/flattened-map.smithy", "aws.protocoltests.query#AwsQuery")
        val contents = getFileContents(context.manifest, "/Example/models/FlattenedXmlMapOutput+HttpResponseBinding.swift")
        val expectedContents = """
extension FlattenedXmlMapOutput {

    static var httpBinding: ClientRuntime.HTTPResponseOutputBinding<FlattenedXmlMapOutput, SmithyXML.Reader> {
        { httpResponse, responseDocumentClosure in
            let responseReader = try await responseDocumentClosure(httpResponse)
            let reader = responseReader["FlattenedXmlMapResult"]
            var value = FlattenedXmlMapOutput()
            value.myMap = try reader["myMap"].readMapIfPresent(valueReadingClosure: Swift.String.readingClosure, keyNodeInfo: "key", valueNodeInfo: "value", isFlattened: true)
            return value
        }
    }
}
"""
        contents.shouldContainOnlyOnce(expectedContents)
    }

    private fun setupTests(smithyFile: String, serviceShapeId: String): TestContext {
        val context =
            TestContextGenerator.initContextFrom(smithyFile, serviceShapeId, AwsQueryTrait.ID)
        val generator = AwsQueryProtocolGenerator()
        generator.generateCodableConformanceForNestedTypes(context.ctx)
        generator.generateDeserializers(context.ctx)
        context.ctx.delegator.flushWriters()
        return context
    }
}
