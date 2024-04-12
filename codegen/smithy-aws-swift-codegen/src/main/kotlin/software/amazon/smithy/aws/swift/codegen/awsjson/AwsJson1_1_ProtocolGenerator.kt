/*
 * Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
 * SPDX-License-Identifier: Apache-2.0.
 */

package software.amazon.smithy.aws.swift.codegen.awsjson

import software.amazon.smithy.aws.swift.codegen.AWSClientRuntimeTypes
import software.amazon.smithy.aws.swift.codegen.AWSHttpBindingProtocolGenerator
import software.amazon.smithy.aws.swift.codegen.AWSHttpProtocolClientCustomizableFactory
import software.amazon.smithy.aws.swift.codegen.message.XMLMessageMarshallableGenerator
import software.amazon.smithy.aws.swift.codegen.message.XMLMessageUnmarshallableGenerator
import software.amazon.smithy.aws.swift.codegen.middleware.AWSXAmzTargetMiddleware
import software.amazon.smithy.aws.traits.protocols.AwsJson1_1Trait
import software.amazon.smithy.model.shapes.OperationShape
import software.amazon.smithy.model.shapes.ShapeId
import software.amazon.smithy.model.traits.TimestampFormatTrait
import software.amazon.smithy.swift.codegen.integration.HttpBindingResolver
import software.amazon.smithy.swift.codegen.integration.ProtocolGenerator
import software.amazon.smithy.swift.codegen.integration.httpResponse.HttpResponseGenerator
import software.amazon.smithy.swift.codegen.integration.httpResponse.XMLHttpResponseBindingErrorInitGenerator
import software.amazon.smithy.swift.codegen.integration.httpResponse.XMLHttpResponseBindingOutputGenerator
import software.amazon.smithy.swift.codegen.integration.middlewares.ContentTypeMiddleware
import software.amazon.smithy.swift.codegen.integration.middlewares.OperationInputBodyMiddleware
import software.amazon.smithy.swift.codegen.middleware.MiddlewareStep

class AwsJson1_1_ProtocolGenerator : AWSHttpBindingProtocolGenerator() {
    override val defaultContentType = "application/x-amz-json-1.1"
    override val defaultTimestampFormat = TimestampFormatTrait.Format.EPOCH_SECONDS
    override val protocol: ShapeId = AwsJson1_1Trait.ID
    override val httpProtocolCustomizable = AWSHttpProtocolClientCustomizableFactory().constructClientCustomizable(protocol)
    override val httpResponseGenerator = HttpResponseGenerator(
        unknownServiceErrorSymbol,
        defaultTimestampFormat,
        XMLHttpResponseBindingOutputGenerator(),
        AWSJsonHttpResponseBindingErrorGenerator(),
        XMLHttpResponseBindingErrorInitGenerator(defaultTimestampFormat, AWSClientRuntimeTypes.AWSJSON.AWSJSONError),
    )
    override val shouldRenderEncodableConformance: Boolean = true
    override val shouldRenderDecodableBodyStructForInputShapes: Boolean = true
    override val testsToIgnore = setOf(
        "SDKAppliedContentEncoding_awsJson1_1",
        "SDKAppendsGzipAndIgnoresHttpProvidedEncoding_awsJson1_1",
    )
    override val tagsToIgnore = setOf("defaults")
    override fun getProtocolHttpBindingResolver(ctx: ProtocolGenerator.GenerationContext, defaultContentType: String):
        HttpBindingResolver = AwsJsonHttpBindingResolver(ctx, defaultContentType)

    override fun addProtocolSpecificMiddleware(ctx: ProtocolGenerator.GenerationContext, operation: OperationShape) {
        super.addProtocolSpecificMiddleware(ctx, operation)

        operationMiddleware.appendMiddleware(operation, AWSXAmzTargetMiddleware(ctx.model, ctx.symbolProvider, ctx.service))
        // Original instance of OperationInputBodyMiddleware checks if there is an HTTP Body, but for AWSJson protocols
        // we always need to have an InputBodyMiddleware
        operationMiddleware.removeMiddleware(operation, MiddlewareStep.SERIALIZESTEP, "OperationInputBodyMiddleware")
        operationMiddleware.appendMiddleware(operation, OperationInputBodyMiddleware(ctx.model, ctx.symbolProvider, true))

        val resolver = getProtocolHttpBindingResolver(ctx, defaultContentType)
        operationMiddleware.removeMiddleware(operation, MiddlewareStep.SERIALIZESTEP, "ContentTypeMiddleware")
        operationMiddleware.appendMiddleware(operation, ContentTypeMiddleware(ctx.model, ctx.symbolProvider, resolver.determineRequestContentType(operation), true))
    }

    override fun generateMessageMarshallable(ctx: ProtocolGenerator.GenerationContext) {
        var streamingShapes = outputStreamingShapes(ctx)
        val messageUnmarshallableGenerator = XMLMessageUnmarshallableGenerator(ctx)
        streamingShapes.forEach { streamingMember ->
            messageUnmarshallableGenerator.render(streamingMember)
        }
    }

    override fun generateMessageUnmarshallable(ctx: ProtocolGenerator.GenerationContext) {
        val streamingShapes = inputStreamingShapes(ctx)
        val messageMarshallableGenerator = XMLMessageMarshallableGenerator(ctx, defaultContentType)
        for (streamingShape in streamingShapes) {
            messageMarshallableGenerator.render(streamingShape)
        }
    }
}
