/*
 * Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
 * SPDX-License-Identifier: Apache-2.0.
 */
package software.amazon.smithy.aws.swift.codegen.restjson

import software.amazon.smithy.aws.swift.codegen.AWSHTTPBindingProtocolGenerator
import software.amazon.smithy.aws.swift.codegen.message.MessageMarshallableGenerator
import software.amazon.smithy.aws.swift.codegen.message.MessageUnmarshallableGenerator
import software.amazon.smithy.aws.traits.protocols.RestJson1Trait
import software.amazon.smithy.model.shapes.ShapeId
import software.amazon.smithy.swift.codegen.integration.ProtocolGenerator
import software.amazon.smithy.swift.codegen.integration.httpResponse.HttpResponseGenerator

class AWSRestJson1ProtocolGenerator : AWSHTTPBindingProtocolGenerator(RestJSONCustomizations()) {
    override val defaultContentType = "application/json"
    override val protocol: ShapeId = RestJson1Trait.ID
    override val httpResponseGenerator = HttpResponseGenerator(customizations)
    override val testsToIgnore = setOf(
        "SDKAppliedContentEncoding_restJson1",
        "SDKAppendedGzipAfterProvidedEncoding_restJson1",
    )
    override val tagsToIgnore = setOf("defaults")

    override fun generateMessageMarshallable(ctx: ProtocolGenerator.GenerationContext) {
        var streamingShapes = outputStreamingShapes(ctx)
        val messageUnmarshallableGenerator = MessageUnmarshallableGenerator(ctx)
        streamingShapes.forEach { streamingMember ->
            messageUnmarshallableGenerator.render(streamingMember)
        }
    }

    override fun generateMessageUnmarshallable(ctx: ProtocolGenerator.GenerationContext) {
        val streamingShapes = inputStreamingShapes(ctx)
        val messageMarshallableGenerator = MessageMarshallableGenerator(ctx, defaultContentType)
        for (streamingShape in streamingShapes) {
            messageMarshallableGenerator.render(streamingShape)
        }
    }
}
