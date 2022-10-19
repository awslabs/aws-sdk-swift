/*
 * Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
 * SPDX-License-Identifier: Apache-2.0.
 */

package software.amazon.smithy.aws.swift.codegen

import io.kotest.matchers.string.shouldContainOnlyOnce
import org.intellij.lang.annotations.Language
import org.junit.jupiter.api.Test
import software.amazon.smithy.model.node.Node
import software.amazon.smithy.rulesengine.language.EndpointRuleSet
import software.amazon.smithy.rulesengine.traits.EndpointRuleSetTrait
import software.amazon.smithy.swift.codegen.SwiftWriter
import software.amazon.smithy.swift.codegen.model.getTrait

class EndpointParamsGeneratorTests {
    @Test
    fun `test endpoint param from Smithy JSON`() {
        val ruleset = """ 
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

    @Test
    fun `test endpoint params from Smithy IDL`() {
        val writer = SwiftWriter("testName")
        val context = setupGenerationContext("endpoints.smithy", "smithy.example#ExampleService")
        var ruleSetNode = context.service.getTrait<EndpointRuleSetTrait>()!!.ruleSet
        val endpointParamsGenerator = EndpointParamsGenerator(EndpointRuleSet.fromNode(ruleSetNode))
        endpointParamsGenerator.render(writer)
        val contents = writer.toString()
        val expected = """
        public struct EndpointParams {
            public let boolBar: Swift.Bool?
            public let boolBaz: Swift.String?
            public let boolFoo: Swift.Bool
            public let endpoint: Swift.String?
            public let region: Swift.String
            public let stringBar: Swift.String?
            public let stringBaz: Swift.String?
            public let stringFoo: Swift.String?
        
            public init(
                boolBar: Swift.Bool? = nil,
                boolBaz: Swift.String? = nil,
                boolFoo: Swift.Bool,
                endpoint: Swift.String? = nil,
                region: Swift.String,
                stringBar: Swift.String? = nil,
                stringBaz: Swift.String? = nil,
                stringFoo: Swift.String? = nil
            )
            {
                self.boolBar = boolBar
                self.boolBaz = boolBaz
                self.boolFoo = boolFoo
                self.endpoint = endpoint
                self.region = region
                self.stringBar = stringBar
                self.stringBaz = stringBaz
                self.stringFoo = stringFoo
            }
        }
        """.trimIndent()
        contents.shouldContainOnlyOnce(expected)
    }
}

@Language("JSON")
fun String.toRuleset(): EndpointRuleSet {
    return EndpointRuleSet.fromNode(Node.parse(this))
}
