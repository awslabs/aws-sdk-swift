/*
 * Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
 * SPDX-License-Identifier: Apache-2.0.
 */
import software.amazon.smithy.gradle.tasks.ProtocolTestTask

plugins {
  `java`
  id("software.amazon.smithy.gradle.smithy-jar") version "1.2.0"
}

description = "Smithy protocol test suite"

val smithyVersion: String by project
//buildscript {
//    val smithyVersion: String by project
//    dependencies {
//        classpath("software.amazon.smithy:smithy-cli:$smithyVersion")
//    }
//}

dependencies {
    implementation("software.amazon.smithy:smithy-aws-protocol-tests:$smithyVersion")
    implementation("software.amazon.smithy:smithy-aws-traits:$smithyVersion")
    implementation(project(":smithy-aws-swift-codegen"))
    implementation("software.amazon.smithy:smithy-protocol-tests:$smithyVersion")
    smithyBuild("software.amazon.smithy:smithy-cli:$smithyVersion")
}

val enabledProtocols = listOf(
    ProtocolTest("ec2-query", "aws.protocoltests.ec2#AwsEc2", "Ec2QueryTestSDK"),
    ProtocolTest("aws-json-10", "aws.protocoltests.json10#JsonRpc10", "AWSJson1_0TestSDK"),
    ProtocolTest("aws-json-11", "aws.protocoltests.json#JsonProtocol", "AWSJson1_1TestSDK"),
    ProtocolTest("aws-restjson", "aws.protocoltests.restjson#RestJson", "AWSRestJsonTestSDK"),
    ProtocolTest("aws-restjson-validation", "aws.protocoltests.restjson.validation#RestJsonValidation", "AWSRestJsonValidationTestSDK"),
    ProtocolTest("rest-xml", "aws.protocoltests.restxml#RestXml", "RestXmlTestSDK"),
    ProtocolTest("rest-xml-xmlns", "aws.protocoltests.restxml.xmlns#RestXmlWithNamespace", "RestXmlWithNamespaceTestSDK"),
    ProtocolTest("aws-query", "aws.protocoltests.query#AwsQuery", "AWSQueryTestSDK"),
    ProtocolTest("smithy-rpcv2-cbor", "smithy.protocoltests.rpcv2Cbor#RpcV2Protocol", "RPCV2CBORTestSDK"),
    ProtocolTest("aws-json-10-query-compat", "aws.protocoltests.json10#QueryCompatibleJsonRpc10", "AWSJson1_0TestQueryCompatSDK"),
    ProtocolTest("smithy-rpcv2-cbor-query-compat", "aws.protocoltests.rpcv2cbor#QueryCompatibleRpcV2Protocol", "RPCV2CBORTestQueryCompatSDK"),
    ProtocolTest("smithy-rpcv2-cbor-non-query-compat", "aws.protocoltests.rpcv2cbor#NonQueryCompatibleRpcV2Protocol", "RPCV2CBORTestNonQueryCompatSDK"),

    // service specific tests
    ProtocolTest("apigateway", "com.amazonaws.apigateway#BackplaneControlService", "APIGatewayTestSDK"),
    ProtocolTest("glacier", "com.amazonaws.glacier#Glacier", "GlacierTestSDK"),
    ProtocolTest("s3", "com.amazonaws.s3#AmazonS3", "S3TestSDK"),
    ProtocolTest("machinelearning", "com.amazonaws.machinelearning#AmazonML_20141212", "MachineLearningTestSDK"),
)

// This project doesn't produce a JAR.
// tasks["jar"].enabled = false

// Run the SmithyBuild task manually since this project needs the built JAR
// from smithy-aws-swift-codegen.
tasks["smithyBuild"].enabled = false

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

//tasks.create("buildSdk") {
//    // addRuntimeClasspath = true
//    dependsOn("generateSmithyBuild")
//    inputs.file(projectDir.resolve("smithy-build.json"))
//}

// Run the `buildSdk` automatically.
// tasks["build"].finalizedBy(tasks["buildSdk"])

// force rebuild every time while developing
// tasks["buildSdk"].outputs.upToDateWhen { false }

enabledProtocols.forEach {
    tasks.register<ProtocolTestTask>("testProtocol-${it.projectionName}") {
        dependsOn(tasks.build)
        group = "Verification"
        protocol = it.projectionName
        plugin = "swift-codegen"
    }
}


data class ProtocolTest(
    val projectionName: String,
    val serviceShapeId: String,
    val moduleName: String
) {
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
                },
                {
                    "name": "removeUnusedShapes"
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
                  "swiftVersion": "5.7.0",
                  "mergeModels": false,
                  "copyrightNotice": "//\n// Copyright Amazon.com Inc. or its affiliates.\n// All Rights Reserved.\n//\n// SPDX-License-Identifier: Apache-2.0\n//\n\n// Code generated by smithy-swift-codegen. DO NOT EDIT!\n\n",
                  "forProtocolTests": true
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
