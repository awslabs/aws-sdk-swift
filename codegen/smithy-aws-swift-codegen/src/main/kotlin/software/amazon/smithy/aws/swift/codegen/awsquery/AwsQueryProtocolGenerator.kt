/*
 * Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
 * SPDX-License-Identifier: Apache-2.0.
 */

package software.amazon.smithy.aws.swift.codegen.awsquery

import software.amazon.smithy.aws.swift.codegen.AWSHttpBindingProtocolGenerator
import software.amazon.smithy.aws.swift.codegen.AWSHttpProtocolClientCustomizableFactory
import software.amazon.smithy.aws.swift.codegen.FormURLHttpBindingResolver
import software.amazon.smithy.aws.swift.codegen.restxml.AWSRestXMLHttpResponseBindingErrorGenerator
import software.amazon.smithy.aws.swift.codegen.restxml.AWSXMLHttpResponseBindingErrorInitGeneratorFactory
import software.amazon.smithy.aws.traits.protocols.AwsQueryTrait
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
import software.amazon.smithy.swift.codegen.middleware.MiddlewareStep
import software.amazon.smithy.swift.codegen.model.ShapeMetadata

open class AwsQueryProtocolGenerator : AWSHttpBindingProtocolGenerator() {
    // TODO: Rename defaultContentType to differentiate between request & response
    // Requests are:
    //  application/x-www-form-urlencoded
    // Responses are:
    //  text/xml
    override val codingKeysGenerator = DefaultCodingKeysGenerator(CodingKeysCustomizationXmlName())
    override val defaultContentType = "application/x-www-form-urlencoded"
    override val defaultTimestampFormat = TimestampFormatTrait.Format.DATE_TIME
    override val protocol: ShapeId = AwsQueryTrait.ID
    override val httpProtocolCustomizable = AWSHttpProtocolClientCustomizableFactory().constructClientCustomizable(protocol)
    override val httpResponseGenerator = HttpResponseGenerator(
        unknownServiceErrorSymbol,
        defaultTimestampFormat,
        AWSRestXMLHttpResponseBindingErrorGenerator(),
        AWSXMLHttpResponseBindingErrorInitGeneratorFactory()
    )

    override val serdeContext = HttpProtocolUnitTestGenerator.SerdeContext("FormURLEncoder()", "XMLDecoder()")
    override fun getProtocolHttpBindingResolver(ctx: ProtocolGenerator.GenerationContext, defaultContentType: String):
        HttpBindingResolver = FormURLHttpBindingResolver(ctx, defaultContentType)

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
        val customizations = AwsQueryFormURLEncodeCustomizations()
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
        val decoder = AwsQueryStructDecodeXMLGenerator(ctx, members, shapeMetadata, writer, defaultTimestampFormat)
        decoder.render()
    }

    override fun addProtocolSpecificMiddleware(ctx: ProtocolGenerator.GenerationContext, operation: OperationShape) {
        super.addProtocolSpecificMiddleware(ctx, operation)
        // Original instance of OperationInputBodyMiddleware checks if there is an HTTP Body, but for AWSQuery
        // we always need to have an InputBodyMiddleware
        operationMiddleware.removeMiddleware(operation, MiddlewareStep.SERIALIZESTEP, "OperationInputBodyMiddleware")
        operationMiddleware.appendMiddleware(operation, OperationInputBodyMiddleware(ctx.model, ctx.symbolProvider, true))

        val resolver = getProtocolHttpBindingResolver(ctx, defaultContentType)
        operationMiddleware.removeMiddleware(operation, MiddlewareStep.SERIALIZESTEP, "ContentTypeMiddleware")
        operationMiddleware.appendMiddleware(operation, ContentTypeMiddleware(ctx.model, ctx.symbolProvider, resolver.determineRequestContentType(operation), true))
    }
}
