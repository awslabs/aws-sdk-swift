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
        val contents = getFileContents(context.manifest, "/Example/models/FlattenedXmlMapOutputResponseBody+Decodable.swift")
        val expectedContents = """
        struct FlattenedXmlMapOutputResponseBody: Swift.Equatable {
            let myMap: [Swift.String:Swift.String]?
        }
        
        extension FlattenedXmlMapOutputResponseBody: Swift.Decodable {
            enum CodingKeys: Swift.String, Swift.CodingKey {
                case myMap
            }
        
            public init (from decoder: Swift.Decoder) throws {
                let topLevelContainer = try decoder.container(keyedBy: ClientRuntime.Key.self)
                let containerValues = try topLevelContainer.nestedContainer(keyedBy: CodingKeys.self, forKey: ClientRuntime.Key("FlattenedXmlMapResult"))
                if containerValues.contains(.myMap) {
                    struct KeyVal0{struct key{}; struct value{}}
                    let myMapWrappedContainer = containerValues.nestedContainerNonThrowable(keyedBy: ClientRuntime.MapEntry<Swift.String, Swift.String, KeyVal0.key, KeyVal0.value>.CodingKeys.self, forKey: .myMap)
                    if myMapWrappedContainer != nil {
                        let myMapContainer = try containerValues.decodeIfPresent([ClientRuntime.MapKeyValue<Swift.String, Swift.String, KeyVal0.key, KeyVal0.value>].self, forKey: .myMap)
                        var myMapBuffer: [Swift.String:Swift.String]? = nil
                        if let myMapContainer = myMapContainer {
                            myMapBuffer = [Swift.String:Swift.String]()
                            for stringContainer0 in myMapContainer {
                                myMapBuffer?[stringContainer0.key] = stringContainer0.value
                            }
                        }
                        myMap = myMapBuffer
                    } else {
                        myMap = [:]
                    }
                } else {
                    myMap = nil
                }
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
        generator.generateDeserializers(context.ctx)
        context.ctx.delegator.flushWriters()
        return context
    }
}
