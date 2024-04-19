package software.amazon.smithy.aws.swift.codegen.message

import software.amazon.smithy.codegen.core.CodegenException
import software.amazon.smithy.codegen.core.Symbol
import software.amazon.smithy.model.shapes.MemberShape
import software.amazon.smithy.model.shapes.Shape
import software.amazon.smithy.model.shapes.ShapeType
import software.amazon.smithy.model.shapes.UnionShape
import software.amazon.smithy.model.traits.EventHeaderTrait
import software.amazon.smithy.model.traits.EventPayloadTrait
import software.amazon.smithy.swift.codegen.ClientRuntimeTypes
import software.amazon.smithy.swift.codegen.SwiftDependency
import software.amazon.smithy.swift.codegen.SwiftWriter
import software.amazon.smithy.swift.codegen.integration.ProtocolGenerator
import software.amazon.smithy.swift.codegen.integration.serde.readwrite.NodeInfoUtils
import software.amazon.smithy.swift.codegen.integration.serde.readwrite.WritingClosureUtils
import software.amazon.smithy.swift.codegen.integration.serde.readwrite.responseWireProtocol
import software.amazon.smithy.swift.codegen.integration.serde.struct.writerSymbol
import software.amazon.smithy.swift.codegen.model.eventStreamEvents
import software.amazon.smithy.swift.codegen.model.hasTrait

class MessageMarshallableGenerator(
    private val ctx: ProtocolGenerator.GenerationContext,
    private val payloadContentType: String
) {
    internal fun render(streamShape: UnionShape) {
        val streamSymbol: Symbol = ctx.symbolProvider.toSymbol(streamShape)
        val rootNamespace = ctx.settings.moduleName
        val streamMember = Symbol.builder()
            .definitionFile("./$rootNamespace/models/${streamSymbol.name}+MessageMarshallable.swift")
            .name(streamSymbol.name)
            .build()
        ctx.delegator.useShapeWriter(streamMember) { writer ->
            writer.apply {
                addImport(SwiftDependency.CLIENT_RUNTIME.target)
                openBlock("extension \$L {", "}", streamSymbol.fullName) {
                    openBlock(
                        "static var marshal: \$N<\$N> {", "}",
                        ClientRuntimeTypes.EventStream.MarshalClosure,
                        streamSymbol
                    ) {
                        openBlock("{ (self) in", "}") {
                            write(
                                "var headers: [\$N] = [.init(name: \":message-type\", value: .string(\"event\"))]",
                                ClientRuntimeTypes.EventStream.Header
                            )
                            write("var payload: \$D", ClientRuntimeTypes.Core.Data)
                            write("switch self {")
                            streamShape.eventStreamEvents(ctx.model).forEach { member ->
                                val memberName = ctx.symbolProvider.toMemberName(member)
                                write("case \$L(let value):", memberName)
                                indent()
                                addStringHeader(":event-type", member.memberName)
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
                                        renderPayloadSerialization(ctx, writer, variant)
                                    }
                                }
                                writer.dedent()
                            }
                            writer.write("case .sdkUnknown(_):")
                            writer.indent()
                            writer.write(
                                "throw \$N(\"cannot serialize the unknown event type!\")",
                                ClientRuntimeTypes.Core.UnknownClientError
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
        }
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
                renderPayloadSerialization(ctx, writer, target)
            }
            else -> throw CodegenException("unsupported shape type `${target.type}` for target: $target; expected blob, string, structure, or union for eventPayload member: $member")
        }
    }

    /**
     *
     *     if let headerValue = value.blob {
     *         headers.append(.init(name: "blob", value: .byteArray(headerValue)))
     *     }
     *     if let headerValue = value.boolean {
     *         headers.append(.init(name: "boolean", value: .bool(headerValue)))
     *     }
     *     if let headerValue = value.byte {
     *         headers.append(.init(name: "byte", value: .byte(headerValue)))
     *     }
     *     if let headerValue = value.int {
     *         headers.append(.init(name: "int", value: .int32(Int32(headerValue))))
     *     }
     *     if let headerValue = value.long {
     *         headers.append(.init(name: "long", value: .int64(Int64(headerValue))))
     *     }
     *     if let headerValue = value.short {
     *         headers.append(.init(name: "short", value: .int16(headerValue)))
     *     }
     *     if let headerValue = value.string {
     *         headers.append(.init(name: "string", value: .string(headerValue)))
     *     }
     *     if let headerValue = value.timestamp {
     *         headers.append(.init(name: "timestamp", value: .timestamp(headerValue)))
     *     }
     */
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
            when (target.type) {
                ShapeType.INTEGER -> {
                    writer.write("headers.append(.init(name: \"${member.memberName}\", value: .\$L(Int32(headerValue))))", headerValue)
                }
                ShapeType.LONG -> {
                    writer.write("headers.append(.init(name: \"${member.memberName}\", value: .\$L(Int64(headerValue))))", headerValue)
                }
                else -> {
                    writer.write("headers.append(.init(name: \"${member.memberName}\", value: .\$L(headerValue)))", headerValue)
                }
            }
        }
    }

    private fun SwiftWriter.addStringHeader(name: String, value: String) {
        write("headers.append(.init(name: \$S, value: .string(\$S)))", name, value)
    }

    private fun renderPayloadSerialization(ctx: ProtocolGenerator.GenerationContext, writer: SwiftWriter, shape: Shape) {
        // get a payload serializer for the given members of the variant
        val nodeInfoUtils = NodeInfoUtils(ctx, writer, ctx.service.responseWireProtocol)
        val rootNodeInfo = nodeInfoUtils.nodeInfo(shape)
        val valueWritingClosure = WritingClosureUtils(ctx, writer).writingClosure(shape)
        writer.write("let writer = \$N(nodeInfo: \$L)", ctx.service.writerSymbol, rootNodeInfo)
        writer.write("try \$L(value, writer)", valueWritingClosure)
        writer.write("payload = try writer.data()")
    }
}
