package software.amazon.smithy.aws.swift.codegen.awsjson

import software.amazon.smithy.aws.swift.codegen.JsonProtocolBase
import software.amazon.smithy.aws.traits.protocols.AwsJson1_1Trait
import software.amazon.smithy.model.shapes.MemberShape
import software.amazon.smithy.model.shapes.ShapeId
import software.amazon.smithy.model.traits.JsonNameTrait
import software.amazon.smithy.model.traits.TimestampFormatTrait
import software.amazon.smithy.swift.codegen.SwiftWriter
import software.amazon.smithy.swift.codegen.integration.HttpBindingResolver
import software.amazon.smithy.swift.codegen.integration.ProtocolGenerator

class AwsJson1_1_ProtocolGenerator : JsonProtocolBase() {
    override val defaultContentType: String = "application/x-amz-json-1.1"
    override val defaultTimestampFormat: TimestampFormatTrait.Format = TimestampFormatTrait.Format.EPOCH_SECONDS
    override val protocol: ShapeId = AwsJson1_1Trait.ID

    override fun headersContentType(contentType: String, writer: SwiftWriter, hasHttpBody: Boolean,
                                    operationShape: String) {
        writer.write("builder.withHeader(name: \"Content-Type\", value: \"$contentType\")")
        writer.write("builder.withHeader(name: \"X-Amz-Target\", value: \"JsonProtocol.${operationShape}\")")
    }

    override fun getProtocolHttpBindingResolver(generationContext: ProtocolGenerator.GenerationContext):
            HttpBindingResolver = AwsJsonHttpBindingResolver(generationContext)

    override fun generateCodingKeysForMembers(ctx: ProtocolGenerator.GenerationContext, writer: SwiftWriter, members: List<MemberShape>) {
        val membersSortedByName: List<MemberShape> = members.sortedBy { it.memberName }
        if(membersSortedByName.isNotEmpty()) {
            writer.openBlock("private enum CodingKeys: String, CodingKey {", "}") {
                for (member in membersSortedByName) {
                    val originalMemberName = member.memberName
                    val modifiedMemberName = ctx.symbolProvider.toMemberName(member)
                    when {
                        member.hasTrait(JsonNameTrait::class.java) -> {
                            val jsonName = member.getTrait(JsonNameTrait::class.java).get().value
                            writer.write("case $modifiedMemberName = \"$jsonName\"")
                        }
                        originalMemberName == modifiedMemberName -> {
                            writer.write("case $modifiedMemberName")
                        }
                        else -> {
                            writer.write("case \$L = \$S", modifiedMemberName, originalMemberName)
                        }
                    }
                }
            }
        }
    }
}