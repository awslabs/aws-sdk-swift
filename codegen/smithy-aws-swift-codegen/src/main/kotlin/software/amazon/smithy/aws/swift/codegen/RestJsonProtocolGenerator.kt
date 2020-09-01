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

import software.amazon.smithy.codegen.core.Symbol
import software.amazon.smithy.model.knowledge.HttpBinding
import software.amazon.smithy.model.knowledge.HttpBindingIndex
import software.amazon.smithy.model.knowledge.OperationIndex
import software.amazon.smithy.model.neighbor.RelationshipType
import software.amazon.smithy.model.neighbor.Walker
import software.amazon.smithy.model.shapes.*
import software.amazon.smithy.model.traits.JsonNameTrait
import software.amazon.smithy.model.traits.TimestampFormatTrait
import software.amazon.smithy.swift.codegen.ServiceGenerator
import software.amazon.smithy.swift.codegen.SwiftWriter
import software.amazon.smithy.swift.codegen.defaultName
import software.amazon.smithy.swift.codegen.integration.*


/**
 * Shared base protocol generator for all AWS JSON protocol variants
 */
abstract class RestJsonProtocolGenerator : HttpBindingProtocolGenerator() {
    override val defaultTimestampFormat: TimestampFormatTrait.Format = TimestampFormatTrait.Format.EPOCH_SECONDS

    override fun generateProtocolUnitTests(ctx: ProtocolGenerator.GenerationContext) {
        val ignoredTests = setOf(
                "RestJsonListsSerializeNull", // TODO - sparse lists not supported - this test needs removed
                "RestJsonSerializesNullMapValues", // TODO - sparse maps not supported - this test needs removed
                // FIXME - document type not fully supported yet
                "InlineDocumentInput",
                "InlineDocumentAsPayloadInput",
                "InlineDocumentOutput",
                "InlineDocumentAsPayloadInputOutput"
        )

        val requestTestBuilder = HttpProtocolUnitTestRequestGenerator.Builder()

        // TODO:: add response generator too
        HttpProtocolTestGenerator(
                ctx,
                requestTestBuilder,
                ignoredTests
        ).generateProtocolTests()
    }

    override fun generateCodingKeysForStructure(ctx: ProtocolGenerator.GenerationContext, writer: SwiftWriter, shape: StructureShape) {
        val membersSortedByName: List<MemberShape> = shape.allMembers.values
            .sortedBy { ctx.symbolProvider.toMemberName(it) }
            .filter { it.isInHttpBody() }
        if (membersSortedByName.isEmpty()) { return }
        writer.openBlock("private enum CodingKeys: String, CodingKey {", "}") {
            for (member in membersSortedByName) {
                val memberName = ctx.symbolProvider.toMemberName(member)
                if (member.hasTrait(JsonNameTrait::class.java)) {
                    val jsonName = member.getTrait(JsonNameTrait::class.java).get().value
                    writer.write("case $memberName = \"$jsonName\"")
                } else {
                    writer.write("case $memberName")
                }
            }
        }
    }

    override fun getHttpFeatures(ctx: ProtocolGenerator.GenerationContext): List<HttpFeature> {
        val features = super.getHttpFeatures(ctx).toMutableList()
        val requestEncoderOptions = mutableMapOf<String, String>()
        val responseDecoderOptions = mutableMapOf<String, String>()
        features.add(JSONRequestEncoder(requestEncoderOptions))
        features.add(JSONResponseDecoder(responseDecoderOptions))
        return features
    }


    private fun constructEnumCaseForMemberWithJSONName(ctx: ProtocolGenerator.GenerationContext, memberShape: MemberShape): String {
        val memberName = ctx.symbolProvider.toMemberName(memberShape)
        return "$memberName = \"${memberShape.getTrait(JsonNameTrait::class.java).get().value}\""
    }

    private fun getCodingKeysForPayloadMembers(ctx: ProtocolGenerator.GenerationContext,
                                               op: OperationShape): MutableSet<String> {
        val requestPayloadMemberCodingKeys = mutableSetOf<String>()
        val bindingIndex = ctx.model.getKnowledge(HttpBindingIndex::class.java)
        val requestBindings = bindingIndex.getRequestBindings(op)
        val httpPayloadBinding = requestBindings.values.firstOrNull { it.location == HttpBinding.Location.PAYLOAD }

        /* Unbound document members that should be serialized into the document format for the protocol.
         */
        val documentMemberBindings = requestBindings.values
                .filter { it.location == HttpBinding.Location.DOCUMENT }
                .sortedBy { it.memberName }
        if (httpPayloadBinding != null) {
            val memberShape = httpPayloadBinding.member
            if (memberShape.hasTrait(JsonNameTrait::class.java)) {
                requestPayloadMemberCodingKeys.add(constructEnumCaseForMemberWithJSONName(ctx, memberShape))
            } else {
                requestPayloadMemberCodingKeys.add(memberShape.memberName)
            }
        } else if (documentMemberBindings.isNotEmpty()) {
            val documentMemberShapes = documentMemberBindings.map { it.member }
            val documentMemberShapesSortedByName: List<MemberShape> = documentMemberShapes.sortedBy { ctx.symbolProvider.toMemberName(it) }
            if (documentMemberShapesSortedByName.isNotEmpty()) {
                for (memberShape in documentMemberShapesSortedByName) {
                    if (memberShape.hasTrait(JsonNameTrait::class.java)) {
                        requestPayloadMemberCodingKeys.add(constructEnumCaseForMemberWithJSONName(ctx, memberShape))
                    } else {
                        requestPayloadMemberCodingKeys.add(memberShape.memberName)
                    }
                }
            }
        }
        return requestPayloadMemberCodingKeys
    }


}


class JSONRequestEncoder(private val requestEncoderOptions: MutableMap<String, String> = mutableMapOf()) : HttpRequestEncoder("JSONEncoder", requestEncoderOptions) {}
class JSONResponseDecoder(private val responseDecoderOptions: MutableMap<String, String> = mutableMapOf()) : HttpResponseDecoder("JSONDecoder", responseDecoderOptions) {}
