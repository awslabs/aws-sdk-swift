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
import software.amazon.smithy.swift.codegen.integration.serde.readwrite.DocumentWritingClosureUtils
import software.amazon.smithy.swift.codegen.integration.serde.readwrite.WritingClosureUtils
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
                                val documentWritingClosure = DocumentWritingClosureUtils(ctx, writer).closure(variant)
                                val valueWritingClosure = WritingClosureUtils(ctx, writer).writingClosure(variant)
                                writer.write("payload = try \$L(value, \$L)", documentWritingClosure, valueWritingClosure)
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

    /**
     *      extension TestServiceClientTypes.TestStream: ClientRuntime.MessageMarshallable {
     *          public func marshall(encoder: ClientRuntime.RequestEncoder) throws -> ClientRuntime.EventStream.Message {
     *              fatalError("not implemented")
     *          }
     *      }
     *
     */
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
                    writer.write("#error(\"Event streams not implemented for this protocol\")")
                }
            }
        }
    }

    /**
     *      headers.append(.init(name: ":event-type", value: .string("MessageWithBlob")))
     */
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
}
