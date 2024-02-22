/*
 * Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
 * SPDX-License-Identifier: Apache-2.0.
 */

package software.amazon.smithy.aws.swift.codegen.restxml

import software.amazon.smithy.aws.swift.codegen.AWSHttpBindingProtocolGenerator
import software.amazon.smithy.aws.swift.codegen.XMLMessageUnmarshallableGenerator
import software.amazon.smithy.aws.traits.protocols.RestXmlTrait
import software.amazon.smithy.model.shapes.MemberShape
import software.amazon.smithy.model.shapes.Shape
import software.amazon.smithy.model.shapes.ShapeId
import software.amazon.smithy.model.traits.TimestampFormatTrait
import software.amazon.smithy.swift.codegen.SwiftWriter
import software.amazon.smithy.swift.codegen.integration.ProtocolGenerator
import software.amazon.smithy.swift.codegen.integration.httpResponse.HttpResponseGenerator
import software.amazon.smithy.swift.codegen.integration.httpResponse.XMLHttpResponseBindingOutputGenerator
import software.amazon.smithy.swift.codegen.integration.serde.json.StructEncodeXMLGenerator
import software.amazon.smithy.swift.codegen.integration.serde.xml.StructDecodeXMLGenerator
import software.amazon.smithy.swift.codegen.model.ShapeMetadata

class RestXmlProtocolGenerator : AWSHttpBindingProtocolGenerator() {
    override val codingKeysGenerator = null
    override val defaultContentType: String = "application/xml"
    override val defaultTimestampFormat: TimestampFormatTrait.Format = TimestampFormatTrait.Format.DATE_TIME
    override val protocol: ShapeId = RestXmlTrait.ID
    override val httpProtocolCustomizable = AWSHttpProtocolRestXMLCustomizations()
    override val httpResponseGenerator = HttpResponseGenerator(
        unknownServiceErrorSymbol,
        defaultTimestampFormat,
        XMLHttpResponseBindingOutputGenerator(),
        AWSRestXMLHttpResponseBindingErrorGenerator(),
        AWSXMLHttpResponseBindingErrorInitGeneratorFactory(),
    )
    override val shouldRenderDecodableBodyStructForInputShapes = false
    override val shouldRenderCodingKeysForEncodable = false
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

    override val codableProtocol = null
    override val encodableProtocol = null
    override val decodableProtocol = null

    override fun generateMessageMarshallable(ctx: ProtocolGenerator.GenerationContext) {
        var streamingShapes = outputStreamingShapes(ctx)
        val messageUnmarshallableGenerator = XMLMessageUnmarshallableGenerator(ctx)
        streamingShapes.forEach { streamingMember ->
            messageUnmarshallableGenerator.render(streamingMember)
        }
    }

    override fun generateDeserializers(ctx: ProtocolGenerator.GenerationContext) {
        super.generateDeserializers(ctx)
        val errorShapes = resolveErrorShapes(ctx)
        for (shape in errorShapes) {
            renderCodableExtension(ctx, shape, false, true)
        }
    }

    override fun renderStructEncode(
        ctx: ProtocolGenerator.GenerationContext,
        shapeContainingMembers: Shape,
        shapeMetadata: Map<ShapeMetadata, Any>,
        members: List<MemberShape>,
        writer: SwiftWriter,
        defaultTimestampFormat: TimestampFormatTrait.Format,
        path: String?,
    ) {
        StructEncodeXMLGenerator(
            ctx,
            shapeContainingMembers,
            members,
            writer
        ).render()
    }

    override fun renderStructDecode(
        ctx: ProtocolGenerator.GenerationContext,
        shapeContainingMembers: Shape,
        shapeMetadata: Map<ShapeMetadata, Any>,
        members: List<MemberShape>,
        writer: SwiftWriter,
        defaultTimestampFormat: TimestampFormatTrait.Format,
        path: String,
    ) {
        StructDecodeXMLGenerator(
            ctx,
            shapeContainingMembers,
            members,
            shapeMetadata,
            writer,
        ).render()
    }

    override fun renderBodyStructAndDecodableExtension(
        ctx: ProtocolGenerator.GenerationContext,
        shape: Shape,
        metadata: Map<ShapeMetadata, Any>
    ) {
        // No operation
    }
}
