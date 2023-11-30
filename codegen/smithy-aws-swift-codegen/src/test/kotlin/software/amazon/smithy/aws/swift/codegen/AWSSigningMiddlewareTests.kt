/*
 * Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
 * SPDX-License-Identifier: Apache-2.0.
 */

package software.amazon.smithy.aws.swift.codegen

import io.kotest.matchers.string.shouldContainOnlyOnce
import org.junit.jupiter.api.Assertions.assertFalse
import org.junit.jupiter.api.Assertions.assertTrue
import org.junit.jupiter.api.Test
import software.amazon.smithy.aws.swift.codegen.awsjson.AwsJson1_0_ProtocolGenerator
import software.amazon.smithy.aws.swift.codegen.middleware.AWSSigningMiddleware
import software.amazon.smithy.aws.traits.ServiceTrait
import software.amazon.smithy.aws.traits.auth.SigV4Trait
import software.amazon.smithy.aws.traits.auth.UnsignedPayloadTrait
import software.amazon.smithy.model.Model
import software.amazon.smithy.model.shapes.OperationShape
import software.amazon.smithy.model.shapes.ServiceShape
import software.amazon.smithy.model.shapes.ShapeId
import software.amazon.smithy.model.shapes.StructureShape
import software.amazon.smithy.model.traits.AuthTrait
import software.amazon.smithy.model.traits.HttpBasicAuthTrait
import software.amazon.smithy.swift.codegen.SwiftWriter
import software.amazon.smithy.swift.codegen.integration.ProtocolGenerator
import software.amazon.smithy.swift.codegen.model.AddOperationShapes

class AWSSigningMiddlewareTests {
    @Test
    fun `service has SigV4Trait and operation has auth trait`() {
        val sigV4Trait = SigV4Trait.builder().name("ExampleService").build()
        val authList = listOf(HttpBasicAuthTrait().toShapeId(), sigV4Trait.toShapeId())

        val serviceShape = ServiceShape.builder()
            .id("com.test#Example")
            .version("1.0")
            .addTrait(sigV4Trait)
            .build()
        val operationShape = OperationShape.builder()
            .id("com.test#ExampleOperation")
            .addTrait(UnsignedPayloadTrait())
            .addTrait(AuthTrait(authList))
            .build()
        val model = Model.builder()
            .addShape(serviceShape)
            .addShape(operationShape)
            .build()

        val hasAuthScheme = AWSSigningMiddleware.hasSigV4AuthScheme(model, serviceShape, operationShape)
        assertTrue(hasAuthScheme)
    }

    @Test
    fun `service has SigV4trait but operation does not have auth`() {
        val serviceShape = ServiceShape.builder()
            .id("com.test#Example")
            .version("1.0")
            .addTrait(SigV4Trait.builder().name("ExampleService").build())
            .build()
        val outputShape = StructureShape.builder()
            .id("com.test#ExampleOutput")
            .build()
        val operationShape = OperationShape.builder()
            .id("com.test#ExampleOperation")
            .output { ShapeId.from("com.test#ExampleOutput") }
            .build()
        val model = Model.builder()
            .addShape(serviceShape)
            .addShape(operationShape)
            .addShape(outputShape)
            .build()

        val hasAuthScheme = AWSSigningMiddleware.hasSigV4AuthScheme(model, serviceShape, operationShape)
        assertFalse(hasAuthScheme)
    }

    @Test
    fun `render unsignedBody true`() {
        val expectedContents = """
let sigv4Config = AWSClientRuntime.SigV4Config(unsignedBody: true, signingAlgorithm: .sigv4)
stack.finalizeStep.intercept(position: .before, middleware: AWSClientRuntime.SigV4Middleware<ExampleOutput>(config: sigv4Config))
"""
        val writer = SwiftWriter("testName")
        val context = contextForSDK("ExampleService")
        val operation = context.model.operationShapes.first()

        val params = AWSSigningParams(
            context.service,
            operation,
            useSignatureTypeQueryString = false,
            forceUnsignedBody = true,
            useExpiration = false,
            signingAlgorithm = SigningAlgorithm.SigV4
        )
        val subject = AWSSigningMiddleware(context.model, context.symbolProvider, params)
        subject.render(context, writer, operation, stack)
        val contents = writer.toString()

        contents.shouldContainOnlyOnce(expectedContents)
    }

