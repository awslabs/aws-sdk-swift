/*
 * Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
 * SPDX-License-Identifier: Apache-2.0.
 */

package software.amazon.smithy.aws.swift.codegen.awsquery

import io.kotest.matchers.string.shouldContainOnlyOnce
import org.junit.jupiter.api.Test
import software.amazon.smithy.aws.swift.codegen.TestContext
import software.amazon.smithy.aws.swift.codegen.TestContextGenerator.Companion.getFileContents
import software.amazon.smithy.aws.swift.codegen.TestContextGenerator.Companion.initContextFrom
import software.amazon.smithy.aws.swift.codegen.shouldSyntacticSanityCheck
import software.amazon.smithy.aws.traits.protocols.AwsQueryTrait

class BlobEncodeGeneratorTests {
    @Test
    fun `001 encode blobs`() {
        val context = setupTests("awsquery/query-blobs.smithy", "aws.protocoltests.query#AwsQuery")
        val contents = getFileContents(context.manifest, "/Example/models/BlobInputParamsInput+Encodable.swift")
        contents.shouldSyntacticSanityCheck()
        val expectedContents =
            """
            extension BlobInputParamsInput: Swift.Encodable {
                public func encode(to encoder: Swift.Encoder) throws {
                    var container = encoder.container(keyedBy: ClientRuntime.Key.self)
                    if let blobList = blobList {
                        var blobListContainer = container.nestedContainer(keyedBy: ClientRuntime.Key.self, forKey: ClientRuntime.Key("BlobList"))
                        for (index0, blob0) in blobList.enumerated() {
                            try blobListContainer.encode(blob0.base64EncodedString(), forKey: ClientRuntime.Key("member.\(index0.advanced(by: 1))"))
                        }
                    }
                    if let blobListFlattened = blobListFlattened {
                        if !blobListFlattened.isEmpty {
                            for (index0, blob0) in blobListFlattened.enumerated() {
                                try container.encode(blob0.base64EncodedString(), forKey: ClientRuntime.Key("BlobListFlattened.\(index0.advanced(by: 1))"))
                            }
                        }
                    }
                    if let blobMap = blobMap {
                        var blobMapContainer = container.nestedContainer(keyedBy: ClientRuntime.Key.self, forKey: ClientRuntime.Key("BlobMap"))
                        for (index0, element0) in blobMap.sorted(by: { ${'$'}0.key < ${'$'}1.key }).enumerated() {
                            let stringKey0 = element0.key
                            let blobValue0 = element0.value
                            var entryContainer0 = blobMapContainer.nestedContainer(keyedBy: ClientRuntime.Key.self, forKey: ClientRuntime.Key("entry.\(index0.advanced(by: 1))"))
                            var keyContainer0 = entryContainer0.nestedContainer(keyedBy: ClientRuntime.Key.self, forKey: ClientRuntime.Key("key"))
                            try keyContainer0.encode(stringKey0, forKey: ClientRuntime.Key(""))
                            var valueContainer0 = entryContainer0.nestedContainer(keyedBy: ClientRuntime.Key.self, forKey: ClientRuntime.Key("value"))
                            try valueContainer0.encode(blobValue0.base64EncodedString(), forKey: ClientRuntime.Key(""))
                        }
                    }
                    if let blobMapFlattened = blobMapFlattened {
                        if !blobMapFlattened.isEmpty {
                            for (index0, element0) in blobMapFlattened.sorted(by: { ${'$'}0.key < ${'$'}1.key }).enumerated() {
                                let stringKey0 = element0.key
                                let blobValue0 = element0.value
                                var nestedContainer0 = container.nestedContainer(keyedBy: ClientRuntime.Key.self, forKey: ClientRuntime.Key("BlobMapFlattened.\(index0.advanced(by: 1))"))
                                var keyContainer0 = nestedContainer0.nestedContainer(keyedBy: ClientRuntime.Key.self, forKey: ClientRuntime.Key("key"))
                                try keyContainer0.encode(stringKey0, forKey: ClientRuntime.Key(""))
                                var valueContainer0 = nestedContainer0.nestedContainer(keyedBy: ClientRuntime.Key.self, forKey: ClientRuntime.Key("value"))
                                try valueContainer0.encode(blobValue0.base64EncodedString(), forKey: ClientRuntime.Key(""))
                            }
                        }
                    }
                    if let blobMember = blobMember {
                        try container.encode(blobMember.base64EncodedString(), forKey: ClientRuntime.Key("BlobMember"))
                    }
                    try container.encode("BlobInputParams", forKey:ClientRuntime.Key("Action"))
                    try container.encode("2020-01-08", forKey:ClientRuntime.Key("Version"))
                }
            }
            """.trimIndent()
        contents.shouldContainOnlyOnce(expectedContents)
    }

    private fun setupTests(smithyFile: String, serviceShapeId: String): TestContext {
        val context = initContextFrom(smithyFile, serviceShapeId, AwsQueryTrait.ID, "awsquery", "awsquery")
        val generator = AwsQueryProtocolGenerator()
        generator.generateCodableConformanceForNestedTypes(context.ctx)
        generator.generateSerializers(context.ctx)
        generator.generateDeserializers(context.ctx)
        context.ctx.delegator.flushWriters()
        return context
    }
}
