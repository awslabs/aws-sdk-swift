/*
 * Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
 * SPDX-License-Identifier: Apache-2.0.
 */
import software.amazon.smithy.model.shapes.ShapeId

plugins {
    java
    id("software.amazon.smithy.gradle.smithy-base")
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
    implementation("software.amazon.smithy:smithy-protocol-tests:$smithyVersion")
}

data class ProtocolTest(
    val serviceName: String,
    val serviceShapeId: String,
    // Set false when the service's tests reference shapes that removeUnusedShapes would strip.
    val removeUnusedShapes: Boolean = true,
    val forceSchemaBased: Boolean = false,
)

val enabledProtocols = listOf(
    ProtocolTest("Ec2QueryTestSDK", "aws.protocoltests.ec2#AwsEc2"),
    ProtocolTest("Ec2QueryTestSDKSchemaBased", "aws.protocoltests.ec2#AwsEc2", forceSchemaBased = true),
    ProtocolTest("AWSJson10TestSDK", "aws.protocoltests.json10#JsonRpc10"),
    ProtocolTest("AWSJson11TestSDK", "aws.protocoltests.json#JsonProtocol"),
    ProtocolTest("AWSRestJsonTestSDK", "aws.protocoltests.restjson#RestJson"),
    ProtocolTest("AWSRestJsonTestSDKSchemaBased", "aws.protocoltests.restjson#RestJson", forceSchemaBased = true),
    ProtocolTest("AWSRestJsonValidationTestSDK", "aws.protocoltests.restjson.validation#RestJsonValidation"),
    ProtocolTest("AWSRestJsonValidationTestSDKSchemaBased", "aws.protocoltests.restjson.validation#RestJsonValidation", forceSchemaBased = true),
    ProtocolTest("RestXmlTestSDK", "aws.protocoltests.restxml#RestXml"),
    ProtocolTest("RestXmlTestSDKSchemaBased", "aws.protocoltests.restxml#RestXml", forceSchemaBased = true),
    ProtocolTest("RestXmlWithNamespaceTestSDK", "aws.protocoltests.restxml.xmlns#RestXmlWithNamespace"),
    ProtocolTest(
        "RestXmlWithNamespaceTestSDKSchemaBased",
        "aws.protocoltests.restxml.xmlns#RestXmlWithNamespace",
        forceSchemaBased = true,
    ),
    ProtocolTest("AWSQueryTestSDK", "aws.protocoltests.query#AwsQuery"),
    ProtocolTest("AWSQueryTestSDKSchemaBased", "aws.protocoltests.query#AwsQuery", forceSchemaBased = true),
    ProtocolTest("RPCV2CBORTestSDK", "smithy.protocoltests.rpcv2Cbor#RpcV2Protocol"),
    ProtocolTest("AWSJson10TestQueryCompatSDK", "aws.protocoltests.json10#QueryCompatibleJsonRpc10"),
    ProtocolTest("RPCV2CBORTestQueryCompatSDK", "aws.protocoltests.rpcv2cbor#QueryCompatibleRpcV2Protocol"),
    ProtocolTest("RPCV2CBORTestNonQueryCompatSDK", "aws.protocoltests.rpcv2cbor#NonQueryCompatibleRpcV2Protocol"),
    // The corpus shapes also carry rpcv2Json event stream tests, which name the smithy.protocols#rpcv2Json
    // trait; removeUnusedShapes would strip that trait's definition and fail validation.
    ProtocolTest(
        "RPCV2CBORCorpusTestSDK",
        "smithy.protocoltests.corpus#RpcV2CborCorpusTests",
        removeUnusedShapes = false,
    ),

    // service specific tests
    ProtocolTest("APIGatewayTestSDK", "com.amazonaws.apigateway#BackplaneControlService"),
    ProtocolTest("APIGatewayTestSDKSchemaBased", "com.amazonaws.apigateway#BackplaneControlService", forceSchemaBased = true),
    ProtocolTest("GlacierTestSDK", "com.amazonaws.glacier#Glacier"),
    ProtocolTest("GlacierTestSDKSchemaBased", "com.amazonaws.glacier#Glacier", forceSchemaBased = true),
    ProtocolTest("S3TestSDK", "com.amazonaws.s3#AmazonS3"),
    ProtocolTest("S3TestSDKSchemaBased", "com.amazonaws.s3#AmazonS3", forceSchemaBased = true),
    ProtocolTest("MachineLearningTestSDK", "com.amazonaws.machinelearning#AmazonML_20141212"),
)

// This project doesn't produce a JAR.
tasks["jar"].enabled = false

tasks.register("generateSmithyBuild") {
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

tasks.named("smithyBuild") {
    dependsOn("generateSmithyBuild")
    inputs.file(projectDir.resolve("smithy-build.json"))
    outputs.upToDateWhen { false }
}

fun generateSmithyBuild(tests: List<ProtocolTest>): String {
    val projections = tests.joinToString(",") { test ->
        """
            "${test.serviceName}": {
              "transforms": [
                {
                  "name": "includeServices",
                  "args": {
                    "services": [
                      "${test.serviceShapeId}"
                    ]
                  }
                },${if (test.removeUnusedShapes) """
                {
                  "name": "removeUnusedShapes"
                },""" else ""}
                {
                  "name": "flattenAndRemoveMixins"
                }
              ],
              "plugins": {
                "swift-codegen": {
                  "service": "${test.serviceShapeId}",
                  "module": "${test.serviceName}",
                  "moduleVersion": "1.0",
                  "gitRepo": "https://github.com/aws-amplify/smithy-swift.git",
                  "author": "Amazon Web Services",
                  "homepage": "https://docs.amplify.aws/",
                  "swiftVersion": "6.0",
                  "mergeModels": true,
                  "copyrightNotice": "//\n// Copyright Amazon.com Inc. or its affiliates.\n// All Rights Reserved.\n//\n// SPDX-License-Identifier: Apache-2.0\n//\n\n// Code generated by smithy-swift-codegen. DO NOT EDIT!\n\n"${if (test.forceSchemaBased) ",\n                  \"forceSchemaBased\": true" else ""}
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
