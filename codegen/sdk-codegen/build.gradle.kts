/*
 * Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
 * SPDX-License-Identifier: Apache-2.0.
 */

// This build file has been adapted from the Go v2 SDK, here:
// https://github.com/aws/aws-sdk-go-v2/blob/master/codegen/sdk-codegen/build.gradle.kts

import software.amazon.smithy.model.Model
import software.amazon.smithy.model.node.Node
import software.amazon.smithy.model.node.ObjectNode
import software.amazon.smithy.model.shapes.ServiceShape
import software.amazon.smithy.gradle.tasks.SmithyBuild
import kotlin.streams.toList
import java.util.Properties

plugins {
    id("software.amazon.smithy") version "0.5.2"
}

dependencies {
    implementation(project(":smithy-aws-swift-codegen"))
}

// This project doesn't produce a JAR.
tasks["jar"].enabled = false

// Run the SmithyBuild task manually since this project needs the built JAR
tasks["smithyBuildJar"].enabled = false

tasks.create<SmithyBuild>("buildSdk") {
    addRuntimeClasspath = true
}

// force rebuild every time while developing
tasks["buildSdk"].outputs.upToDateWhen { false }

// get a project property by name if it exists (including from local.properties)
fun getProperty(name: String): String? {
    if (project.hasProperty(name)) {
        return project.properties[name].toString()
    }

    val localProperties = Properties()
    val propertiesFile: File = rootProject.file("local.properties")
    if (propertiesFile.exists()) {
        propertiesFile.inputStream().use { localProperties.load(it) }
        if (localProperties.containsKey(name)) {
            return localProperties[name].toString()
        }
    }
    return null
}

fun ObjectNode.Builder.call(block: ObjectNode.Builder.() -> Unit): ObjectNode.Builder = apply(block)

// Generates a smithy-build.json file by creating a new projection for every
// JSON model file found in aws-models/. The generated smithy-build.json file is
// not committed to git since it's rebuilt each time codegen is performed.
tasks.register("generate-smithy-build") {
    doLast {
        val projectionsBuilder = Node.objectNodeBuilder()
        val modelsDirProp: String by project
        val modelsDir = project.file(modelsDirProp)
        val models = fileTree(modelsDir).filter { it.isFile }.files.toMutableSet()
        val onlyIncludeModels = getProperty("onlyIncludeModels")
        val excludeModels = getProperty("excludeModels")
        var filteredModels = models
        onlyIncludeModels?.let {
            val modelsToInclude = it.split(",").map { "$it.json" }.map { it.trim() }
            filteredModels = models.filter { modelsToInclude.contains(it.name) }.toMutableSet()
        }
        // If a model is specified in both onlyIncludeModels and excludeModels, it is excluded.
        excludeModels?.let {
            val modelsToExclude = it.split(",").map { "$it.json" }.map { it.trim() }
            filteredModels = filteredModels.filterNot { modelsToExclude.contains(it.name) }.toMutableSet()
        }

        filteredModels.forEach { file ->
            val model = Model.assembler()
                    .addImport(file.absolutePath)
                    // Grab the result directly rather than worrying about checking for errors via unwrap.
                    // All we care about here is the service shape, any unchecked errors will be exposed
                    // as part of the actual build task done by the smithy gradle plugin.
                    .assemble().result.get()
            val services = model.shapes(ServiceShape::class.javaObjectType).sorted().toList()
            if (services.size != 1) {
                throw Exception("There must be exactly one service in each aws model file, but found " +
                        "${services.size} in ${file.name}: ${services.map { it.id }}")
            }
            val service = services[0]
            var (sdkId, version, _) = file.name.split(".")
            sdkId = sdkId.replace("-", "").toLowerCase()
            val projectionContents = Node.objectNodeBuilder()
                    .withMember("imports", Node.fromStrings("${modelsDir.absolutePath}${File.separator}${file.name}"))
                    .withMember("plugins", Node.objectNode()
                            .withMember("swift-codegen",
                                    Node.objectNodeBuilder()
                                            .withMember("service", Node.from(service.id.toString()))
                                            .withMember("module", Node.from(sdkId.capitalize()))
                                            .withMember("moduleVersion", Node.from("1.0"))
                                            .withMember("homepage", Node.from("https://docs.amplify.aws/"))
                                            .withMember("sdkId", Node.from(sdkId.capitalize()))
                                            .withMember("author", Node.from("Amazon Web Services"))
                                            .withMember("gitRepo", Node.from("https://github.com/aws-amplify/aws-sdk-swift.git"))
                                            .withMember("swiftVersion", Node.from("5.3.0"))
                                            .withMember("shouldGenerateUnitTestTarget", Node.from(false))
                                            .call {
                                                val buildStandaloneSdk = getProperty("buildStandaloneSdk")?.toBoolean() ?: false
                                                withMember("build", Node.objectNodeBuilder()
                                                        .withMember("rootProject", buildStandaloneSdk)
                                                        .build()
                                                )
                                            }
                                            .build()
                            )
                    )
                    .build()
            projectionsBuilder.withMember(sdkId + "." + version.toLowerCase(), projectionContents)
        }

        file("smithy-build.json").writeText(Node.prettyPrintJson(Node.objectNodeBuilder()
                .withMember("version", "1.0")
                .withMember("projections", projectionsBuilder.build())
                .build()))
    }
}

// Run the `buildSdk` automatically.
tasks["build"]
    .dependsOn(tasks["generate-smithy-build"])
    .finalizedBy(tasks["buildSdk"])
