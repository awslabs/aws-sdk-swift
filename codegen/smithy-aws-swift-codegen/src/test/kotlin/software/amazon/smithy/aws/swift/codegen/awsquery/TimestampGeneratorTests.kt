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
import software.amazon.smithy.aws.swift.codegen.shouldSyntacticSanityCheck
import software.amazon.smithy.aws.traits.protocols.AwsQueryTrait

class TimestampGeneratorTests {

    @Test
    fun `001 encode timestamps`() {
        val context = setupTests("awsquery/query-timestamp.smithy", "aws.protocoltests.query#AwsQuery")
        val contents = getFileContents(context.manifest, "/Example/models/QueryTimestampsInput+Encodable.swift")
        contents.shouldSyntacticSanityCheck()
        val expectedContents =
            """
            extension QueryTimestampsInput: Swift.Encodable, Runtime.Reflection {
                public func encode(to encoder: Swift.Encoder) throws {
                    var container = encoder.container(keyedBy: Runtime.Key.self)
                    if let epochMember = epochMember {
                        try container.encode(Runtime.TimestampWrapper(epochMember, format: .epochSeconds), forKey: Runtime.Key("epochMember"))
                    }
                    if let epochTarget = epochTarget {
                        try container.encode(Runtime.TimestampWrapper(epochTarget, format: .epochSeconds), forKey: Runtime.Key("epochTarget"))
                    }
                    if let normalFormat = normalFormat {
                        try container.encode(Runtime.TimestampWrapper(normalFormat, format: .dateTime), forKey: Runtime.Key("normalFormat"))
                    }
                    try container.encode("QueryTimestamps", forKey:Runtime.Key("Action"))
                    try container.encode("2020-01-08", forKey:Runtime.Key("Version"))
                }
            }
            """.trimIndent()
        contents.shouldContainOnlyOnce(expectedContents)
    }

    private fun setupTests(smithyFile: String, serviceShapeId: String): TestContext {
        val context =
            TestContextGenerator.initContextFrom(smithyFile, serviceShapeId, AwsQueryTrait.ID, "awsquery", "awsquery")
        val generator = AwsQueryProtocolGenerator()
        generator.generateCodableConformanceForNestedTypes(context.ctx)
        generator.generateSerializers(context.ctx)
        context.ctx.delegator.flushWriters()
        return context
    }
}
