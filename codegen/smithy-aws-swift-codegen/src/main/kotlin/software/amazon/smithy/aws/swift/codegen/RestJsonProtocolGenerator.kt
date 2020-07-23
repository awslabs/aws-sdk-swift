/*
 * Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
 *
 * Licensed under the Apache License, Version 2.0 (the "License").
 * You may not use this file except in compliance with the License.
 * A copy of the License is located at
 *
 *  http://aws.amazon.com/apache2.0
 *
 * or in the "license" file accompanying this file. This file is distributed
 * on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
 * express or implied. See the License for the specific language governing
 * permissions and limitations under the License.
 */
package software.amazon.smithy.aws.swift.codegen

import software.amazon.smithy.model.knowledge.HttpBinding
import software.amazon.smithy.model.knowledge.HttpBindingIndex
import software.amazon.smithy.model.knowledge.OperationIndex
import software.amazon.smithy.model.shapes.MemberShape
import software.amazon.smithy.model.shapes.OperationShape
import software.amazon.smithy.model.shapes.ShapeId
import software.amazon.smithy.swift.codegen.ServiceGenerator
import software.amazon.smithy.swift.codegen.integration.HttpBindingProtocolGenerator
import software.amazon.smithy.swift.codegen.integration.HttpFeature
import software.amazon.smithy.swift.codegen.integration.HttpRequestEncoder
import software.amazon.smithy.swift.codegen.integration.ProtocolGenerator


/**
 * Shared base protocol generator for all AWS JSON protocol variants
 */
abstract class RestJsonProtocolGenerator : HttpBindingProtocolGenerator() {

    override fun generateProtocolUnitTests(ctx: ProtocolGenerator.GenerationContext) {}

    override fun generateSerializers(ctx: ProtocolGenerator.GenerationContext) {
        // Generate extension on input requests to implement Codable protocol
        val inputShapesWithHttpBindings:MutableSet<ShapeId> = mutableSetOf()
        for (operation in getHttpBindingOperations(ctx)) {
            if (operation.input.isPresent) {
                val inputShapeId = operation.input.get()
                if (inputShapesWithHttpBindings.contains(inputShapeId)) {
                    // The input shape is referenced by more than one operation
                    continue
                }
                renderInputRequestConformanceToCodable(ctx, operation)
                inputShapesWithHttpBindings.add(inputShapeId)
            }
        }
        super.generateSerializers(ctx)
    }

    override fun getHttpFeatures(ctx: ProtocolGenerator.GenerationContext): List<HttpFeature> {
        val features = super.getHttpFeatures(ctx).toMutableList()
        val jsonFeatures = listOf(JSONRequestEncoder())
        features.addAll(jsonFeatures)
        return features
    }

    private fun renderInputRequestConformanceToCodable(ctx: ProtocolGenerator.GenerationContext, op: OperationShape) {
        if (op.input.isEmpty()) {
            return
        }
        val inputShape = ctx.model.expectShape(op.input.get())
        val opIndex = ctx.model.getKnowledge(OperationIndex::class.java)
        val inputShapeName = ServiceGenerator.getOperationInputShapeName(ctx.symbolProvider, opIndex, op)
        val requestPayloadMembers = getRequestPayloadMembers(ctx, op)

        if (requestPayloadMembers.isNotEmpty()) {
            ctx.delegator.useShapeWriter(inputShape) { writer ->
                writer.openBlock("extension ${inputShapeName!!.get()}: Codable {", "}") {
                    writer.openBlock("private enum CodingKeys: String, CodingKey {", "}") {
                        // TODO:: handle the case when encoding name is different from member name
                        writer.write("case ${requestPayloadMembers.joinToString(separator = ", ")}")
                    }
                }
                writer.write("")
            }
        }
    }

    private fun getRequestPayloadMembers(ctx: ProtocolGenerator.GenerationContext,
                                         op: OperationShape): MutableSet<String> {
        val requestPayloadMembers = mutableSetOf<String>()
        val bindingIndex = ctx.model.getKnowledge(HttpBindingIndex::class.java)
        val requestBindings = bindingIndex.getRequestBindings(op)
        val httpPayloadBinding = requestBindings.values.firstOrNull { it.location == HttpBinding.Location.PAYLOAD }

        /* Unbound document members that should be serialized into the document format for the protocol.
         */
        val documentMemberBindings = requestBindings.values
                .filter { it.location == HttpBinding.Location.DOCUMENT }
                .sortedBy { it.memberName }
        if (httpPayloadBinding != null) {
            val memberName = httpPayloadBinding.member.memberName
            requestPayloadMembers.add(memberName)
        } else if (documentMemberBindings.isNotEmpty()) {
            val documentMemberShapes = documentMemberBindings.map { it.member }
            val documentMemberShapesSortedByName: List<MemberShape> = documentMemberShapes.sortedBy { ctx.symbolProvider.toMemberName(it) }
            if (documentMemberShapesSortedByName.isNotEmpty()) {
                for (member in documentMemberShapesSortedByName) {
                    val memberName = ctx.symbolProvider.toMemberName(member)
                    requestPayloadMembers.add(memberName)
                }
            }
        }
        return requestPayloadMembers
    }
}


class JSONRequestEncoder : HttpRequestEncoder("JsonEncoder") {}
