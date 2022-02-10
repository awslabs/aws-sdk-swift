/*
 * Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
 * SPDX-License-Identifier: Apache-2.0.
 */

import software.amazon.smithy.gradle.tasks.ProtocolTestTask
import software.amazon.smithy.gradle.tasks.SmithyBuild

plugins {
    id("software.amazon.smithy").version("0.5.3")
}

val smithyVersion: String by project

buildscript {
    val smithyVersion: String by project
    dependencies {
        classpath("software.amazon.smithy:smithy-cli:$smithyVersion")
    }
}

dependencies {
    implementation("software.amazon.smithy:smithy-aws-protocol-tests:$smithyVersion")
    implementation("software.amazon.smithy:smithy-protocol-test-traits:$smithyVersion")
    implementation("software.amazon.smithy:smithy-aws-traits:$smithyVersion")
    implementation(project(":smithy-aws-swift-codegen"))
}

data class CodegenTest(val service: String, val module: String, val extraConfig: String? = null)
val codegenTests = listOf(
    CodegenTest(
        "aws.protocoltests.restjson#RestJson",
        "aws-restjson"
    ),
    CodegenTest(
        "aws.protocoltests.restjson#RestJsonExtras",
        "rest_json_extras"
    )
)

fun generateSmithyBuild(tests: List<CodegenTest>): String {
    val projections = tests.joinToString(",\n") {
        """
            "${it.module}": {
                "plugins": {
                    "swift-codegen": {
                      "service": "${it.service}",
                      "module": "${it.module.replace("-", "_")}",
                      "moduleVersion": "0.0.1",
                      "gitRepo": "https://github.com/aws-amplify/smithy-swift.git",
                      "author": "Amazon Web Services",
                      "homepage": "https://docs.amplify.aws/",
                      "swiftVersion": "5.5.0",
                      "build": {
                        "rootProject": true
                      }
                      ${it.extraConfig ?: ""}
                 }
               }
            }
        """.trimIndent()
    }
    return """
    {
        "version": "1.0",
        "projections": { $projections }
    }
    """
}

tasks.create<SmithyBuild>("buildSdk") {
    addRuntimeClasspath = true
}

task("generateSmithyBuild") {
    description = "generate smithy-build.json"
    doFirst {
        projectDir.resolve("smithy-build.json").writeText(generateSmithyBuild(codegenTests))
    }
}
tasks["jar"].enabled = false
tasks["smithyBuildJar"].dependsOn("generateSmithyBuild")

tasks["clean"].doFirst {
    delete("smithy-build.json")
}


fun exposeLocalTestsToMainGradleTestSuite() {
    val enabledProtocols = listOf("rest_json_extras", "aws-restjson")
    enabledProtocols.forEach {
        tasks.register<ProtocolTestTask>("testProtocol-${it}") {
            dependsOn(tasks.build)
            group = "Verification"
            protocol = it
            plugin = "swift-codegen"
        }
    }
    tasks.register("testAllProtocolsLocal") {
        group = "Verification"
        val allTests = tasks.withType<ProtocolTestTask>()
        dependsOn(allTests)
    }
}
exposeLocalTestsToMainGradleTestSuite()
