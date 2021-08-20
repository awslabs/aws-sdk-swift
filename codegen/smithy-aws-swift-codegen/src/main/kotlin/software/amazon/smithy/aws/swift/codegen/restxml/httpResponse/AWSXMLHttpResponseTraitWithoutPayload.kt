/*
 * Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
 * SPDX-License-Identifier: Apache-2.0.
 */

package software.amazon.smithy.aws.swift.codegen.restxml.httpResponse

import software.amazon.smithy.aws.swift.codegen.AWSClientRuntimeTypes.RestXML.ErrorResponseContainer
import software.amazon.smithy.aws.traits.protocols.RestXmlTrait
import software.amazon.smithy.model.knowledge.HttpBinding
import software.amazon.smithy.model.shapes.BooleanShape
import software.amazon.smithy.model.shapes.ByteShape
import software.amazon.smithy.model.shapes.DoubleShape
import software.amazon.smithy.model.shapes.FloatShape
import software.amazon.smithy.model.shapes.IntegerShape
import software.amazon.smithy.model.shapes.LongShape
import software.amazon.smithy.model.shapes.ShortShape
import software.amazon.smithy.model.traits.HttpQueryTrait
import software.amazon.smithy.swift.codegen.SwiftWriter
import software.amazon.smithy.swift.codegen.integration.HttpBindingDescriptor
import software.amazon.smithy.swift.codegen.integration.ProtocolGenerator
import software.amazon.smithy.swift.codegen.integration.httpResponse.HttpResponseBindingRenderable
import software.amazon.smithy.swift.codegen.model.getTrait
import software.amazon.smithy.swift.codegen.model.isBoxed

class AWSXMLHttpResponseTraitWithoutPayload(
    val ctx: ProtocolGenerator.GenerationContext,
    val responseBindings: List<HttpBindingDescriptor>,
    val outputShapeName: String,
    val writer: SwiftWriter
) : HttpResponseBindingRenderable {
    override fun render() {
        val bodyMembers = responseBindings.filter { it.location == HttpBinding.Location.DOCUMENT }

        val bodyMembersWithoutQueryTrait = bodyMembers
            .filter { !it.member.hasTrait(HttpQueryTrait::class.java) }
            .map { ctx.symbolProvider.toMemberName(it.member) }
            .toMutableSet()

        if (bodyMembersWithoutQueryTrait.isNotEmpty()) {
            writer.write("if case .stream(let reader) = httpResponse.body,")
            writer.indent()
            writer.write("let responseDecoder = decoder {")
            writer.write("let data = reader.toBytes().toData()")
            if (serviceDisablesWrappingOfErrorProperties()) {
                renderWithoutErrorResponseContainer(outputShapeName, bodyMembersWithoutQueryTrait)
            } else {
                renderWithErrorResponseContainer(outputShapeName, bodyMembersWithoutQueryTrait)
            }
            writer.dedent()
            writer.write("} else {")
            writer.indent()
            bodyMembers.sortedBy { it.memberName }.forEach {
                val memberName = ctx.symbolProvider.toMemberName(it.member)
                val type = ctx.model.expectShape(it.member.target)
                val value = if (ctx.symbolProvider.toSymbol(it.member).isBoxed()) "nil" else {
                    when (type) {
                        is IntegerShape, is ByteShape, is ShortShape, is LongShape -> 0
                        is FloatShape, is DoubleShape -> 0.0
                        is BooleanShape -> false
                        else -> "nil"
                    }
                }
                writer.write("self.$memberName = $value")
            }
            writer.dedent()
            writer.write("}")
        }
    }

    fun serviceDisablesWrappingOfErrorProperties(): Boolean {
        ctx.service.getTrait<RestXmlTrait>()?.let {
            return it.isNoErrorWrapping
        }
        return false
    }

    fun renderWithoutErrorResponseContainer(outputShapeName: String, bodyMembersWithoutQueryTrait: Set<String>) {
        writer.write("let output: ${outputShapeName}Body = try responseDecoder.decode(responseBody: data)")
        bodyMembersWithoutQueryTrait.sorted().forEach {
            writer.write("self.$it = output.$it")
        }
    }

    fun renderWithErrorResponseContainer(outputShapeName: String, bodyMembersWithoutQueryTrait: Set<String>) {
        writer.addImport(ErrorResponseContainer)
        writer.write("let output: \$N<${outputShapeName}Body> = try responseDecoder.decode(responseBody: data)", ErrorResponseContainer)
        bodyMembersWithoutQueryTrait.sorted().forEach {
            writer.write("self.$it = output.error.$it")
        }
    }
}
