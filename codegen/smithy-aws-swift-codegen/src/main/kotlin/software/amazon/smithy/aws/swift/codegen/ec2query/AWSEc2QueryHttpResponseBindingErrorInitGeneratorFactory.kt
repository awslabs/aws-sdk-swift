/*
 * Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
 * SPDX-License-Identifier: Apache-2.0.
 */

package software.amazon.smithy.aws.swift.codegen.ec2query

import software.amazon.smithy.aws.swift.codegen.restxml.httpResponse.AWSXMLHTTPResponseTraitWithoutPayload
import software.amazon.smithy.model.shapes.Shape
import software.amazon.smithy.swift.codegen.SwiftWriter
import software.amazon.smithy.swift.codegen.integration.HTTPProtocolCustomizable
import software.amazon.smithy.swift.codegen.integration.HttpBindingDescriptor
import software.amazon.smithy.swift.codegen.integration.ProtocolGenerator
import software.amazon.smithy.swift.codegen.integration.httpResponse.HTTPResponseBindingRenderable
import software.amazon.smithy.swift.codegen.integration.httpResponse.bindingTraits.HTTPResponseTraitPayload
import software.amazon.smithy.swift.codegen.integration.httpResponse.bindingTraits.HTTPResponseTraitPayloadFactory
import software.amazon.smithy.swift.codegen.integration.httpResponse.bindingTraits.HTTPResponseTraitWithoutHTTPPayloadFactory

class AWSEC2QueryHTTPResponseTraitPayloadFactory : HTTPResponseTraitPayloadFactory {
    override fun construct(
        ctx: ProtocolGenerator.GenerationContext,
        responseBindings: List<HttpBindingDescriptor>,
        errorShape: Shape,
        writer: SwiftWriter,
        customizations: HTTPProtocolCustomizable,
    ): HTTPResponseBindingRenderable {
        return HTTPResponseTraitPayload(
            ctx,
            responseBindings,
            errorShape,
            writer,
            customizations,
            AWSEC2QueryHTTPResponseTraitWithoutHTTPPayloadFactory()
        )
    }
}

class AWSEC2QueryHTTPResponseTraitWithoutHTTPPayloadFactory : HTTPResponseTraitWithoutHTTPPayloadFactory {
    override fun construct(
        ctx: ProtocolGenerator.GenerationContext,
        responseBindings: List<HttpBindingDescriptor>,
        outputShape: Shape,
        writer: SwiftWriter
    ): HTTPResponseBindingRenderable {
        return AWSXMLHTTPResponseTraitWithoutPayload(ctx, responseBindings, outputShape, writer)
    }
}
