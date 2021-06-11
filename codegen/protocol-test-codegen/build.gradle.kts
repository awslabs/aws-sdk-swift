/*
 * Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
 * SPDX-License-Identifier: Apache-2.0.
 */
import software.amazon.smithy.gradle.tasks.SmithyBuild
import software.amazon.smithy.gradle.tasks.ProtocolTestTask

plugins {
    id("software.amazon.smithy") version "0.5.3"
}

description = "Smithy protocol test suite"

val smithyVersion: String by project
buildscript {
    val smithyVersion: String by project
    dependencies {
        classpath("software.amazon.smithy:smithy-cli:$smithyVersion")
    }
}

dependencies {
    implementation("software.amazon.smithy:smithy-aws-protocol-tests:$smithyVersion")
    implementation("software.amazon.smithy:smithy-aws-traits:$smithyVersion")
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

// The following section exposes Smithy protocol test suites as gradle test targets
// for the configured protocols in [enabledProtocols].
val enabledProtocols = listOf("aws-json-10", "aws-json-11", "aws-restjson", "rest-xml", "aws-query")

enabledProtocols.forEach {
    tasks.register<ProtocolTestTask>("testProtocol-${it}") {
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


tasks.register("test-protocol-single-codegen-aws-json-10") {
    val pcgtask = tasks.findByName("testProtocol-aws-json-10")
    dependsOn(pcgtask)
}

tasks.register("test-protocol-single-codegen-aws-json-11") {
    val pcgtask = tasks.findByName("testProtocol-aws-json-11")
    dependsOn(pcgtask)
}

tasks.register("test-protocol-single-codegen-aws-restjson") {
    val pcgtask = tasks.findByName("testProtocol-aws-restjson")
    dependsOn(pcgtask)
}

tasks.register("test-protocol-single-codegen-rest-xml") {
    val pcgtask = tasks.findByName("testProtocol-rest-xml")
    dependsOn(pcgtask)
}

tasks.register("test-protocol-single-codegen-aws-query") {
    val pcgtask = tasks.findByName("testProtocol-aws-query")
    dependsOn(pcgtask)
}


