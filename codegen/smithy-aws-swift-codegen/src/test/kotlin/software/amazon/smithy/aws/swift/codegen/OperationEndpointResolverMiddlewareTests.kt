/*
 * Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
 * SPDX-License-Identifier: Apache-2.0.
 */

package software.amazon.smithy.aws.swift.codegen

import io.kotest.matchers.string.shouldContainOnlyOnce
import org.junit.jupiter.api.Test
import software.amazon.smithy.aws.swift.codegen.middleware.OperationEndpointResolverMiddleware
import software.amazon.smithy.aws.traits.protocols.RestJson1Trait
import software.amazon.smithy.swift.codegen.SwiftWriter
import software.amazon.smithy.swift.codegen.integration.ProtocolGenerator

class OperationEndpointResolverMiddlewareTests {
    @Test
    fun `test endpoint middleware init`() {
        val writer = SwiftWriter("smithy.example")
        val context = setupGenerationContext("endpoints.smithy", "smithy.example#ExampleService")
        val operation = context.model.operationShapes.toList().first { it.id.name == "GetThing" }
        val middleware = OperationEndpointResolverMiddleware(context)
        middleware.render(context, writer, operation, "operationStack")
        var contents = writer.toString()
        val expected = """
guard let region = config.region else {
    throw SdkError<GetThingOutputError>.client(ClientError.unknownError(("Missing required parameter: region")))
}
let endpointParams = EndpointParams(boolBar: true, boolBaz: input.fuzz, boolFoo: config.serviceSpecific.boolFoo, endpoint: config.endpoint, region: region, stringBar: "some value", stringBaz: input.buzz, stringFoo: config.serviceSpecific.stringFoo)
operationStack.buildStep.intercept(position: .before, middleware: EndpointResolverMiddleware<GetThingOutput>(endpointResolver: config.serviceSpecific.endpointResolver, endpointParams: endpointParams))
"""
        contents.shouldContainOnlyOnce(expected)
    }
}

fun setupGenerationContext(smithyFile: String, serviceShapeId: String): ProtocolGenerator.GenerationContext {
    val context = TestContextGenerator.initContextFrom(smithyFile, serviceShapeId, RestJson1Trait.ID)
    return ProtocolGenerator.GenerationContext(context.ctx.settings, context.ctx.model, context.ctx.service, context.ctx.symbolProvider, listOf(), RestJson1Trait.ID, context.ctx.delegator)
}
