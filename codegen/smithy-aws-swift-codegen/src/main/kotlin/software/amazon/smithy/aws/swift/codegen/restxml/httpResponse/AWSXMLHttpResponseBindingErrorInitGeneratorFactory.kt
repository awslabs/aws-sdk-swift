/*
 * Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
 * SPDX-License-Identifier: Apache-2.0.
 */

package software.amazon.smithy.aws.swift.codegen.restxml

import software.amazon.smithy.aws.swift.codegen.restxml.httpResponse.AWSXMLHttpResponseTraitWithoutPayload
import software.amazon.smithy.model.shapes.Shape
import software.amazon.smithy.swift.codegen.SwiftWriter
import software.amazon.smithy.swift.codegen.integration.HttpBindingDescriptor
import software.amazon.smithy.swift.codegen.integration.ProtocolGenerator
import software.amazon.smithy.swift.codegen.integration.httpResponse.HttpResponseBindingRenderable
import software.amazon.smithy.swift.codegen.integration.httpResponse.bindingTraits.HttpResponseTraitPayload
import software.amazon.smithy.swift.codegen.integration.httpResponse.bindingTraits.HttpResponseTraitPayloadFactory
import software.amazon.smithy.swift.codegen.integration.httpResponse.bindingTraits.HttpResponseTraitWithoutHttpPayloadFactory

class AWSXMLHttpResponseTraitPayloadFactory : HttpResponseTraitPayloadFactory {
    override fun construct(
        ctx: ProtocolGenerator.GenerationContext,
        responseBindings: List<HttpBindingDescriptor>,
        errorShape: Shape,
        writer: SwiftWriter
    ): HttpResponseBindingRenderable {
        return HttpResponseTraitPayload(
            ctx,
            responseBindings,
            errorShape,
            writer,
            AWSXMLHttpResponseTraitWithoutHttpPayloadFactory()
        )
    }
}

class AWSXMLHttpResponseTraitWithoutHttpPayloadFactory : HttpResponseTraitWithoutHttpPayloadFactory {
    override fun construct(
        ctx: ProtocolGenerator.GenerationContext,
        responseBindings: List<HttpBindingDescriptor>,
        outputShape: Shape,
        writer: SwiftWriter
    ): HttpResponseBindingRenderable {
        return AWSXMLHttpResponseTraitWithoutPayload(ctx, responseBindings, outputShape, writer)
    }
}
