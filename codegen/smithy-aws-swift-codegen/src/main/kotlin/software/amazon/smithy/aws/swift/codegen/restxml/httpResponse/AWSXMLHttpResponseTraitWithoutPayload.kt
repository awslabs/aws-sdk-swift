/*
 * Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
 * SPDX-License-Identifier: Apache-2.0.
 */

package software.amazon.smithy.aws.swift.codegen.restxml.httpResponse

import software.amazon.smithy.model.knowledge.HttpBinding
import software.amazon.smithy.model.shapes.Shape
import software.amazon.smithy.model.traits.HttpQueryTrait
import software.amazon.smithy.swift.codegen.SwiftWriter
import software.amazon.smithy.swift.codegen.integration.HttpBindingDescriptor
import software.amazon.smithy.swift.codegen.integration.ProtocolGenerator
import software.amazon.smithy.swift.codegen.integration.httpResponse.HttpResponseBindingRenderable
import software.amazon.smithy.swift.codegen.integration.serde.xml.MemberShapeDecodeXMLGenerator

class AWSXMLHttpResponseTraitWithoutPayload(
    val ctx: ProtocolGenerator.GenerationContext,
    val responseBindings: List<HttpBindingDescriptor>,
    val outputShape: Shape,
    val writer: SwiftWriter
) : HttpResponseBindingRenderable {
    override fun render() {
        val bodyMembersWithoutQueryTrait = responseBindings.filter { it.location == HttpBinding.Location.DOCUMENT }
            .filter { !it.member.hasTrait(HttpQueryTrait::class.java) }
            .map { it.member }
            .toSet()
        val generator = MemberShapeDecodeXMLGenerator(ctx, writer, outputShape)
        bodyMembersWithoutQueryTrait.sortedBy { it.memberName }.forEach { generator.render(it) }
    }
}
