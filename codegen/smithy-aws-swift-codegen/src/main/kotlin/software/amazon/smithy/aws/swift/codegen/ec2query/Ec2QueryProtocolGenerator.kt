/*
 * Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
 * SPDX-License-Identifier: Apache-2.0.
 */

package software.amazon.smithy.aws.swift.codegen.ec2query

import software.amazon.smithy.aws.swift.codegen.AWSClientRuntimeTypes
import software.amazon.smithy.aws.swift.codegen.AWSHttpBindingProtocolGenerator
import software.amazon.smithy.aws.swift.codegen.AWSHttpProtocolClientCustomizableFactory
import software.amazon.smithy.aws.swift.codegen.FormURLHttpBindingResolver
import software.amazon.smithy.aws.swift.codegen.ec2query.httpResponse.AWSEc2QueryHttpResponseBindingErrorGenerator
import software.amazon.smithy.aws.swift.codegen.ec2query.httpResponse.AWSEc2QueryHttpResponseTraitPayloadFactory
import software.amazon.smithy.aws.swift.codegen.message.XMLMessageMarshallableGenerator
import software.amazon.smithy.aws.swift.codegen.message.XMLMessageUnmarshallableGenerator
import software.amazon.smithy.aws.traits.protocols.Ec2QueryTrait
import software.amazon.smithy.model.shapes.MemberShape
import software.amazon.smithy.model.shapes.OperationShape
import software.amazon.smithy.model.shapes.Shape
import software.amazon.smithy.model.shapes.ShapeId
import software.amazon.smithy.model.traits.TimestampFormatTrait
import software.amazon.smithy.swift.codegen.SwiftWriter
import software.amazon.smithy.swift.codegen.integration.HttpBindingResolver
import software.amazon.smithy.swift.codegen.integration.ProtocolGenerator
import software.amazon.smithy.swift.codegen.integration.httpResponse.HttpResponseGenerator
import software.amazon.smithy.swift.codegen.integration.httpResponse.XMLHttpResponseBindingErrorInitGenerator
import software.amazon.smithy.swift.codegen.integration.httpResponse.XMLHttpResponseBindingOutputGenerator
import software.amazon.smithy.swift.codegen.integration.middlewares.ContentTypeMiddleware
import software.amazon.smithy.swift.codegen.integration.middlewares.OperationInputBodyMiddleware
import software.amazon.smithy.swift.codegen.integration.serde.struct.StructEncodeGenerator
import software.amazon.smithy.swift.codegen.integration.serde.struct.StructDecodeGenerator
import software.amazon.smithy.swift.codegen.middleware.MiddlewareStep
import software.amazon.smithy.swift.codegen.model.ShapeMetadata

class Ec2QueryProtocolGenerator : AWSHttpBindingProtocolGenerator() {
    override val defaultContentType = "application/x-www-form-urlencoded"
    override val defaultTimestampFormat = TimestampFormatTrait.Format.DATE_TIME
    override val protocol: ShapeId = Ec2QueryTrait.ID
    override val httpProtocolCustomizable = AWSHttpProtocolClientCustomizableFactory().constructClientCustomizable(protocol)
    override val httpResponseGenerator = HttpResponseGenerator(
        unknownServiceErrorSymbol,
        defaultTimestampFormat,
        XMLHttpResponseBindingOutputGenerator(),
        AWSEc2QueryHttpResponseBindingErrorGenerator(),
        XMLHttpResponseBindingErrorInitGenerator(
            defaultTimestampFormat,
            AWSClientRuntimeTypes.EC2Query.EC2QueryError,
            AWSEc2QueryHttpResponseTraitPayloadFactory(),
        )
    )

    override fun getProtocolHttpBindingResolver(ctx: ProtocolGenerator.GenerationContext, contentType: String):
        HttpBindingResolver = FormURLHttpBindingResolver(ctx, contentType)

    override val shouldRenderDecodableBodyStructForInputShapes = false
    override val shouldRenderEncodableConformance = true
    override val testsToIgnore = setOf(
        "SDKAppliedContentEncoding_ec2Query",
        "SDKAppendsGzipAndIgnoresHttpProvidedEncoding_ec2Query",
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

    override fun renderStructEncode(
        ctx: ProtocolGenerator.GenerationContext,
        shapeContainingMembers: Shape,
        shapeMetadata: Map<ShapeMetadata, Any>,
        members: List<MemberShape>,
        writer: SwiftWriter,
        defaultTimestampFormat: TimestampFormatTrait.Format,
        path: String?,
    ) {
        StructEncodeGenerator(ctx, shapeContainingMembers, members, shapeMetadata, writer).render()
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
        StructDecodeGenerator(ctx, shapeContainingMembers, members, mapOf(), writer).render()
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
