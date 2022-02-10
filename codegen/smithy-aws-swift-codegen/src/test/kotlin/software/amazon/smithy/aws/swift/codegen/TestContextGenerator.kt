/*
 * Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
 * SPDX-License-Identifier: Apache-2.0.
 */

package software.amazon.smithy.aws.swift.codegen

import org.junit.jupiter.api.Assertions
import software.amazon.smithy.build.MockManifest
import software.amazon.smithy.build.PluginContext
import software.amazon.smithy.model.Model
import software.amazon.smithy.model.node.Node
import software.amazon.smithy.model.node.ObjectNode
import software.amazon.smithy.model.shapes.ShapeId
import software.amazon.smithy.model.validation.ValidatedResultException
import software.amazon.smithy.swift.codegen.SwiftCodegenPlugin
import software.amazon.smithy.swift.codegen.SwiftDelegator
import software.amazon.smithy.swift.codegen.SwiftSettings
import software.amazon.smithy.swift.codegen.integration.ProtocolGenerator
import software.amazon.smithy.swift.codegen.integration.SwiftIntegration
import software.amazon.smithy.swift.codegen.model.AddOperationShapes
import java.net.URL

data class TestContext(
    val ctx: ProtocolGenerator.GenerationContext,
    val manifest: MockManifest
)

class TestContextGenerator {
    companion object {
        fun initContextFrom(modelFile: String, serviceShapeIdWithNamespace: String, protocol: ShapeId, rootPackageNamespace: String, sdkId: String): TestContext {

            val manifest = MockManifest()
            var model = createModelFromSmithy(modelFile)

            val service = model.getShape(ShapeId.from(serviceShapeIdWithNamespace)).get().asServiceShape().get()
            val settings = buildDefaultSwiftSettingsObjectNode(serviceShapeIdWithNamespace)
            val swiftSettings = SwiftSettings.from(model, settings)
            model = AddOperationShapes.execute(model, swiftSettings.getService(model), swiftSettings.moduleName)

            val pluginContext = PluginContext.builder()
                .model(model)
                .fileManifest(manifest)
                .settings(settings)
                .build()
            SwiftCodegenPlugin().execute(pluginContext)

            val integrations = mutableListOf<SwiftIntegration>()
            val provider = SwiftCodegenPlugin.createSymbolProvider(model, swiftSettings)
            val delegator = SwiftDelegator(swiftSettings, model, manifest, provider, integrations)
            val ctx = ProtocolGenerator.GenerationContext(swiftSettings, model, service, provider, integrations, protocol, delegator)
            return TestContext(ctx, manifest)
        }

        fun createModelFromSmithy(smithyTestResourceName: String): Model {
            return Model.assembler()
                .addImport(getSmithyResource(smithyTestResourceName))
                .discoverModels()
                .assemble()
                .unwrap()
        }

        fun getSmithyResource(smithyTestResourceName: String): URL? {
            return TestContextGenerator::class.java.classLoader.getResource("software.amazon.smithy.aws.swift.codegen/$smithyTestResourceName")
        }

        fun buildDefaultSwiftSettingsObjectNode(
            serviceShapeId: String,
            moduleName: String = "Example",
            moduleVersion: String = "1.0.0"
        ): ObjectNode {
            return Node.objectNodeBuilder()
                .withMember("service", Node.from(serviceShapeId))
                .withMember("module", Node.from(moduleName))
                .withMember("moduleVersion", Node.from(moduleVersion))
                .withMember("homepage", Node.from("https://docs.amplify.aws/"))
                .withMember("author", Node.from("Amazon Web Services"))
                .withMember("gitRepo", Node.from("https://github.com/awslabs/aws-sdk-swift.git"))
                .withMember("swiftVersion", Node.from("5.5.0"))
                .build()
        }
        fun listFilesFromManifest(manifest: MockManifest): String {
            var listFiles = StringBuilder()
            for (file in manifest.files) {
                listFiles.append("${file}\n")
            }
            return listFiles.toString()
        }

        fun getModelFileContents(namespace: String, filename: String, manifest: MockManifest): String {
            return getFileContents(manifest, "$namespace/models/$filename")
        }
        fun getClientFileContents(namespace: String, filename: String, manifest: MockManifest): String {
            return getFileContents(manifest, "$namespace/$filename")
        }
        fun getFileContents(manifest: MockManifest, fileName: String): String {
            return manifest.expectFileString(fileName)
        }
    }
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

/**
 * Load and initialize a model from a String
 */
fun String.toSmithyModel(sourceLocation: String? = null, serviceShapeId: String? = null): Model {
    val processed = if (this.trimStart().startsWith("\$version")) this else "\$version: \"1.0\"\n$this"
    val model = try {
        Model.assembler()
            .discoverModels()
            .addUnparsedModel(sourceLocation ?: "test.smithy", processed)
            .assemble()
            .unwrap()
    } catch (e: ValidatedResultException) {
        System.err.println("Model failed to parse:")
        System.err.println(this)
        throw e
    }
    return model
}
