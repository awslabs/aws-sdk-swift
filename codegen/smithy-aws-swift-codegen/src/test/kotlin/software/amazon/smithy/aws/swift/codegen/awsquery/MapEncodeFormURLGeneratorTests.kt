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

class MapEncodeFormURLGeneratorTests {

    @Test
    fun `001 encode different types of maps`() {
        val context = setupTests("awsquery/query-maps.smithy", "aws.protocoltests.query#AwsQuery")
        val contents = getFileContents(context.manifest, "/Example/models/QueryMapsInput+Encodable.swift")
        contents.shouldSyntacticSanityCheck()
        val expectedContents =
            """
            extension QueryMapsInput: Swift.Encodable {
                public func encode(to encoder: Swift.Encoder) throws {
                    var container = encoder.container(keyedBy: ClientRuntime.Key.self)
                    if let complexMapArg = complexMapArg {
                        var complexMapArgContainer = container.nestedContainer(keyedBy: ClientRuntime.Key.self, forKey: ClientRuntime.Key("ComplexMapArg"))
                        for (index0, element0) in complexMapArg.sorted(by: { ${'$'}0.key < ${'$'}1.key }).enumerated() {
                            let stringKey0 = element0.key
                            let greetingstructValue0 = element0.value
                            var entryContainer0 = complexMapArgContainer.nestedContainer(keyedBy: ClientRuntime.Key.self, forKey: ClientRuntime.Key("entry.\(index0.advanced(by: 1))"))
                            var keyContainer0 = entryContainer0.nestedContainer(keyedBy: ClientRuntime.Key.self, forKey: ClientRuntime.Key("key"))
                            try keyContainer0.encode(stringKey0, forKey: ClientRuntime.Key(""))
                            var valueContainer0 = entryContainer0.nestedContainer(keyedBy: ClientRuntime.Key.self, forKey: ClientRuntime.Key("value"))
                            try valueContainer0.encode(greetingstructValue0, forKey: ClientRuntime.Key(""))
                        }
                    }
                    if let flattenedMap = flattenedMap {
                        if !flattenedMap.isEmpty {
                            for (index0, element0) in flattenedMap.sorted(by: { ${'$'}0.key < ${'$'}1.key }).enumerated() {
                                let stringKey0 = element0.key
                                let stringValue0 = element0.value
                                var nestedContainer0 = container.nestedContainer(keyedBy: ClientRuntime.Key.self, forKey: ClientRuntime.Key("FlattenedMap.\(index0.advanced(by: 1))"))
                                var keyContainer0 = nestedContainer0.nestedContainer(keyedBy: ClientRuntime.Key.self, forKey: ClientRuntime.Key("key"))
                                try keyContainer0.encode(stringKey0, forKey: ClientRuntime.Key(""))
                                var valueContainer0 = nestedContainer0.nestedContainer(keyedBy: ClientRuntime.Key.self, forKey: ClientRuntime.Key("value"))
                                try valueContainer0.encode(stringValue0, forKey: ClientRuntime.Key(""))
                            }
                        }
                    }
                    if let flattenedMapWithXmlName = flattenedMapWithXmlName {
                        if !flattenedMapWithXmlName.isEmpty {
                            for (index0, element0) in flattenedMapWithXmlName.sorted(by: { ${'$'}0.key < ${'$'}1.key }).enumerated() {
                                let stringKey0 = element0.key
                                let stringValue0 = element0.value
                                var nestedContainer0 = container.nestedContainer(keyedBy: ClientRuntime.Key.self, forKey: ClientRuntime.Key("Hi.\(index0.advanced(by: 1))"))
                                var keyContainer0 = nestedContainer0.nestedContainer(keyedBy: ClientRuntime.Key.self, forKey: ClientRuntime.Key("K"))
                                try keyContainer0.encode(stringKey0, forKey: ClientRuntime.Key(""))
                                var valueContainer0 = nestedContainer0.nestedContainer(keyedBy: ClientRuntime.Key.self, forKey: ClientRuntime.Key("V"))
                                try valueContainer0.encode(stringValue0, forKey: ClientRuntime.Key(""))
                            }
                        }
                    }
                    if let mapArg = mapArg {
                        var mapArgContainer = container.nestedContainer(keyedBy: ClientRuntime.Key.self, forKey: ClientRuntime.Key("MapArg"))
                        for (index0, element0) in mapArg.sorted(by: { ${'$'}0.key < ${'$'}1.key }).enumerated() {
                            let stringKey0 = element0.key
                            let stringValue0 = element0.value
                            var entryContainer0 = mapArgContainer.nestedContainer(keyedBy: ClientRuntime.Key.self, forKey: ClientRuntime.Key("entry.\(index0.advanced(by: 1))"))
                            var keyContainer0 = entryContainer0.nestedContainer(keyedBy: ClientRuntime.Key.self, forKey: ClientRuntime.Key("key"))
                            try keyContainer0.encode(stringKey0, forKey: ClientRuntime.Key(""))
                            var valueContainer0 = entryContainer0.nestedContainer(keyedBy: ClientRuntime.Key.self, forKey: ClientRuntime.Key("value"))
                            try valueContainer0.encode(stringValue0, forKey: ClientRuntime.Key(""))
                        }
                    }
                    if let mapOfLists = mapOfLists {
                        var mapOfListsContainer = container.nestedContainer(keyedBy: ClientRuntime.Key.self, forKey: ClientRuntime.Key("MapOfLists"))
                        for (index0, element0) in mapOfLists.sorted(by: { ${'$'}0.key < ${'$'}1.key }).enumerated() {
                            let stringKey0 = element0.key
                            let stringlistValue0 = element0.value
                            var entryContainer0 = mapOfListsContainer.nestedContainer(keyedBy: ClientRuntime.Key.self, forKey: ClientRuntime.Key("entry.\(index0.advanced(by: 1))"))
                            var keyContainer0 = entryContainer0.nestedContainer(keyedBy: ClientRuntime.Key.self, forKey: ClientRuntime.Key("key"))
                            try keyContainer0.encode(stringKey0, forKey: ClientRuntime.Key(""))
                            var valueContainer1 = entryContainer0.nestedContainer(keyedBy: ClientRuntime.Key.self, forKey: ClientRuntime.Key("value"))
                            for (index1, string1) in stringlistValue0.enumerated() {
                                try valueContainer1.encode(string1, forKey: ClientRuntime.Key("member.\(index1.advanced(by: 1))"))
                            }
                        }
                    }
                    if let mapWithXmlMemberName = mapWithXmlMemberName {
                        var mapWithXmlMemberNameContainer = container.nestedContainer(keyedBy: ClientRuntime.Key.self, forKey: ClientRuntime.Key("MapWithXmlMemberName"))
                        for (index0, element0) in mapWithXmlMemberName.sorted(by: { ${'$'}0.key < ${'$'}1.key }).enumerated() {
                            let stringKey0 = element0.key
                            let stringValue0 = element0.value
                            var entryContainer0 = mapWithXmlMemberNameContainer.nestedContainer(keyedBy: ClientRuntime.Key.self, forKey: ClientRuntime.Key("entry.\(index0.advanced(by: 1))"))
                            var keyContainer0 = entryContainer0.nestedContainer(keyedBy: ClientRuntime.Key.self, forKey: ClientRuntime.Key("K"))
                            try keyContainer0.encode(stringKey0, forKey: ClientRuntime.Key(""))
                            var valueContainer0 = entryContainer0.nestedContainer(keyedBy: ClientRuntime.Key.self, forKey: ClientRuntime.Key("V"))
                            try valueContainer0.encode(stringValue0, forKey: ClientRuntime.Key(""))
                        }
                    }
                    if let renamedMapArg = renamedMapArg {
                        var renamedMapArgContainer = container.nestedContainer(keyedBy: ClientRuntime.Key.self, forKey: ClientRuntime.Key("Foo"))
                        for (index0, element0) in renamedMapArg.sorted(by: { ${'$'}0.key < ${'$'}1.key }).enumerated() {
                            let stringKey0 = element0.key
                            let stringValue0 = element0.value
                            var entryContainer0 = renamedMapArgContainer.nestedContainer(keyedBy: ClientRuntime.Key.self, forKey: ClientRuntime.Key("entry.\(index0.advanced(by: 1))"))
                            var keyContainer0 = entryContainer0.nestedContainer(keyedBy: ClientRuntime.Key.self, forKey: ClientRuntime.Key("key"))
                            try keyContainer0.encode(stringKey0, forKey: ClientRuntime.Key(""))
                            var valueContainer0 = entryContainer0.nestedContainer(keyedBy: ClientRuntime.Key.self, forKey: ClientRuntime.Key("value"))
                            try valueContainer0.encode(stringValue0, forKey: ClientRuntime.Key(""))
                        }
                    }
                    try container.encode("QueryMaps", forKey:ClientRuntime.Key("Action"))
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
