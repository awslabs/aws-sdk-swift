package software.amazon.smithy.aws.swift.codegen

import software.amazon.smithy.codegen.core.CodegenException
import software.amazon.smithy.codegen.core.Symbol
import software.amazon.smithy.model.shapes.MemberShape
import software.amazon.smithy.model.shapes.ShapeType
import software.amazon.smithy.model.shapes.UnionShape
import software.amazon.smithy.model.traits.EventHeaderTrait
import software.amazon.smithy.model.traits.EventPayloadTrait
import software.amazon.smithy.swift.codegen.ClientRuntimeTypes
import software.amazon.smithy.swift.codegen.SwiftDependency
import software.amazon.smithy.swift.codegen.SwiftWriter
import software.amazon.smithy.swift.codegen.integration.ProtocolGenerator
import software.amazon.smithy.swift.codegen.model.eventStreamEvents
import software.amazon.smithy.swift.codegen.model.hasTrait

class MessageMarshallableGenerator(
    private val ctx: ProtocolGenerator.GenerationContext,
    private val payloadContentType: String
) {
    internal fun render(streamShape: UnionShape) {
        val symbol: Symbol = ctx.symbolProvider.toSymbol(streamShape)
        val rootNamespace = ctx.settings.moduleName
        val streamMember = Symbol.builder()
            .definitionFile("./$rootNamespace/models/${symbol.name}+MessageMarshallable.swift")
            .name(symbol.name)
            .build()
        ctx.delegator.useShapeWriter(streamMember) { writer ->
            writer.addImport(SwiftDependency.CLIENT_RUNTIME.target)
            writer.openBlock(
                "extension ${symbol.fullName}: \$N {", "}",
                ClientRuntimeTypes.Serde.MessageMarshallable,
            ) {
                writer.openBlock(
                    "public func marshall(encoder: \$N) throws -> \$N {", "}",
                    ClientRuntimeTypes.Serde.RequestEncoder,
                    ClientRuntimeTypes.EventStream.Message
                ) {
                    writer.write(
                        "var headers: [\$N] = [.init(name: \":message-type\", value: .string(\"event\"))]",
                        ClientRuntimeTypes.EventStream.Header
                    )
                    writer.write("var payload: \$D", ClientRuntimeTypes.Core.Data)
                    writer.write("switch self {")
                    streamShape.eventStreamEvents(ctx.model).forEach { member ->
                        val memberName = ctx.symbolProvider.toMemberName(member)
                        writer.write("case .\$L(let value):", memberName)
                        writer.indent()
                        writer.addStringHeader(":event-type", member.memberName)
                        val variant = ctx.model.expectShape(member.target)
                        val eventHeaderBindings = variant.members().filter {
                            it.hasTrait<EventHeaderTrait>()
                        }
                        val eventPayloadBinding = variant.members().firstOrNull {
                            it.hasTrait<EventPayloadTrait>()
                        }
                        val unbound = variant.members().filterNot {
                            it.hasTrait<EventHeaderTrait>() || it.hasTrait<EventPayloadTrait>()
                        }

                        eventHeaderBindings.forEach {
                            renderSerializeEventHeader(ctx, it, writer)
                        }

                        when {
                            eventPayloadBinding != null -> renderSerializeEventPayload(ctx, eventPayloadBinding, writer)
                            unbound.isNotEmpty() -> {
                                writer.addStringHeader(":content-type", payloadContentType)
                                // get a payload serializer for the given members of the variant
                                writer.write("payload = try encoder.encode(value)")
                            }
                        }
                        writer.dedent()
                    }
                    writer.write("case .sdkUnknown(_):")
                    writer.indent()
                    writer.write(
                        "throw \$N.serializationFailed(\"cannot serialize the unknown event type!\")",
                        ClientRuntimeTypes.Core.ClientError
                    )
                    writer.dedent()
                    writer.write("}")
                    writer.write(
                        "return \$N(headers: headers, payload: payload ?? .init())",
                        ClientRuntimeTypes.EventStream.Message
                    )
                }
            }
        }
    }

    internal fun renderNotImplemented(streamShape: UnionShape) {
        val symbol: Symbol = ctx.symbolProvider.toSymbol(streamShape)
        val rootNamespace = ctx.settings.moduleName
        val streamMember = Symbol.builder()
            .definitionFile("./$rootNamespace/models/${symbol.name}+MessageMarshallable.swift")
            .name(symbol.name)
            .build()
        ctx.delegator.useShapeWriter(streamMember) { writer ->
            writer.addImport(SwiftDependency.CLIENT_RUNTIME.target)
            writer.openBlock(
                "extension ${symbol.fullName}: \$N {", "}",
                ClientRuntimeTypes.Serde.MessageMarshallable,
            ) {
                writer.openBlock(
                    "public func marshall(encoder: \$N) throws -> \$N {", "}",
                    ClientRuntimeTypes.Serde.RequestEncoder,
                    ClientRuntimeTypes.EventStream.Message
                ) {
                    writer.write("fatalError(\"not implemented\")")
                }
            }
        }
    }

    private fun SwiftWriter.addStringHeader(name: String, value: String) {
        write("headers.append(.init(name: \$S, value: .string(\$S)))", name, value)
    }

    private fun renderSerializeEventPayload(ctx: ProtocolGenerator.GenerationContext, member: MemberShape, writer: SwiftWriter) {
        val target = ctx.model.expectShape(member.target)
        val memberName = ctx.symbolProvider.toMemberName(member)
        when (target.type) {
            ShapeType.BLOB -> {
                writer.addStringHeader(":content-type", "application/octet-stream")
                writer.write("payload = value.\$L", memberName)
            }
            ShapeType.STRING -> {
                writer.addStringHeader(":content-type", "text/plain")
                writer.write("payload = value.\$L?.data(using: .utf8)", memberName)
            }
            ShapeType.STRUCTURE, ShapeType.UNION -> {
                writer.addStringHeader(":content-type", payloadContentType)
                writer.write("payload = try encoder.encode(value)")
            }
            else -> throw CodegenException("unsupported shape type `${target.type}` for target: $target; expected blob, string, structure, or union for eventPayload member: $member")
        }
    }

    private fun renderSerializeEventHeader(ctx: ProtocolGenerator.GenerationContext, member: MemberShape, writer: SwiftWriter) {
        val target = ctx.model.expectShape(member.target)
        val headerValue = when (target.type) {
            ShapeType.BOOLEAN -> "bool"
            ShapeType.BYTE -> "byte"
            ShapeType.SHORT -> "int16"
            ShapeType.INTEGER -> "int32"
            ShapeType.LONG -> "int64"
            ShapeType.BLOB -> "byteArray"
            ShapeType.STRING -> "string"
            ShapeType.TIMESTAMP -> "timestamp"
            else -> throw CodegenException("unsupported shape type `${target.type}` for eventHeader member `$member`; target: $target")
        }

        val memberName = ctx.symbolProvider.toMemberName(member)
        writer.openBlock("if let headerValue = value.\$L {", "}", memberName) {
            writer.write("headers.append(.init(name: \"${member.memberName}\", value: .\$L(headerValue)))", headerValue)
        }
    }
}
