/*
 * Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
 * SPDX-License-Identifier: Apache-2.0.
 */

// This build file has been adapted from the Go v2 SDK, here:
// https://github.com/aws/aws-sdk-go-v2/blob/master/codegen/sdk-codegen/build.gradle.kts

import software.amazon.smithy.gradle.tasks.SmithyBuild
import software.amazon.smithy.model.Model
import software.amazon.smithy.model.shapes.ServiceShape
import java.util.Properties
import kotlin.streams.toList

plugins {
    id("software.amazon.smithy") version "0.5.3"
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

buildscript {
    val smithyVersion: String by project
    dependencies {
        classpath("software.amazon.smithy:smithy-aws-traits:$smithyVersion")
        classpath("software.amazon.smithy:smithy-cli:$smithyVersion")
    }
}

fun <T> java.util.Optional<T>.orNull(): T? = this.orElse(null)

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

// Represents information needed to generate a smithy projection JSON stanza
data class AwsService(
    val name: String,
    val packageName: String,
    val packageVersion: String,
    val modelFile: File,
    val projectionName: String,
    val gitRepo: String,
    val sdkId: String
)

// Generates a smithy-build.json file by creating a new projection.
// The generated smithy-build.json file is not committed to git since
// it's rebuilt each time codegen is performed.
fun generateSmithyBuild(services: List<AwsService>): String {
    require(services.isNotEmpty()) {
        "No services discovered. Verify aws.services and aws.protocols properties in local.build. Aborting."
    }
    val buildStandaloneSdk = getProperty("buildStandaloneSdk")?.toBoolean() ?: false
    val projections = services.joinToString(",") { service ->
        // escape windows paths for valid json
        val absModelPath = service.modelFile.absolutePath.replace("\\", "\\\\")
        val importPaths = mutableListOf(absModelPath)
        if (file(service.modelExtrasDir).exists()) {
            importPaths.add(service.modelExtrasDir.replace("\\", "\\\\"))
        }
        val imports = importPaths.joinToString { "\"$it\"" }
        """
            "${service.projectionName}": {
                "imports": [$imports],
                "plugins": {
                    "swift-codegen": {
                      "service": "${service.name}",
                      "module" : "${service.packageName}",
                      "moduleVersion": "${service.packageVersion}",
                      "homepage": "https://docs.amplify.aws/",
                      "sdkId": "${service.sdkId}",
                      "author": "Amazon Web Services",
                      "gitRepo": "${service.gitRepo}",
                      "swiftVersion": "5.5.0",
                      "build": {
                          "rootProject": $buildStandaloneSdk
                      }
                    }
                }
            }
        """
    }
    return """
    {
        "version": "1.0",
        "projections": {
            $projections
        }
    }
    """.trimIndent()
}

// Returns an AwsService model for every JSON file found in in directory defined by property `modelsDirProp`
fun discoverServices(): List<AwsService> {
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

    return filteredModels
        .map { file ->
        val model = Model.assembler().addImport(file.absolutePath).assemble().result.get()
        val services: List<ServiceShape> = model.shapes(ServiceShape::class.java).sorted().toList()
        require(services.size == 1) { "Expected one service per aws model, but found ${services.size} in ${file.absolutePath}: ${services.map { it.id }}" }
        val service = services.first()
        file to service
        }.map{ (file, service) ->
            val serviceApi = service.getTrait(software.amazon.smithy.aws.traits.ServiceTrait::class.java).orNull()
                ?: error { "Expected aws.api#service trait attached to model ${file.absolutePath}" }
            val (name, version, _) = file.name.split(".")

            logger.info("discovered service: ${serviceApi.sdkId}")

            AwsService(
                name = service.id.toString(),
                packageName = "AWS${serviceApi.sdkId.filterNot { it.isWhitespace() }.capitalize()}",
                packageVersion = "1.0",
                modelFile = file,
                projectionName = name + "." + version.toLowerCase(),
                sdkId = serviceApi.sdkId,
                gitRepo = "https://github.com/aws-amplify/aws-sdk-swift.git")
        }
}
val discoveredServices: List<AwsService> by lazy { discoverServices() }

val AwsService.outputDir: String
    get() = project.file("${project.buildDir}/smithyprojections/${project.name}/${projectionName}/swift-codegen").absolutePath

val AwsService.destinationDir: String
    get(){
        return rootProject.file("release").absolutePath
    }

val AwsService.modelExtrasDir: String
    get() {
        val sanitizedName = projectionName.split(".")[0]
        return rootProject.file("codegen/sdk-codegen/aws-models-test/${sanitizedName}").absolutePath
    }

task("stageSdks") {
    group = "codegen"
    description = "relocate generated SDK(s) from build directory to release dir"
    doLast {
        discoveredServices.forEach {
            logger.info("copying ${it.outputDir} to ${it.destinationDir}")
            copy {
                from("${it.outputDir}")
                into("${it.destinationDir}")
                exclude("Package.swift")
                exclude("*Tests")
            }
        }
    }
}

// Generates a smithy-build.json file by creating a new projection for every
// JSON model file found in aws-models/. The generated smithy-build.json file is
// not committed to git since it's rebuilt each time codegen is performed.
tasks.register("generate-smithy-build") {
    group = "codegen"
    description = "generate smithy-build.json"
    doFirst {
        projectDir.resolve("smithy-build.json").writeText(generateSmithyBuild(discoveredServices))
    }
}

// Run the `buildSdk` automatically.
tasks["build"]
    .dependsOn(tasks["generate-smithy-build"])
    .finalizedBy(tasks["buildSdk"])
