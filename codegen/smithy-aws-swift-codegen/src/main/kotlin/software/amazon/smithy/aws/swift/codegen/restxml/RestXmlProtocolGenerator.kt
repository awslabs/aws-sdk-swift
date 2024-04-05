/*
 * Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
 * SPDX-License-Identifier: Apache-2.0.
 */

package software.amazon.smithy.aws.swift.codegen.restxml

import software.amazon.smithy.aws.swift.codegen.AWSHttpBindingProtocolGenerator
import software.amazon.smithy.aws.swift.codegen.message.XMLMessageMarshallableGenerator
import software.amazon.smithy.aws.swift.codegen.message.XMLMessageUnmarshallableGenerator
import software.amazon.smithy.aws.traits.protocols.RestXmlTrait
import software.amazon.smithy.model.shapes.MemberShape
import software.amazon.smithy.model.shapes.Shape
import software.amazon.smithy.model.shapes.ShapeId
import software.amazon.smithy.model.traits.TimestampFormatTrait
import software.amazon.smithy.swift.codegen.SwiftWriter
import software.amazon.smithy.swift.codegen.integration.ProtocolGenerator
import software.amazon.smithy.swift.codegen.integration.httpResponse.HttpResponseGenerator
import software.amazon.smithy.swift.codegen.integration.httpResponse.XMLHttpResponseBindingErrorInitGenerator
import software.amazon.smithy.swift.codegen.integration.httpResponse.XMLHttpResponseBindingOutputGenerator
import software.amazon.smithy.swift.codegen.integration.serde.json.StructEncodeXMLGenerator
import software.amazon.smithy.swift.codegen.integration.serde.xml.StructDecodeXMLGenerator
import software.amazon.smithy.swift.codegen.model.ShapeMetadata

class RestXmlProtocolGenerator : AWSHttpBindingProtocolGenerator() {
    override val defaultContentType: String = "application/xml"
    override val defaultTimestampFormat: TimestampFormatTrait.Format = TimestampFormatTrait.Format.DATE_TIME
    override val protocol: ShapeId = RestXmlTrait.ID
    override val httpProtocolCustomizable = AWSHttpProtocolRestXMLCustomizations()
    override val httpResponseGenerator = HttpResponseGenerator(
        unknownServiceErrorSymbol,
        defaultTimestampFormat,
        XMLHttpResponseBindingOutputGenerator(),
        AWSRestXMLHttpResponseBindingErrorGenerator(),
        XMLHttpResponseBindingErrorInitGenerator(
            defaultTimestampFormat,
            AWSXMLHttpResponseTraitPayloadFactory()
        )
    )
    override val shouldRenderDecodableBodyStructForInputShapes = false
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
    )
    override val tagsToIgnore = setOf("defaults")

    override fun generateMessageMarshallable(ctx: ProtocolGenerator.GenerationContext) {
        var streamingShapes = outputStreamingShapes(ctx)
        val messageUnmarshallableGenerator = XMLMessageUnmarshallableGenerator(ctx)
        streamingShapes.forEach { streamingMember ->
            messageUnmarshallableGenerator.render(streamingMember)
        }
    }

    override fun generateMessageUnmarshallable(ctx: ProtocolGenerator.GenerationContext) {
        var streamingShapes = inputStreamingShapes(ctx)
        val messageMarshallableGenerator = XMLMessageMarshallableGenerator(ctx, defaultContentType)
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
