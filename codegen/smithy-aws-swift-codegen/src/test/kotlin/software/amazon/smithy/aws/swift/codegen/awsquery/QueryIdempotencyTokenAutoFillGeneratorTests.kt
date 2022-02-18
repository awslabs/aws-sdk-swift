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

class QueryIdempotencyTokenAutoFillGeneratorTests {

    @Test
    fun `001 hardcodes action and version into input type`() {
        val context = setupTests("awsquery/query-idempotency-token.smithy", "aws.protocoltests.query#AwsQuery")
        val contents = getFileContents(context.manifest, "/Example/models/QueryIdempotencyTokenAutoFillInput+Encodable.swift")
        contents.shouldSyntacticSanityCheck()
        val expectedContents =
            """
            extension QueryIdempotencyTokenAutoFillInput: Swift.Encodable {
                public func encode(to encoder: Swift.Encoder) throws {
                    var container = encoder.container(keyedBy: ClientRuntime.Key.self)
                    if let token = token {
                        try container.encode(token, forKey: ClientRuntime.Key("token"))
                    }
                    try container.encode("QueryIdempotencyTokenAutoFill", forKey:ClientRuntime.Key("Action"))
                    try container.encode("2020-01-08", forKey:ClientRuntime.Key("Version"))
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
