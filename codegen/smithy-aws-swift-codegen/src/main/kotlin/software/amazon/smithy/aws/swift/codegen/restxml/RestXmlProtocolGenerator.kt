/*
 * Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
 * SPDX-License-Identifier: Apache-2.0.
 */

package software.amazon.smithy.aws.swift.codegen.restxml

import software.amazon.smithy.aws.swift.codegen.AWSHttpBindingProtocolGenerator
import software.amazon.smithy.aws.traits.protocols.RestXmlTrait
import software.amazon.smithy.model.shapes.MemberShape
import software.amazon.smithy.model.shapes.Shape
import software.amazon.smithy.model.shapes.ShapeId
import software.amazon.smithy.model.traits.TimestampFormatTrait
import software.amazon.smithy.swift.codegen.SwiftWriter
import software.amazon.smithy.swift.codegen.integration.ProtocolGenerator
import software.amazon.smithy.swift.codegen.integration.codingKeys.CodingKeysCustomizationXmlName
import software.amazon.smithy.swift.codegen.integration.codingKeys.CodingKeysGenerator
import software.amazon.smithy.swift.codegen.integration.codingKeys.DefaultCodingKeysGenerator
import software.amazon.smithy.swift.codegen.integration.httpResponse.HttpResponseGenerator
import software.amazon.smithy.swift.codegen.integration.serde.json.StructEncodeXMLGenerator
import software.amazon.smithy.swift.codegen.integration.serde.xml.StructDecodeXMLGenerator
import software.amazon.smithy.swift.codegen.model.ShapeMetadata

class RestXmlProtocolGenerator : AWSHttpBindingProtocolGenerator() {
    override val codingKeysGenerator: CodingKeysGenerator = DefaultCodingKeysGenerator(CodingKeysCustomizationXmlName())
    override val defaultContentType: String = "application/xml"
    override val defaultTimestampFormat: TimestampFormatTrait.Format = TimestampFormatTrait.Format.DATE_TIME
    override val protocol: ShapeId = RestXmlTrait.ID
    override val httpProtocolCustomizable = AWSHttpProtocolRestXMLCustomizations()
    override val httpResponseGenerator = HttpResponseGenerator(
        unknownServiceErrorSymbol,
        defaultTimestampFormat,
        AWSRestXMLHttpResponseBindingErrorGenerator(),
        AWSXMLHttpResponseBindingErrorInitGeneratorFactory()
    )
    override val shouldRenderDecodableBodyStructForInputShapes = false
    override val serdeContext = serdeContextXML
    override val testsToIgnore = setOf(
        "S3DefaultAddressing",
        "S3VirtualHostAddressing",
        "S3PathAddressing",
        "S3VirtualHostDualstackAddressing",
        "S3VirtualHostAccelerateAddressing",
        "S3VirtualHostDualstackAccelerateAddressing",
        "S3OperationAddressingPreferred",
        "S3EscapeObjectKeyInUriLabel",
        "S3EscapePathObjectKeyInUriLabel",
        "SDKAppliedContentEncoding_restXml",
        "SDKAppendedGzipAfterProvidedEncoding_restXml",
        "S3OperationNoErrorWrappingResponse"
    )

    override val codableProtocol = null
    override val encodableProtocol = null
    override val decodableProtocol = null

    override fun renderStructEncode(
        ctx: ProtocolGenerator.GenerationContext,
        shapeContainingMembers: Shape,
        shapeMetadata: Map<ShapeMetadata, Any>,
        members: List<MemberShape>,
        writer: SwiftWriter,
        defaultTimestampFormat: TimestampFormatTrait.Format,
        path: String?
    ) {
        val encoder = StructEncodeXMLGenerator(ctx, shapeContainingMembers, members, writer)
        encoder.render()
    }

    override fun renderStructDecode(
        ctx: ProtocolGenerator.GenerationContext,
        shapeContainingMembers: Shape,
        shapeMetadata: Map<ShapeMetadata, Any>,
        members: List<MemberShape>,
        writer: SwiftWriter,
        defaultTimestampFormat: TimestampFormatTrait.Format,
        path: String
    ) {
        val decoder = StructDecodeXMLGenerator(ctx, shapeContainingMembers, members, shapeMetadata, writer, defaultTimestampFormat)
        decoder.render()
    }
}
