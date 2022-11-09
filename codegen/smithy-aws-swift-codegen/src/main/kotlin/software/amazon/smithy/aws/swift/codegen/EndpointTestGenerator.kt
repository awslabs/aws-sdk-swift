/*
 * Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
 * SPDX-License-Identifier: Apache-2.0.
 */

package software.amazon.smithy.aws.swift.codegen

import software.amazon.smithy.codegen.core.CodegenException
import software.amazon.smithy.model.node.Node
import software.amazon.smithy.rulesengine.language.EndpointRuleSet
import software.amazon.smithy.rulesengine.language.eval.Value
import software.amazon.smithy.rulesengine.traits.EndpointTestsTrait
import software.amazon.smithy.swift.codegen.ClientRuntimeTypes
import software.amazon.smithy.swift.codegen.SwiftDependency
import software.amazon.smithy.swift.codegen.SwiftWriter
import software.amazon.smithy.swift.codegen.integration.ProtocolGenerator
import software.amazon.smithy.swift.codegen.utils.toLowerCamelCase

/**
 * Generates code for EndpointResolver tests.
 */
class EndpointTestGenerator(
    private val endpointTest: EndpointTestsTrait,
    private val endpointRuleSet: EndpointRuleSet?,
    private val ctx: ProtocolGenerator.GenerationContext
) {
    fun render(writer: SwiftWriter): Int {
        if (endpointTest.testCases.isEmpty()) {
            return 0
        }

        writer.addImport(ctx.settings.moduleName, isTestable = true)
        writer.addImport(SwiftDependency.CLIENT_RUNTIME.packageName)
        writer.addImport(AWSSwiftDependency.AWS_CLIENT_RUNTIME.packageName)
        writer.addImport(SwiftDependency.XCTest.target)
        writer.addImport(SwiftDependency.SMITHY_TEST_UTIL.target)

        // used to filter out test params that are not valid
        val endpointParamsMembers = endpointRuleSet?.parameters?.toList()?.map { it.name.name.value }?.toSet() ?: emptySet()

        var count = 0
        writer.openBlock("class EndpointResolverTest: \$L {", "}", ClientRuntimeTypes.Test.CrtXCBaseTestCase) {
            endpointTest.testCases.forEach { testCase ->
                writer.write("/// \$L", testCase.documentation)
                writer.openBlock("func testResolve${++count}() throws {", "}") {
                    writer.openBlock("let endpointParams = \$L(", ")", AWSServiceTypes.EndpointParams) {
                        val applicableParams =
                            testCase.params.members.filter { endpointParamsMembers.contains(it.key.value) }
                                .toSortedMap(compareBy { it.value }).map { (key, value) ->
                                    key to value
                                }

                        applicableParams.forEachIndexed { idx, pair ->
                            writer.writeInline("${pair.first.value.toLowerCamelCase()}: ")
                            val value = Value.fromNode(pair.second)
                            writer.call {
                                generateValue(
                                    writer, value, if (idx < applicableParams.count() - 1) "," else ""
                                )
                            }
                        }
                    }
                    writer.write("let resolver = try \$L()", AWSServiceTypes.DefaultEndpointResolver).write("")

                    testCase.expect.error.ifPresent { error ->
                        writer.openBlock(
                            "XCTAssertThrowsError(try resolver.resolve(params: endpointParams)) { error in", "}"
                        ) {
                            writer.openBlock("switch error {", "}") {
                                writer.dedent().write("case EndpointError.unresolved(let message):")
                                writer.indent().write("XCTAssertEqual(\$S, message)", error)
                                writer.dedent().write("default:")
                                writer.indent().write("XCTFail()")
                            }
                        }
                    }
                    testCase.expect.endpoint.ifPresent { endpoint ->
                        writer.write("let actual = try resolver.resolve(params: endpointParams)").write("")

                        // [String: AnyHashable] can't be constructed from a dictionary literal
                        // first create a string JSON string literal
                        // then convert to [String: AnyHashable] using JSONSerialization.jsonObject(with:)
                        writer.openBlock("let properties: [String: AnyHashable] = ", "") {
                            generateProperties(writer, endpoint.properties)
                        }

                        val reference = if (endpoint.headers.isNotEmpty()) "var" else "let"
                        writer.write("$reference headers = Headers()")
                        endpoint.headers.forEach { (name, values) ->
                            writer.write("headers.add(name: \$S, values: [\$S])", name, values.sorted().joinToString(","))
                        }
                        writer.write(
                            "let expected = try \$L(urlString: \$S, headers: headers, properties: properties)",
                            ClientRuntimeTypes.Core.Endpoint,
                            endpoint.url
                        ).write("")
                        writer.write("XCTAssertEqual(expected, actual)")
                    }
                }
                writer.write("")
            }
        }

        return count
    }

    /**
     * Recursively traverse map of properties and generate JSON string literal.
     */
    private fun generateProperties(writer: SwiftWriter, properties: Map<String, Node>) {
        if (properties.isEmpty()) {
            writer.write("[:]")
        } else {
            writer.openBlock("[", "]") {
                properties.map { it.key to it.value }.forEachIndexed { idx, (first, second) ->
                    val value = Value.fromNode(second)
                    writer.writeInline("\$S: ", first)
                    writer.call {
                        generateValue(writer, value, if (idx < properties.values.count() - 1) "," else "")
                    }
                }
            }
        }
    }

    /**
     * Recursively traverse the value and render a JSON string literal.
     */
    private fun generateValue(writer: SwiftWriter, value: Value, delimeter: String) {
        when (value) {
            is Value.String -> {
                writer.write("\$S$delimeter", value.value())
            }

            is Value.Integer -> {
                writer.write("\$L$delimeter", value.toString())
            }

            is Value.Bool -> {
                writer.write("\$L$delimeter", value.toString())
            }

            is Value.None -> {
                writer.write("nil$delimeter")
            }

            is Value.Array -> {
                writer.openBlock("[", "] as [AnyHashable]$delimeter") {
                    value.values.forEachIndexed { idx, item ->
                        writer.call {
                            generateValue(writer, item, if (idx < value.values.count() - 1) "," else "")
                        }
                    }
                }
            }

            is Value.Record -> {
                if (value.value.isEmpty()) {
                    writer.writeInline("[:]")
                } else {
                    writer.openBlock("[", "] as [String: AnyHashable]$delimeter") {
                        value.value.map { it.key to it.value }.forEachIndexed { idx, (first, second) ->
                            writer.writeInline("\$S: ", first.name)
                            writer.call {
                                generateValue(writer, second, if (idx < value.value.count() - 1) "," else "")
                            }
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
