/*
 * Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
 * SPDX-License-Identifier: Apache-2.0.
 */

package software.amazon.smithy.aws.swift.codegen

import software.amazon.smithy.aws.reterminus.EndpointRuleset
import software.amazon.smithy.aws.reterminus.eval.Value
import software.amazon.smithy.codegen.core.CodegenException
import software.amazon.smithy.model.node.Node
import software.amazon.smithy.rulesengine.traits.EndpointTestsTrait
import software.amazon.smithy.swift.codegen.SwiftDependency
import software.amazon.smithy.swift.codegen.SwiftWriter
import software.amazon.smithy.swift.codegen.integration.ProtocolGenerator
import software.amazon.smithy.swift.codegen.utils.toCamelCase

/**
 * Generates code for EndpointResolver tests.
 */
class EndpointTestGenerator(
    private val endpointTest: EndpointTestsTrait,
    private val endpointRuleSet: EndpointRuleset?,
    private val ctx: ProtocolGenerator.GenerationContext
) {
    fun render(writer: SwiftWriter) {
        if (endpointTest.testCases.isEmpty()) {
            return
        }

        writer.addImport(ctx.settings.moduleName, isTestable = true)
        writer.addImport(SwiftDependency.CLIENT_RUNTIME.packageName)
        writer.addImport(SwiftDependency.XCTest.target)

        // used to filter out test params that are not valid
        val endpointParamsMembers = endpointRuleSet?.parameters?.toList()?.map { it.name.name.value }?.toSet() ?: emptySet()

        writer.openBlock("class EndpointResolverTest: XCTestCase {", "}") {
            endpointTest.testCases.forEachIndexed { idx, testCase ->
                writer.write("/// \$L", testCase.documentation)
                writer.openBlock("func testResolve$idx() throws {", "}") {
                    writer.openBlock("let endpointParams = EndpointParams(", ")") {
                        val applicableParams =
                            testCase.params.members.filter { endpointParamsMembers.contains(it.key.value) }
                                .toSortedMap(compareBy { it.value }).map { (key, value) ->
                                    key to value
                                }

                        applicableParams.forEachIndexed { idx, pair ->
                            writer.writeInline("${pair.first.value.toCamelCase()}: ")
                            val value = Value.fromNode(pair.second)
                            writer.call {
                                generateValue(
                                    writer, value, if (idx < applicableParams.count() - 1) "," else ""
                                )
                            }
                        }
                    }
                    writer.write("let resolver = DefaultEndpointResolver()").write("")

                    testCase.expect.error.ifPresent { error ->
                        writer.openBlock(
                            "XCTAssertThrowsError(try resolver.resolve(params: endpointParams)) { error in", "}"
                        ) {
                            writer.write("XCTAssertEqual(\$S, error.localizedDescription)", error)
                        }
                    }
                    testCase.expect.endpoint.ifPresent { endpoint ->
                        writer.write("let actual = try resolver.resolve(params: endpointParams)").write("")

                        // [String: AnyHashable] can't be constructed from a dictionary literal
                        // first create a string JSON string literal
                        // then convert to [String: AnyHashable] using JSONSerialization.jsonObject(with:)
                        writer.openBlock("let props = \"\"\"", "\"\"\"") {
                            generateProperties(writer, endpoint.properties)
                        }
                        writer.write("let properties = try JSONSerialization.jsonObject(with: props.data(using: .utf8)!) as! [String: AnyHashable]\n")

                        writer.write("let headers = Headers()")
                        endpoint.headers.forEach { (name, value) ->
                            writer.write("headers.add(name: \$S, values: \$S)", name, value)
                        }
                        writer.write(
                            "let expected = try Endpoint(urlString: \$S, headers: headers, properties: properties)",
                            endpoint.url
                        ).write("")
                        writer.write("XCTAssertEqual(expected, actual)")
                    }
                }
                writer.write("")
            }
        }
    }

    /**
     * Recursively traverse map of properties and generate JSON string literal.
     */
    private fun generateProperties(writer: SwiftWriter, properties: Map<String, Node>) {
        writer.openBlock("{", "}") {
            properties.map { it.key to it.value }.forEachIndexed { idx, (first, second) ->
                val value = Value.fromNode(second)
                writer.writeInline("\$S: ", first)
                writer.call {
                    generateValue(writer, value, if (idx < properties.values.count() - 1) "," else "")
                }
            }
        }
    }

    /**
     * Recursively traverse the value and render a JSON string literal.
     */
    private fun generateValue(writer: SwiftWriter, value: Value, delimeter: String) {
        when (value) {
            is Value.Str -> {
                writer.write("\$S$delimeter", value.value())
            }

            is Value.Int -> {
                writer.write("\$L$delimeter", value.toString())
            }

            is Value.Bool -> {
                writer.write("\$L$delimeter", value.toString())
            }

            is Value.None -> {
                writer.write("nil$delimeter")
            }

            is Value.Array -> {
                writer.openBlock("[", "]") {
                    value.values.forEachIndexed { idx, item ->
                        writer.call {
                            generateValue(writer, item, if (idx < value.values.count() - 1) "," else "")
                        }
                    }
                }
            }

            is Value.Record -> {
                writer.openBlock("{", "}") {
                    value.value.map { it.key to it.value }.forEachIndexed { idx, (first, second) ->
                        writer.writeInline("\$S: ", first.name)
                        writer.call {
                            generateValue(writer, second, if (idx < value.value.count() - 1) "," else "")
                        }
                    }
                }
            }

            else -> {
                throw CodegenException("Unsupported value type: $value")
            }
        }
    }
}
