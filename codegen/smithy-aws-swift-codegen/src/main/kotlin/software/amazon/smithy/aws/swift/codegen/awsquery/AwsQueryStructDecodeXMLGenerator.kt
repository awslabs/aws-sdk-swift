package software.amazon.smithy.aws.swift.codegen.awsquery

import software.amazon.smithy.model.shapes.MemberShape
import software.amazon.smithy.model.shapes.OperationShape
import software.amazon.smithy.model.traits.TimestampFormatTrait
import software.amazon.smithy.swift.codegen.ClientRuntimeTypes
import software.amazon.smithy.swift.codegen.SwiftTypes
import software.amazon.smithy.swift.codegen.SwiftWriter
import software.amazon.smithy.swift.codegen.integration.ProtocolGenerator
import software.amazon.smithy.swift.codegen.integration.serde.xml.StructDecodeXMLGenerator
import software.amazon.smithy.swift.codegen.model.ShapeMetadata

class AwsQueryStructDecodeXMLGenerator(
    ctx: ProtocolGenerator.GenerationContext,
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
        if (metadata.containsKey(ShapeMetadata.OPERATION_SHAPE)) {
            val topLevelContainerName = "topLevelContainer"
            writer.write("let $topLevelContainerName = try decoder.container(keyedBy: \$N.self)", ClientRuntimeTypes.Serde.Key)

            val operationShape = metadata[ShapeMetadata.OPERATION_SHAPE] as OperationShape
            val wrappedKeyValue = operationShape.id.name + "Result"
            writer.write("let $containerName = try $topLevelContainerName.nestedContainer(keyedBy: CodingKeys.self, forKey: \$N(\"$wrappedKeyValue\"))", ClientRuntimeTypes.Serde.Key)
        } else {
            writer.write("let $containerName = try decoder.container(keyedBy: CodingKeys.self)")
        }
        members.forEach { member ->
            renderSingleMember(member, containerName)
        }
    }
}
