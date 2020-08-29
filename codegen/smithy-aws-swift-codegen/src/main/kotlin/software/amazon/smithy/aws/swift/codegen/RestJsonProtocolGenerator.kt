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
                renderInputRequestConformanceToEncodable(ctx, operation)
                inputShapesWithHttpBindings.add(inputShapeId)
            }
        }
        // This only considers the structures referenced from any input request structure for any operation
        renderConformanceToCodableForReferencedStructures(ctx)
        super.generateSerializers(ctx)
    }

    override fun getHttpFeatures(ctx: ProtocolGenerator.GenerationContext): List<HttpFeature> {
        val features = super.getHttpFeatures(ctx).toMutableList()
        val requestEncoderOptions = mutableMapOf<String, String>()
        val jsonFeatures = listOf(JSONRequestEncoder(requestEncoderOptions))
        features.addAll(jsonFeatures)
        return features
    }

    private fun getDateEncodingStrategy(timestampFormat: TimestampFormatTrait.Format): String {
        return when (timestampFormat) {
            TimestampFormatTrait.Format.DATE_TIME -> ".formatted(DateFormatter.iso8601DateFormatterWithFractionalSeconds)"
            TimestampFormatTrait.Format.HTTP_DATE -> ".formatted(DateFormatter.rfc5322DateFormatter)"
            // TODO:: handle this case
            TimestampFormatTrait.Format.EPOCH_SECONDS -> ""
            else -> ""
        }
    }

    private fun renderInputRequestConformanceToEncodable(ctx: ProtocolGenerator.GenerationContext, op: OperationShape) {
        if (op.input.isEmpty()) {
            return
        }
        val inputShape = ctx.model.expectShape(op.input.get())
        val opIndex = ctx.model.getKnowledge(OperationIndex::class.java)
        val inputShapeName = ServiceGenerator.getOperationInputShapeName(ctx.symbolProvider, opIndex, op)
        val requestPayloadMemberCodingKeys = getCodingKeysForPayloadMembers(ctx, op)

        ctx.delegator.useShapeWriter(inputShape) { writer ->
            writer.openBlock("extension ${inputShapeName!!.get()}: Encodable {", "}") {
                if (requestPayloadMemberCodingKeys.isNotEmpty()) {
                    writer.openBlock("private enum CodingKeys: String, CodingKey {", "}") {
                        writer.write("case ${requestPayloadMemberCodingKeys.joinToString(separator = ", ")}")
                    }
                }
            }
            writer.write("")
        }
    }

    private fun renderConformanceToCodableForReferencedStructures(ctx: ProtocolGenerator.GenerationContext) {
        val structuresNeedingCodableConformance = resolveStructuresNeedingCodableConformance(ctx)
        for (structureShape in structuresNeedingCodableConformance) {
            // conforming to Codable and Coding Keys enum are rendered as separate extensions
            renderDefaultConformanceToProtocolForStructure(ctx, structureShape, "Codable")
            renderCodingKeysForStructure(ctx, structureShape)
        }
    }

    // render empty conformance to Codable for Structure as an Extension
    private fun renderDefaultConformanceToProtocolForStructure(ctx: ProtocolGenerator.GenerationContext, structureShape: Shape, protocolName: String) {
        val structSymbol: Symbol = ctx.symbolProvider.toSymbol(structureShape)
        ctx.delegator.useShapeWriter(structureShape) { writer ->
            writer.write("extension ${structSymbol.name}: $protocolName {}")
            writer.write("")
        }
    }

    private fun renderCodingKeysForStructure(ctx: ProtocolGenerator.GenerationContext, structureShape: StructureShape) {
        val structSymbol: Symbol = ctx.symbolProvider.toSymbol(structureShape)
        val membersSortedByName: List<MemberShape> = structureShape.allMembers.values.sortedBy { ctx.symbolProvider.toMemberName(it) }
        val hasJSONNameTrait = membersSortedByName.any { it.hasTrait(JsonNameTrait::class.java) }
        if (hasJSONNameTrait) {
            val codingKeysEnumCases = mutableListOf<String>()
            for (member in membersSortedByName) {
                val memberName = ctx.symbolProvider.toMemberName(member)
                if (member.hasTrait(JsonNameTrait::class.java)) {
                    codingKeysEnumCases.add(constructEnumCaseForMemberWithJSONName(ctx, member))
                } else {
                    codingKeysEnumCases.add(memberName)
                }
            }

            ctx.delegator.useShapeWriter(structureShape) { writer ->
                writer.openBlock("extension ${structSymbol.name} {", "}") {
                    writer.openBlock("private enum CodingKeys: String, CodingKey {", "}") {
                        writer.write("case ${codingKeysEnumCases.joinToString(separator = ", ")}")
                    }
                }
                writer.write("")
            }
        }
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

    /**
     * Find and return the set of shapes that are not operation inputs but need `Codable` conformance.
     * Operation inputs confirm to `Encodable`, everything else confirms to `Codable`.
     *
     * @return The set of shapes that require a `Codable` conformance and possibly custom coding keys.
     */
    private fun resolveStructuresNeedingCodableConformance(ctx: ProtocolGenerator.GenerationContext): Set<StructureShape> {
        // all top level operation inputs conform to Encodable
        // any structure shape that shows up as a nested member (direct or indirect) confirms to Codable
        val topLevelMembers = getHttpBindingOperations(ctx)
                .filter { it.input.isPresent }
                .flatMap {
                    val inputShape = ctx.model.expectShape(it.input.get())
                    inputShape. members()
                }
                .map { ctx.model.expectShape(it.target) }
                .filter { it.isStructureShape || it is CollectionShape || it.isMapShape }
                .toSet()

        val resolved = mutableSetOf<StructureShape>()
        val walker = Walker(ctx.model)

        // walk all operation inputs that are of type struct and find all other
        // structs in the graph from that shape
        topLevelMembers.forEach { shape ->
            walker.iterateShapes(shape) { relationship ->
                when (relationship.relationshipType) {
                    RelationshipType.MEMBER_TARGET,
                    RelationshipType.STRUCTURE_MEMBER,
                    RelationshipType.LIST_MEMBER,
                    RelationshipType.SET_MEMBER,
                    RelationshipType.MAP_VALUE -> true
                    else -> false
                }
            }.forEach { walkedShape ->
                if (walkedShape.type == ShapeType.STRUCTURE) {
                    resolved.add(walkedShape as StructureShape)
                }
            }
        }
        return resolved
    }
}


class JSONRequestEncoder(private val requestEncoderOptions: MutableMap<String, String> = mutableMapOf()) : HttpRequestEncoder("JSONEncoder", requestEncoderOptions) {}
