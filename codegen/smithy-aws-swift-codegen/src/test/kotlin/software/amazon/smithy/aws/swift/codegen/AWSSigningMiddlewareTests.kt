package software.amazon.smithy.aws.swift.codegen

import io.kotest.matchers.string.shouldContainOnlyOnce
import org.junit.jupiter.api.Test
import software.amazon.smithy.aws.swift.codegen.middleware.AWSSigningMiddleware
import software.amazon.smithy.aws.swift.codegen.restjson.AWSRestJson1ProtocolGenerator
import software.amazon.smithy.aws.traits.auth.SigV4Trait
import software.amazon.smithy.aws.traits.auth.UnsignedPayloadTrait
import software.amazon.smithy.model.Model
import software.amazon.smithy.model.shapes.OperationShape
import software.amazon.smithy.model.shapes.ServiceShape
import software.amazon.smithy.swift.codegen.SwiftWriter

class AWSSigningMiddlewareTests {
    @Test
    fun `needsSigningMiddleware does have SigV4Trait`() {
        val serviceShape = ServiceShape.builder()
            .id("com.test#Example")
            .version("1.0")
            .addTrait(SigV4Trait.builder().name("ExampleService").build())
            .build()


        val result = serviceShape.needsSigning

        assert(result).equals(true)
    }

    @Test
    fun `needsSigningMiddleware does not have SigV4Trait`() {
        val serviceShape = ServiceShape.builder()
            .id("com.test#Example")
            .version("1.0")
            .addTrait(SigV4Trait.builder().name("ExampleService").build())
            .build()

        val result = serviceShape.needsSigning

        assert(result).equals(false)
    }

    @Test
    fun `renderSigningMiddleware unsignedBody true`() {
        val expectedContents =
            """
stack.finalizeStep.intercept(position: .after,
                                         middleware: SigV4Middleware(unsignedBody: true))"""
        val writer = SwiftWriter("testName")
        val serviceShape = ServiceShape.builder()
            .id("com.test#Example")
            .version("1.0")
            .addTrait(SigV4Trait.builder().name("ExampleService").build())
            .build()
        val operationShape = OperationShape.builder()
            .id("com.test#ExampleOperation")
            .addTrait(UnsignedPayloadTrait())
            .build()
        val model = Model.builder().addShape(serviceShape).addShape(operationShape).build()
        val context = model.newTestContext(generator = AWSRestJson1ProtocolGenerator()).ctx
        val opStackName = "stack"
        val sut = AWSSigningMiddleware()

        sut.renderMiddleware(context, writer, serviceShape, operationShape, opStackName)

        val contents = writer.toString()
        contents.shouldContainOnlyOnce(expectedContents)
    }

    @Test
    fun `renderSigningMiddleware unsignedBody false`() {
        val expectedContents =
            """
stack.finalizeStep.intercept(position: .after,
                                         middleware: SigV4Middleware(unsignedBody: false))"""
        val writer = SwiftWriter("testName")
        val serviceShape = ServiceShape.builder()
            .id("com.test#Example")
            .version("1.0")
            .addTrait(SigV4Trait.builder().name("ExampleService").build())
            .build()
        val operationShape = OperationShape.builder()
            .id("com.test#ExampleOperation")
            .build()
        val model = Model.builder().addShape(serviceShape).addShape(operationShape).build()
        val context = model.newTestContext(generator = AWSRestJson1ProtocolGenerator()).ctx
        val opStackName = "stack"
        val sut = AWSSigningMiddleware()

        sut.renderMiddleware(context, writer, serviceShape, operationShape, opStackName)

        val contents = writer.toString()
        contents.shouldContainOnlyOnce(expectedContents)
    }
}
