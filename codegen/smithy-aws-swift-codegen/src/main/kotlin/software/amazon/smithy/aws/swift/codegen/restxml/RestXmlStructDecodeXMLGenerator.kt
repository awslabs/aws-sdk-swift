package software.amazon.smithy.aws.swift.codegen.restxml

import software.amazon.smithy.aws.traits.customizations.S3UnwrappedXmlOutputTrait
import software.amazon.smithy.model.shapes.BlobShape
import software.amazon.smithy.model.shapes.CollectionShape
import software.amazon.smithy.model.shapes.MapShape
import software.amazon.smithy.model.shapes.MemberShape
import software.amazon.smithy.model.shapes.OperationShape
import software.amazon.smithy.model.shapes.TimestampShape
import software.amazon.smithy.model.traits.TimestampFormatTrait
import software.amazon.smithy.swift.codegen.SwiftTypes
import software.amazon.smithy.swift.codegen.SwiftWriter
import software.amazon.smithy.swift.codegen.integration.ProtocolGenerator
import software.amazon.smithy.swift.codegen.integration.serde.xml.StructDecodeXMLGenerator
import software.amazon.smithy.swift.codegen.model.ShapeMetadata
import software.amazon.smithy.swift.codegen.model.hasTrait

class RestXmlStructDecodeXMLGenerator(
    val ctx: ProtocolGenerator.GenerationContext,
    private val members: List<MemberShape>,
    private val metadata: Map<ShapeMetadata, Any>,
    private val writer: SwiftWriter,
    defaultTimestampFormat: TimestampFormatTrait.Format
) : StructDecodeXMLGenerator(ctx, members, metadata, writer, defaultTimestampFormat) {
    override fun render() {
        writer.openBlock("public init (from decoder: \$N) throws {", "}", SwiftTypes.Decoder) {
            if (members.isNotEmpty()) {
                renderDecodeBody()
            }
        }
    }

    private fun renderDecodeBody() {
        val containerName = "containerValues"
        if (responseBodyIsNotWrapped()) {
            writer.write("var $containerName = try decoder.unkeyedContainer()")
            members.forEach { member ->
                renderSingleMemberUnkeyed(member, containerName)
            }
        } else {
            writer.write("let $containerName = try decoder.container(keyedBy: CodingKeys.self)")
            members.forEach { member ->
                renderSingleMember(member, containerName)
            }
        }
    }
    private fun responseBodyIsNotWrapped(): Boolean {
        if (metadata.containsKey(ShapeMetadata.OPERATION_SHAPE)) {
            val operationShape = metadata[ShapeMetadata.OPERATION_SHAPE] as OperationShape
            if (operationShape.hasTrait<S3UnwrappedXmlOutputTrait>()) {
                return true
            }
        }
        return false
    }

    fun renderSingleMemberUnkeyed(member: MemberShape, containerName: String) {
        val memberTarget = ctx.model.expectShape(member.target)
        when (memberTarget) {
            is CollectionShape, is MapShape, is TimestampShape, is BlobShape -> {
                assert(false) { "Not implemented: renderSingleMemberUnkeyed - Collection, Map, Timestamp, Blob" }
            }
            else -> {
                renderScalarMember(member, memberTarget, containerName, true)
            }
        }
    }
}
