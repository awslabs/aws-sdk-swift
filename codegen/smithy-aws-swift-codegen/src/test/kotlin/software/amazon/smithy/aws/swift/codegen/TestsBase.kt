/*
 * Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
 * SPDX-License-Identifier: Apache-2.0.
 */
package software.amazon.smithy.aws.swift.codegen

import org.junit.jupiter.api.Assertions
import software.amazon.smithy.build.MockManifest
import software.amazon.smithy.model.Model
import software.amazon.smithy.model.node.Node
import software.amazon.smithy.model.node.ObjectNode
import java.net.URL

open class TestsBase {

    protected fun createModelFromSmithy(smithyTestResourceName: String): Model {
        return Model.assembler()
                .addImport(getSmithyResource(smithyTestResourceName))
                .discoverModels()
                .assemble()
                .unwrap()
    }

    protected fun getSmithyResource(smithyTestResourceName: String): URL? {
        return TestsBase::class.java.classLoader.getResource("software.amazon.smithy.aws.swift.codegen/$smithyTestResourceName")
    }

    protected fun buildDefaultSwiftSettingsObjectNode(serviceShapeId: String,
                                                      moduleName: String = "Example",
                                                      moduleVersion: String = "1.0.0"): ObjectNode {
        return Node.objectNodeBuilder()
                .withMember("service", Node.from(serviceShapeId))
                .withMember("module", Node.from(moduleName))
                .withMember("moduleVersion", Node.from(moduleVersion))
                .withMember("homepage", Node.from("https://docs.amplify.aws/"))
                .withMember("author", Node.from("Amazon Web Services"))
                .withMember("gitRepo", Node.from("https://github.com/aws-amplify/amplify-codegen.git"))
                .withMember("swiftVersion", Node.from("5.1.0"))
                .build()
    }

    protected fun getModelFileContents(namespace: String, filename: String, manifest: MockManifest): String {
        return manifest.expectFileString("$namespace/models/$filename")
    }

    protected fun getClientFileContents(namespace: String, filename: String, manifest: MockManifest): String {
        return manifest.expectFileString("$namespace/$filename")
    }

    fun String.shouldSyntacticSanityCheck() {
        // sanity check the generated code for matching paranthesis
        var openBraces = 0
        var closedBraces = 0
        var openParens = 0
        var closedParens = 0
        this.forEach {
            when (it) {
                '{' -> openBraces++
                '}' -> closedBraces++
                '(' -> openParens++
                ')' -> closedParens++
            }
        }
        Assertions.assertEquals(openBraces, closedBraces, "unmatched open/closed braces:\n$this")
        Assertions.assertEquals(openParens, closedParens, "unmatched open/close parens:\n$this")
    }
}
