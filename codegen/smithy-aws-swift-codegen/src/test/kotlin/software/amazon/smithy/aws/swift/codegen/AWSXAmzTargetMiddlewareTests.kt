package software.amazon.smithy.aws.swift.codegen

import io.kotest.matchers.string.shouldContainOnlyOnce
import org.junit.jupiter.api.Test
import software.amazon.smithy.aws.swift.codegen.middleware.AWSXAmzTargetMiddleware
import software.amazon.smithy.aws.traits.auth.UnsignedPayloadTrait
import software.amazon.smithy.model.shapes.OperationShape
import software.amazon.smithy.model.shapes.ServiceShape
import software.amazon.smithy.swift.codegen.SwiftWriter

class AWSXAmzTargetMiddlewareTests {
    @Test
    fun `xAmzTargetMiddleware happypath`() {
        val expectedContents = """
stack.serializeStep.intercept(position: .before, middleware: XAmzTargetMiddleware<testInputShapeName, testOutputShapeName, testErrorShapeName>(xAmzTarget: "ExampleServiceShapeName.ExampleOperation"))
"""
        val writer = SwiftWriter("testName")
        val serviceShape = ServiceShape.builder()
            .id("com.test#ExampleServiceShapeName")
            .version("1.0")
            .build()
        val operationShape = OperationShape.builder()
            .id("com.test#ExampleOperation")
            .addTrait(UnsignedPayloadTrait())
            .build()
        val opStackName = "stack"
        val inputShapeName = "testInputShapeName"
        val outputShapeName = "testOutputShapeName"
        val errorShapeName = "testErrorShapeName"

        val sut = AWSXAmzTargetMiddleware()

        sut.xAmzTargetMiddleware(writer, serviceShape, operationShape, opStackName, inputShapeName, outputShapeName, errorShapeName)

        val contents = writer.toString()
        contents.shouldContainOnlyOnce(expectedContents)
    }
}
