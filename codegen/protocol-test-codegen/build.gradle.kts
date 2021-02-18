/*
 * Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
 * SPDX-License-Identifier: Apache-2.0.
 */
import software.amazon.smithy.gradle.tasks.SmithyBuild

plugins {
    id("software.amazon.smithy") version "0.5.2"
}

description = "Smithy protocol test suite"

val smithyVersion: String by project

dependencies {
    implementation("software.amazon.smithy:smithy-aws-protocol-tests:$smithyVersion")
    implementation(project(":smithy-aws-swift-codegen"))
}

// This project doesn't produce a JAR.
tasks["jar"].enabled = false

// Run the SmithyBuild task manually since this project needs the built JAR
// from smithy-aws-swift-codegen.
tasks["smithyBuildJar"].enabled = false

tasks.create<SmithyBuild>("buildSdk") {
    addRuntimeClasspath = true
}

// Run the `buildSdk` automatically.
tasks["build"].finalizedBy(tasks["buildSdk"])

// force rebuild every time while developing
tasks["buildSdk"].outputs.upToDateWhen { false }

open class ProtocolTestTask : DefaultTask() {
    /**
     * The protocol name
     */
    @get:Input
    var protocol: String = ""

    /**
     * The plugin name to use
     */
    @get:Input
    var plugin: String = ""

    @TaskAction
    fun runTests(){
        require(protocol.isNotEmpty()) { "protocol name must be specified" }
        require(plugin.isNotEmpty()) { "plugin name must be specified" }

        val generatedBuildDir = project.file("${project.buildDir}/smithyprojections/${project.name}/$protocol/$plugin")
        println("[$protocol] buildDir: $generatedBuildDir")
        if (!generatedBuildDir.exists()) {
            throw GradleException("$generatedBuildDir does not exist")
        }

        project.exec {
            workingDir = generatedBuildDir
            executable = "cat"
            args = listOf("Package.swift")
        }

        project.exec {
            workingDir = generatedBuildDir
            executable = "swift"
            args = listOf("test")
        }
    }
}

// The following section exposes Smithy protocol test suites as gradle test targets
// for the configured protocols in [enabledProtocols].
val enabledProtocols = listOf("aws-json-10", "aws-json-11", "aws-restjson")

enabledProtocols.forEach {
    tasks.register<ProtocolTestTask>("testProtocol-${it}") {
        dependsOn(tasks.build)
        group = "Verification"
        protocol = it
        plugin = "swift-codegen"
    }
}


tasks.register("testAllProtocols") {
    group = "Verification"
    val allTests = tasks.withType<ProtocolTestTask>()
    dependsOn(allTests)
}