    @Test
    fun `render unsignedBody false`() {
        val expectedContents = """
let sigv4Config = AWSClientRuntime.SigV4Config(unsignedBody: false, signingAlgorithm: .sigv4)
stack.finalizeStep.intercept(position: .before, middleware: AWSClientRuntime.SigV4Middleware<ExampleOutput>(config: sigv4Config))
"""
        val writer = SwiftWriter("testName")
        val context = contextForSDK("ExampleService")
        val operation = context.model.operationShapes.first()

        val params = AWSSigningParams(
            context.service,
            operation,
            useSignatureTypeQueryString = false,
            forceUnsignedBody = false,
            useExpiration = false,
            signingAlgorithm = SigningAlgorithm.SigV4
        )
        val subject = AWSSigningMiddleware(context.model, context.symbolProvider, params)
        subject.render(context, writer, operation, stack)
        val contents = writer.toString()

        contents.shouldContainOnlyOnce(expectedContents)
    }

    @Test
    fun `render unsignedBody true, presigner`() {
        val expectedContents = """
let sigv4Config = AWSClientRuntime.SigV4Config(expiration: expiration, unsignedBody: true, signingAlgorithm: .sigv4)
stack.finalizeStep.intercept(position: .before, middleware: AWSClientRuntime.SigV4Middleware<ExampleOutput>(config: sigv4Config))
"""
        val writer = SwiftWriter("testName")
        val context = contextForSDK("ExampleService")
        val operation = context.model.operationShapes.first()

        val params = AWSSigningParams(
            context.service,
            operation,
            useSignatureTypeQueryString = false,
            forceUnsignedBody = true,
            useExpiration = true,
            signingAlgorithm = SigningAlgorithm.SigV4
        )
        val subject = AWSSigningMiddleware(context.model, context.symbolProvider, params)
        subject.render(context, writer, operation, stack)
        val contents = writer.toString()

        contents.shouldContainOnlyOnce(expectedContents)
    }

    @Test
    fun `render unsignedBody false, presigner`() {
        val expectedContents = """
let sigv4Config = AWSClientRuntime.SigV4Config(expiration: expiration, unsignedBody: false, signingAlgorithm: .sigv4)
stack.finalizeStep.intercept(position: .before, middleware: AWSClientRuntime.SigV4Middleware<ExampleOutput>(config: sigv4Config))
"""
        val writer = SwiftWriter("testName")
        val context = contextForSDK("ExampleService")
        val operation = context.model.operationShapes.first()

        val params = AWSSigningParams(
            context.service,
            operation,
            useSignatureTypeQueryString = false,
            forceUnsignedBody = false,
            useExpiration = true,
            signingAlgorithm = SigningAlgorithm.SigV4
        )
        val sut = AWSSigningMiddleware(context.model, context.symbolProvider, params)
        sut.render(context, writer, operation, stack)
        val contents = writer.toString()

        contents.shouldContainOnlyOnce(expectedContents)
    }

