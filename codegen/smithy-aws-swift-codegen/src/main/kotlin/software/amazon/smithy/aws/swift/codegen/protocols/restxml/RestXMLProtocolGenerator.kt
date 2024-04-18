/*
 * Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
 * SPDX-License-Identifier: Apache-2.0.
 */

package software.amazon.smithy.aws.swift.codegen.protocols.restxml

import software.amazon.smithy.aws.swift.codegen.AWSHTTPBindingProtocolGenerator
import software.amazon.smithy.aws.swift.codegen.message.MessageMarshallableGenerator
import software.amazon.smithy.aws.swift.codegen.message.MessageUnmarshallableGenerator
import software.amazon.smithy.aws.traits.protocols.RestXmlTrait
import software.amazon.smithy.model.shapes.ShapeId
import software.amazon.smithy.swift.codegen.integration.ProtocolGenerator

class RestXMLProtocolGenerator : AWSHTTPBindingProtocolGenerator(RestXMLCustomizations()) {
    override val defaultContentType: String = "application/xml"
    override val protocol: ShapeId = RestXmlTrait.ID
    override val testsToIgnore: Set<String> = setOf(
        "S3DefaultAddressing",
        "S3VirtualHostAddressing",
        "S3VirtualHostDualstackAddressing",
        "S3VirtualHostAccelerateAddressing",
        "S3VirtualHostDualstackAccelerateAddressing",
        "S3OperationAddressingPreferred",
        "S3EscapeObjectKeyInUriLabel",
        "S3EscapePathObjectKeyInUriLabel",
        "SDKAppliedContentEncoding_restXml",
        "SDKAppendedGzipAfterProvidedEncoding_restXml",
        "S3OperationNoErrorWrappingResponse",
        "S3PreservesEmbeddedDotSegmentInUriLabel",
        "S3PreservesLeadingDotSegmentInUriLabel",
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
        var streamingShapes = inputStreamingShapes(ctx)
        val messageMarshallableGenerator = MessageMarshallableGenerator(ctx, defaultContentType)
        streamingShapes.forEach { streamingMember ->
            messageMarshallableGenerator.render(streamingMember)
        }
    }

    override fun generateDeserializers(ctx: ProtocolGenerator.GenerationContext) {
        super.generateDeserializers(ctx)
        val errorShapes = resolveErrorShapes(ctx)
        for (shape in errorShapes) {
            renderCodableExtension(ctx, shape)
        }
    }
}
