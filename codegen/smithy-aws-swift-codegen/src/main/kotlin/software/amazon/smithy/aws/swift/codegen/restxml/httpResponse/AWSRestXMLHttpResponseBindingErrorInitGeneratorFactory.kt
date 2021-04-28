package software.amazon.smithy.aws.swift.codegen.restxml

import software.amazon.smithy.aws.swift.codegen.restxml.httpResponse.AWSRestXMLHttpResponseTraitWithoutPayload
import software.amazon.smithy.codegen.core.Symbol
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

class AWSRestXMLHttpResponseBindingErrorInitGeneratorFactory : HttpResponseBindingErrorInitGeneratorFactory {
    override fun construct(
        ctx: ProtocolGenerator.GenerationContext,
        structureShape: StructureShape,
        httpBindingResolver: HttpBindingResolver,
        serviceErrorProtocolSymbol: Symbol,
        defaultTimestampFormat: TimestampFormatTrait.Format,
    ): HttpResponseBindingRenderable {
        return HttpResponseBindingErrorInitGenerator(
            ctx,
            structureShape,
            httpBindingResolver,
            serviceErrorProtocolSymbol,
            defaultTimestampFormat,
            AWSRestXMLHttpResponseTraitPayloadFactory()
        )
    }
}

class AWSRestXMLHttpResponseTraitPayloadFactory : HttpResponseTraitPayloadFactory {
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
            AWSRestXMLHttpResponseTraitWithoutHttpPayloadFactory()
        )
    }
}

class AWSRestXMLHttpResponseTraitWithoutHttpPayloadFactory : HttpResponseTraitWithoutHttpPayloadFactory {
    override fun construct(
        ctx: ProtocolGenerator.GenerationContext,
        responseBindings: List<HttpBindingDescriptor>,
        outputShapeName: String,
        writer: SwiftWriter
    ): HttpResponseBindingRenderable {
        return AWSRestXMLHttpResponseTraitWithoutPayload(ctx, responseBindings, outputShapeName, writer)
    }
}
