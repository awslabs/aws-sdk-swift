/*
 * Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
 * SPDX-License-Identifier: Apache-2.0.
 */

package software.amazon.smithy.aws.swift.codegen

import io.kotest.matchers.string.shouldContainOnlyOnce
import org.intellij.lang.annotations.Language
import org.junit.jupiter.api.Test
import software.amazon.smithy.aws.reterminus.EndpointRuleset
import software.amazon.smithy.model.node.Node
import software.amazon.smithy.swift.codegen.SwiftWriter

class EndpointParamsGeneratorTests {
    private val ruleset = """ 
        {
          "version": "1.1",
          "serviceId": "minimal",
          "parameters": {
            "Region": {
              "type": "string",
              "builtIn": "AWS::Region",
              "required": true,
              "documentation": "The AWS region to send this request to"
            },
            "DisableHttp": {
              "type": "Boolean",
              "documentation": "Disallow requests from being sent over HTTP"
            },
            "DefaultTrue": {
              "type": "Boolean",
              "builtIn": "AWS::DefaultTrue",
              "required": true,
              "default": true
            }
          },
          "rules": []
        }
    """.toRuleset()

    @Test
    fun `test endpoint param`() {
        val writer = SwiftWriter("testName")
        val endpointParamsGenerator = EndpointParamsGenerator(ruleset)
        endpointParamsGenerator.render(writer)
        val contents = writer.toString()
        val expected = """
            public struct EndpointParams {
                public let defaultTrue: Swift.Bool
                /// Disallow requests from being sent over HTTP
                public let disableHttp: Swift.Bool?
                /// The AWS region to send this request to
                public let region: Swift.String
            
                public init(
                    defaultTrue: Swift.Bool = true,
                    disableHttp: Swift.Bool? = nil,
                    region: Swift.String
                )
                {
                    self.defaultTrue = defaultTrue
                    self.disableHttp = disableHttp
                    self.region = region
                }
            }
        """.trimIndent()
        contents.shouldContainOnlyOnce(expected)
    }
}

@Language("JSON")
fun String.toRuleset(): EndpointRuleset {
    return EndpointRuleset.fromNode(Node.parse(this))
}
