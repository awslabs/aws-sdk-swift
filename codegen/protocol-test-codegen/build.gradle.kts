/*
 * Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
 * SPDX-License-Identifier: Apache-2.0.
 */
import software.amazon.smithy.gradle.tasks.ProtocolTestTask
import software.amazon.smithy.gradle.tasks.SmithyBuild

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

val enabledProtocols = listOf(
    ProtocolTest("ec2-query", "aws.protocoltests.ec2#AwsEc2", "Ec2QueryTestSDK"),
    ProtocolTest("aws-json-10", "aws.protocoltests.json10#JsonRpc10", "AWSJson1_0TestSDK"),
    ProtocolTest("aws-json-11", "aws.protocoltests.json#JsonProtocol", "AWSJson1_1TestSDK"),
    ProtocolTest("aws-restjson", "aws.protocoltests.restjson#RestJson", "AWSRestJsonTestSDK"),
    ProtocolTest("rest-xml", "aws.protocoltests.restxml#RestXml", "RestXmlTestSDK"),
    ProtocolTest("rest-xml-xmlns", "aws.protocoltests.restxml.xmlns#RestXmlWithNamespace", "RestXmlWithNamespaceTestSDK"),
    ProtocolTest("aws-query", "aws.protocoltests.query#AwsQuery", "AWSQueryTestSDK"),

    // service specific tests
    ProtocolTest("apigateway", "com.amazonaws.apigateway#BackplaneControlService", "APIGatewayTestSDK"),
    ProtocolTest("glacier", "com.amazonaws.glacier#Glacier", "GlacierTestSDK"),
    ProtocolTest("s3", "com.amazonaws.s3#AmazonS3", "S3TestSDK"),
    ProtocolTest("machinelearning", "com.amazonaws.machinelearning#AmazonML_20141212", "MachineLearningTestSDK")
)

// This project doesn't produce a JAR.
tasks["jar"].enabled = false

// Run the SmithyBuild task manually since this project needs the built JAR
// from smithy-aws-swift-codegen.
tasks["smithyBuildJar"].enabled = false

task("generateSmithyBuild") {
    group = "codegen"
    description = "generate smithy-build.json"
    val buildFile = projectDir.resolve("smithy-build.json")
    doFirst {
        buildFile.writeText(generateSmithyBuild(enabledProtocols))
    }
    outputs.file(buildFile)
}

tasks["clean"].doFirst {
    delete("smithy-build.json")
}

tasks.create<SmithyBuild>("buildSdk") {
    addRuntimeClasspath = true
    dependsOn(tasks["generateSmithyBuild"])
    inputs.file(projectDir.resolve("smithy-build.json"))
}

// Run the `buildSdk` automatically.
tasks["build"].finalizedBy(tasks["buildSdk"])

// force rebuild every time while developing
tasks["buildSdk"].outputs.upToDateWhen { false }

enabledProtocols.forEach {
    tasks.register<ProtocolTestTask>("testProtocol-${it.projectionName}") {
        dependsOn(tasks.build)
        group = "Verification"
        protocol = it.projectionName
        plugin = "swift-codegen"
    }
}


data class ProtocolTest(val projectionName: String,
                        val serviceShapeId: String,
                        val moduleName: String) {
    val packageName: String
        get() = projectionName.toLowerCase().filter { it.isLetterOrDigit() }
}
fun generateSmithyBuild(tests: List<ProtocolTest>): String {
    val projections = tests.joinToString(",") { test ->
        """
            "${test.projectionName}": {
              "transforms": [
                {
                  "name": "includeServices",
                  "args": {
                    "services": [
                      "${test.serviceShapeId}"
                    ]
                  }
                }
              ],
              "plugins": {
                "swift-codegen": {
                  "service": "${test.serviceShapeId}",
                  "module": "${test.moduleName}",
                  "moduleVersion": "1.0",
                  "gitRepo": "https://github.com/aws-amplify/smithy-swift.git",
                  "author": "Amazon Web Services",
                  "homepage": "https://docs.amplify.aws/",
                  "swiftVersion": "5.5.0"
                }
              }
            }"""
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

tasks.register("testAllProtocols") {
    group = "Verification"
    val allTests = tasks.withType<ProtocolTestTask>()
    dependsOn(allTests)
}