    @Test
    fun `render s3 with query string sig`() {
        val expectedContents = """
let sigv4Config = AWSClientRuntime.SigV4Config(signatureType: .requestQueryParams, useDoubleURIEncode: false, shouldNormalizeURIPath: false, expiration: expiration, unsignedBody: true, signingAlgorithm: .sigv4)
stack.finalizeStep.intercept(position: .before, middleware: AWSClientRuntime.SigV4Middleware<ExampleOutput>(config: sigv4Config))
"""
        val writer = SwiftWriter("testName")
        val context = contextForSDK("S3")
        val operation = context.model.operationShapes.first()

        val params = AWSSigningParams(
            context.service,
            operation,
            useSignatureTypeQueryString = true,
            forceUnsignedBody = true,
            useExpiration = true,
            signingAlgorithm = SigningAlgorithm.SigV4
        )
        val subject = AWSSigningMiddleware(context.model, context.symbolProvider, params)
        subject.render(context, writer, operation, stack)
        val contents = writer.toString()

        contents.shouldContainOnlyOnce(expectedContents)
    }

    @Test
    fun `render s3 with signed body & normal sig`() {
        val expectedContents = """
let sigv4Config = AWSClientRuntime.SigV4Config(useDoubleURIEncode: false, shouldNormalizeURIPath: false, expiration: expiration, signedBodyHeader: .contentSha256, unsignedBody: false, signingAlgorithm: .sigv4)
stack.finalizeStep.intercept(position: .before, middleware: AWSClientRuntime.SigV4Middleware<ExampleOutput>(config: sigv4Config))
        """.trimIndent()
        val writer = SwiftWriter("testName")
        val context = contextForSDK("S3")
        val operation = context.model.operationShapes.first()

        val params = AWSSigningParams(
            context.service,
            operation,
            useSignatureTypeQueryString = false,
            forceUnsignedBody = false,
            useExpiration = true,
            signingAlgorithm = SigningAlgorithm.SigV4
        )
        val subject = AWSSigningMiddleware(context.model, context.symbolProvider, params)
        subject.render(context, writer, operation, stack)
        val contents = writer.toString()

        contents.shouldContainOnlyOnce(expectedContents)
    }

    @Test
    fun `render glacier with signed body & normal sig`() {
        val expectedContents = """
let sigv4Config = AWSClientRuntime.SigV4Config(signedBodyHeader: .contentSha256, unsignedBody: false, signingAlgorithm: .sigv4)
stack.finalizeStep.intercept(position: .before, middleware: AWSClientRuntime.SigV4Middleware<ExampleOutput>(config: sigv4Config))
"""
        val writer = SwiftWriter("testName")
        val context = contextForSDK("Glacier")
        val operation = context.model.operationShapes.first()

        val params = AWSSigningParams(
            context.service,
            operation,
            useSignatureTypeQueryString = false,
            forceUnsignedBody = false,
            useExpiration = false,
            signingAlgorithm = SigningAlgorithm.SigV4
        )
        val subject = AWSSigningMiddleware(context.model, context.symbolProvider, params)
        subject.render(context, writer, operation, stack)
        val contents = writer.toString()

        contents.shouldContainOnlyOnce(expectedContents)
    }

    private fun contextForSDK(sdkID: String): ProtocolGenerator.GenerationContext {
        val serviceShape = ServiceShape.builder()
            .id("com.test#Example")
            .version("1.0")
            .addTrait(serviceTraitWithID(sdkID))
            .addTrait(SigV4Trait.builder().name("ExampleService").build())
            .build()
        val outputShape = StructureShape.builder()
            .id("com.test#ExampleOutput")
            .build()
        val operationShape = OperationShape.builder()
            .id("com.test#ExampleOperation")
            .output { ShapeId.from("com.test#ExampleOutput") }
            .build()
        val opStackName = "stack"
        var model = Model.builder()
            .addShape(serviceShape)
            .addShape(operationShape)
            .addShape(outputShape)
            .build()
        model = AddOperationShapes.execute(model, serviceShape, "Example")
        return model.newTestContext("com.test#Example", AwsJson1_0_ProtocolGenerator()).ctx
    }

    private fun serviceTraitWithID(sdkID: String): ServiceTrait {
        return ServiceTrait.builder().sdkId(sdkID).arnNamespace("aws::example").cloudFormationName("ExampleService").cloudTrailEventSource("ExampleService").build()
    }

    private val stack = "stack"
}
