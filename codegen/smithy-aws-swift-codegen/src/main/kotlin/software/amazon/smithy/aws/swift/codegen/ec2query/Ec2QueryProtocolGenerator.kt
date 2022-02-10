/*
 * Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
 * SPDX-License-Identifier: Apache-2.0.
 */

package software.amazon.smithy.aws.swift.codegen.ec2query

import software.amazon.smithy.aws.swift.codegen.AWSHttpBindingProtocolGenerator
import software.amazon.smithy.aws.swift.codegen.AWSHttpProtocolClientCustomizableFactory
import software.amazon.smithy.aws.swift.codegen.FormURLHttpBindingResolver
import software.amazon.smithy.aws.swift.codegen.ec2query.httpResponse.AWSEc2QueryHttpResponseBindingErrorGenerator
import software.amazon.smithy.aws.swift.codegen.ec2query.httpResponse.AWSEc2QueryHttpResponseBindingErrorInitGeneratorFactory
import software.amazon.smithy.aws.traits.protocols.Ec2QueryTrait
import software.amazon.smithy.model.shapes.MemberShape
import software.amazon.smithy.model.shapes.OperationShape
import software.amazon.smithy.model.shapes.Shape
import software.amazon.smithy.model.shapes.ShapeId
import software.amazon.smithy.model.traits.TimestampFormatTrait
import software.amazon.smithy.swift.codegen.SwiftWriter
import software.amazon.smithy.swift.codegen.integration.HttpBindingResolver
import software.amazon.smithy.swift.codegen.integration.HttpProtocolUnitTestGenerator
import software.amazon.smithy.swift.codegen.integration.ProtocolGenerator
import software.amazon.smithy.swift.codegen.integration.codingKeys.CodingKeysCustomizationXmlName
import software.amazon.smithy.swift.codegen.integration.codingKeys.DefaultCodingKeysGenerator
import software.amazon.smithy.swift.codegen.integration.httpResponse.HttpResponseGenerator
import software.amazon.smithy.swift.codegen.integration.middlewares.ContentTypeMiddleware
import software.amazon.smithy.swift.codegen.integration.middlewares.OperationInputBodyMiddleware
import software.amazon.smithy.swift.codegen.integration.serde.formurl.StructEncodeFormURLGenerator
import software.amazon.smithy.swift.codegen.integration.serde.xml.StructDecodeXMLGenerator
import software.amazon.smithy.swift.codegen.middleware.MiddlewareStep
import software.amazon.smithy.swift.codegen.model.ShapeMetadata

class Ec2QueryProtocolGenerator : AWSHttpBindingProtocolGenerator() {
    override val codingKeysGenerator = DefaultCodingKeysGenerator(CodingKeysCustomizationXmlName())
    override val defaultContentType = "application/x-www-form-urlencoded"
    override val defaultTimestampFormat = TimestampFormatTrait.Format.DATE_TIME
    override val protocol: ShapeId = Ec2QueryTrait.ID
    override val httpProtocolCustomizable = AWSHttpProtocolClientCustomizableFactory().constructClientCustomizable(protocol)
    override val httpResponseGenerator = HttpResponseGenerator(
        unknownServiceErrorSymbol,
        defaultTimestampFormat,
        AWSEc2QueryHttpResponseBindingErrorGenerator(),
        AWSEc2QueryHttpResponseBindingErrorInitGeneratorFactory()
    )

    override val serdeContext = HttpProtocolUnitTestGenerator.SerdeContext("FormURLEncoder()", "XMLDecoder()")
    override fun getProtocolHttpBindingResolver(ctx: ProtocolGenerator.GenerationContext, contentType: String):
        HttpBindingResolver = FormURLHttpBindingResolver(ctx, contentType)

    override val shouldRenderDecodableBodyStructForInputShapes = false
    override val shouldRenderCodingKeysForEncodable = false
    override val shouldRenderEncodableConformance = true
    override fun renderStructEncode(
        ctx: ProtocolGenerator.GenerationContext,
        shapeContainingMembers: Shape,
        shapeMetadata: Map<ShapeMetadata, Any>,
        members: List<MemberShape>,
        writer: SwiftWriter,
        defaultTimestampFormat: TimestampFormatTrait.Format,
    ) {
        val customizations = Ec2QueryFormURLEncodeCustomizations()
        val encoder = StructEncodeFormURLGenerator(ctx, customizations, shapeContainingMembers, shapeMetadata, members, writer, defaultTimestampFormat)
        encoder.render()
    }

    override fun renderStructDecode(
        ctx: ProtocolGenerator.GenerationContext,
        shapeMetadata: Map<ShapeMetadata, Any>,
        members: List<MemberShape>,
        writer: SwiftWriter,
        defaultTimestampFormat: TimestampFormatTrait.Format
    ) {
        val decoder = StructDecodeXMLGenerator(ctx, members, mapOf(), writer, defaultTimestampFormat)
        decoder.render()
    }

    override fun addProtocolSpecificMiddleware(ctx: ProtocolGenerator.GenerationContext, operation: OperationShape) {
        super.addProtocolSpecificMiddleware(ctx, operation)
        // Original instance of OperationInputBodyMiddleware checks if there is an HTTP Body, but for Ec2Query
        // we always need to have an InputBodyMiddleware
        operationMiddleware.removeMiddleware(operation, MiddlewareStep.SERIALIZESTEP, "OperationInputBodyMiddleware")
        operationMiddleware.appendMiddleware(operation, OperationInputBodyMiddleware(ctx.model, ctx.symbolProvider, true))

        val resolver = getProtocolHttpBindingResolver(ctx, defaultContentType)
        operationMiddleware.removeMiddleware(operation, MiddlewareStep.SERIALIZESTEP, "ContentTypeMiddleware")
        operationMiddleware.appendMiddleware(operation, ContentTypeMiddleware(ctx.model, ctx.symbolProvider, resolver.determineRequestContentType(operation), true))
    }
}
