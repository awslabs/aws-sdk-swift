package software.amazon.smithy.aws.swift.codegen

import software.amazon.smithy.model.shapes.MemberShape
import software.amazon.smithy.model.traits.JsonNameTrait
import software.amazon.smithy.swift.codegen.SwiftWriter
import software.amazon.smithy.swift.codegen.integration.CodingKeysGenerator
import software.amazon.smithy.swift.codegen.integration.ProtocolGenerator

class AWSCodingKeysGenerator : CodingKeysGenerator {
    override fun generateCodingKeysForMembers(ctx: ProtocolGenerator.GenerationContext, writer: SwiftWriter, members: List<MemberShape>) {
        val membersSortedByName: List<MemberShape> = members.sortedBy { it.memberName }
        if (membersSortedByName.isNotEmpty()) {
            writer.openBlock("private enum CodingKeys: String, CodingKey {", "}") {
                for (member in membersSortedByName) {
                    val originalMemberName = member.memberName
                    val modifiedMemberName = ctx.symbolProvider.toMemberName(member)

                    /* If we have modified the member name to make it idiomatic to the language
                       like handling reserved keyword with appending an underscore or lowercasing the first letter,
                       we need to change the coding key accordingly so that during encoding and decoding, the modified member
                       name is transformed back to original name or specified JsonName before it hits the service.
                     */
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
