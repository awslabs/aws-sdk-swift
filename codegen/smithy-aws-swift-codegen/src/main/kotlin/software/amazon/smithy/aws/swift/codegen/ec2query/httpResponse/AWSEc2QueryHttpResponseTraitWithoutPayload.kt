/*
 * Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
 * SPDX-License-Identifier: Apache-2.0.
 */

package software.amazon.smithy.aws.swift.codegen.ec2query.httpResponse

import software.amazon.smithy.aws.swift.codegen.AWSClientRuntimeTypes
import software.amazon.smithy.model.knowledge.HttpBinding
import software.amazon.smithy.model.shapes.BooleanShape
import software.amazon.smithy.model.shapes.ByteShape
import software.amazon.smithy.model.shapes.DoubleShape
import software.amazon.smithy.model.shapes.FloatShape
import software.amazon.smithy.model.shapes.IntegerShape
import software.amazon.smithy.model.shapes.LongShape
import software.amazon.smithy.model.shapes.Shape
import software.amazon.smithy.model.shapes.ShortShape
import software.amazon.smithy.model.traits.ErrorTrait
import software.amazon.smithy.model.traits.HttpQueryTrait
import software.amazon.smithy.swift.codegen.SwiftWriter
import software.amazon.smithy.swift.codegen.integration.HttpBindingDescriptor
import software.amazon.smithy.swift.codegen.integration.ProtocolGenerator
import software.amazon.smithy.swift.codegen.integration.httpResponse.HttpResponseBindingRenderable
import software.amazon.smithy.swift.codegen.model.hasTrait
import software.amazon.smithy.swift.codegen.model.isBoxed

class AWSEc2QueryHttpResponseTraitWithoutPayload(
    val ctx: ProtocolGenerator.GenerationContext,
    val responseBindings: List<HttpBindingDescriptor>,
    val outputShape: Shape,
    val writer: SwiftWriter
) : HttpResponseBindingRenderable {
    override fun render() {
        val bodyMembers = responseBindings.filter { it.location == HttpBinding.Location.DOCUMENT }

        val bodyMembersWithoutQueryTrait = bodyMembers
            .filter { !it.member.hasTrait(HttpQueryTrait::class.java) }
            .map { ctx.symbolProvider.toMemberName(it.member) }
            .toMutableSet()

        if (bodyMembersWithoutQueryTrait.isNotEmpty()) {
            writer.write("if let data = try await httpResponse.body.readData(), let responseDecoder = decoder {")
            writer.indent()
            renderWithoutErrorResponseContainer(outputShape, bodyMembersWithoutQueryTrait)

            writer.dedent()
            writer.write("} else {")
            writer.indent()
            val path = "properties.".takeIf { outputShape.hasTrait<ErrorTrait>() } ?: ""
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
                writer.write("$path$memberName = $value")
            }
            writer.dedent()
            writer.write("}")
        }
    }

    fun renderWithoutErrorResponseContainer(outputShape: Shape, bodyMembersWithoutQueryTrait: Set<String>) {
        val outputShapeName = ctx.symbolProvider.toSymbol(outputShape).name
        writer.addImport(AWSClientRuntimeTypes.EC2Query.Ec2NarrowedResponse)
        writer.write("let output: \$N<${outputShapeName}Body> = try responseDecoder.decode(responseBody: data)", AWSClientRuntimeTypes.EC2Query.Ec2NarrowedResponse)
        bodyMembersWithoutQueryTrait.sorted().forEach {
            writer.write("self.properties.$it = output.errors.error.$it")
        }
    }
}
