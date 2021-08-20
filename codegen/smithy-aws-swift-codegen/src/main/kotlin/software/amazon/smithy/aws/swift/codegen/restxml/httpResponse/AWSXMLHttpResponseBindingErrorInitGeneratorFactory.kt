/*
 * Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
 * SPDX-License-Identifier: Apache-2.0.
 */

package software.amazon.smithy.aws.swift.codegen.restxml

import software.amazon.smithy.aws.swift.codegen.restxml.httpResponse.AWSXMLHttpResponseTraitWithoutPayload
import software.amazon.smithy.model.shapes.StructureShape
import software.amazon.smithy.model.traits.TimestampFormatTrait
import software.amazon.smithy.swift.codegen.SwiftWriter
import software.amazon.smithy.swift.codegen.integration.HttpBindingDescriptor
import software.amazon.smithy.swift.codegen.integration.HttpBindingResolver
import software.amazon.smithy.swift.codegen.integration.ProtocolGenerator
import software.amazon.smithy.swift.codegen.integration.httpResponse.HttpResponseBindingErrorInitGenerator
import software.amazon.smithy.swift.codegen.integration.httpResponse.HttpResponseBindingErrorInitGeneratorFactory
import software.amazon.smithy.swift.codegen.integration.httpResponse.HttpResponseBindingRenderable
import software.amazon.smithy.swift.codegen.integration.httpResponse.bindingTraits.HttpResponseTraitPayload
import software.amazon.smithy.swift.codegen.integration.httpResponse.bindingTraits.HttpResponseTraitPayloadFactory
import software.amazon.smithy.swift.codegen.integration.httpResponse.bindingTraits.HttpResponseTraitWithoutHttpPayloadFactory

class AWSXMLHttpResponseBindingErrorInitGeneratorFactory : HttpResponseBindingErrorInitGeneratorFactory {
    override fun construct(
        ctx: ProtocolGenerator.GenerationContext,
        structureShape: StructureShape,
        httpBindingResolver: HttpBindingResolver,
        defaultTimestampFormat: TimestampFormatTrait.Format,
    ): HttpResponseBindingRenderable {
        return HttpResponseBindingErrorInitGenerator(
            ctx,
            structureShape,
            httpBindingResolver,
            defaultTimestampFormat,
            AWSXMLHttpResponseTraitPayloadFactory()
        )
    }
}

class AWSXMLHttpResponseTraitPayloadFactory : HttpResponseTraitPayloadFactory {
    override fun construct(
        ctx: ProtocolGenerator.GenerationContext,
        responseBindings: List<HttpBindingDescriptor>,
        errorShapeName: String,
        writer: SwiftWriter
    ): HttpResponseBindingRenderable {
        return HttpResponseTraitPayload(
            ctx,
            responseBindings,
            errorShapeName,
            writer,
            AWSXMLHttpResponseTraitWithoutHttpPayloadFactory()
        )
    }
}

class AWSXMLHttpResponseTraitWithoutHttpPayloadFactory : HttpResponseTraitWithoutHttpPayloadFactory {
    override fun construct(
        ctx: ProtocolGenerator.GenerationContext,
        responseBindings: List<HttpBindingDescriptor>,
        outputShapeName: String,
        writer: SwiftWriter
    ): HttpResponseBindingRenderable {
        return AWSXMLHttpResponseTraitWithoutPayload(ctx, responseBindings, outputShapeName, writer)
    }
}
