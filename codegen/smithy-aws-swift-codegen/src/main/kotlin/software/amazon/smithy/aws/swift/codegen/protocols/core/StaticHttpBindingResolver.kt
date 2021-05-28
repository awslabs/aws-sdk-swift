package software.amazon.smithy.aws.swift.codegen.protocols.core

import software.amazon.smithy.model.knowledge.HttpBinding
import software.amazon.smithy.model.shapes.MemberShape
import software.amazon.smithy.model.shapes.OperationShape
import software.amazon.smithy.model.shapes.Shape
import software.amazon.smithy.model.shapes.StructureShape
import software.amazon.smithy.model.traits.HttpHeaderTrait
import software.amazon.smithy.model.traits.HttpLabelTrait
import software.amazon.smithy.model.traits.HttpPayloadTrait
import software.amazon.smithy.model.traits.HttpPrefixHeadersTrait
import software.amazon.smithy.model.traits.HttpQueryTrait
import software.amazon.smithy.model.traits.HttpResponseCodeTrait
import software.amazon.smithy.model.traits.HttpTrait
import software.amazon.smithy.swift.codegen.integration.HttpBindingDescriptor
import software.amazon.smithy.swift.codegen.integration.HttpBindingResolver
import software.amazon.smithy.swift.codegen.integration.ProtocolGenerator
import software.amazon.smithy.swift.codegen.model.expectTrait
import software.amazon.smithy.swift.codegen.model.hasTrait

open class StaticHttpBindingResolver(
    private val context: ProtocolGenerator.GenerationContext,
    private val httpTrait: HttpTrait
) : HttpBindingResolver {
    override fun httpTrait(operationShape: OperationShape): HttpTrait {
        return httpTrait
    }

    override fun requestBindings(operationShape: OperationShape): List<HttpBindingDescriptor> {
        if (!operationShape.input.isPresent) {
            return emptyList()
        }
        val input = context.model.expectShape(operationShape.input.get())
        return input.members().map { member ->
            HttpBindingDescriptor(member, HttpBinding.Location.DOCUMENT, "")
        }.toList()
    }

    override fun responseBindings(shape: Shape): List<HttpBindingDescriptor> = when (shape) {
        is OperationShape ->
            shape
                .output
                .map { context.model.expectShape(it).members() }
                .orElseGet { emptyList() }
                .map { member -> HttpBindingDescriptor(member, HttpBinding.Location.DOCUMENT, "") }
        is StructureShape -> shape.members().map { member -> member.toHttpBindingDescriptor() }.toList()
        else -> error("unimplemented shape type for http response bindings: $shape")
    }
}

// Create a [HttpBindingDescriptor] based on traits on [MemberShape]
// See https://awslabs.github.io/smithy/1.0/spec/core/http-traits.html
private fun MemberShape.toHttpBindingDescriptor(): HttpBindingDescriptor =
    when {
        hasTrait<HttpHeaderTrait>() -> HttpBindingDescriptor(this, HttpBinding.Location.HEADER, expectTrait<HttpHeaderTrait>().value)
        hasTrait<HttpLabelTrait>() -> HttpBindingDescriptor(this, HttpBinding.Location.LABEL, "")
        hasTrait<HttpPayloadTrait>() -> HttpBindingDescriptor(this, HttpBinding.Location.PAYLOAD, "")
        hasTrait<HttpQueryTrait>() -> HttpBindingDescriptor(this, HttpBinding.Location.QUERY, expectTrait<HttpQueryTrait>().value)
        hasTrait<HttpResponseCodeTrait>() -> HttpBindingDescriptor(this, HttpBinding.Location.RESPONSE_CODE, "")
        hasTrait<HttpPrefixHeadersTrait>() -> HttpBindingDescriptor(this, HttpBinding.Location.PREFIX_HEADERS, expectTrait<HttpPrefixHeadersTrait>().value)
        // By default, all structure members that are not bound as part of the HTTP message are
        // serialized in a protocol-specific document sent in the body of the message
        else -> HttpBindingDescriptor(this, HttpBinding.Location.DOCUMENT, "")
        // NOTE: Unsure of where (if anywhere) HttpBinding.Location.UNBOUND should be modeled
    }
