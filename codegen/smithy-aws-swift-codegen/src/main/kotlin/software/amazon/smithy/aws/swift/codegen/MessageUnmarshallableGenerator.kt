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
import software.amazon.smithy.swift.codegen.SwiftTypes
import software.amazon.smithy.swift.codegen.SwiftWriter
import software.amazon.smithy.swift.codegen.integration.ProtocolGenerator
import software.amazon.smithy.swift.codegen.model.eventStreamErrors
import software.amazon.smithy.swift.codegen.model.eventStreamEvents
import software.amazon.smithy.swift.codegen.model.expectShape
import software.amazon.smithy.swift.codegen.model.hasTrait

class MessageUnmarshallableGenerator(val ctx: ProtocolGenerator.GenerationContext) {
    fun render(
        streamingMember: MemberShape
    ) {
        val symbol: Symbol = ctx.symbolProvider.toSymbol(ctx.model.expectShape(streamingMember.target))
        val rootNamespace = ctx.settings.moduleName
        val streamMember = Symbol.builder()
            .definitionFile("./$rootNamespace/models/${symbol.name}+MessageUnmarshallable.swift")
            .name(symbol.name)
            .build()

        val streamShape = ctx.model.expectShape<UnionShape>(streamingMember.target)
        val service = ctx.settings.getService(ctx.model)
        val serviceSymbol = ctx.symbolProvider.toSymbol(service)
        val streamSymbol = ctx.symbolProvider.toSymbol(streamShape)

        ctx.delegator.useShapeWriter(streamMember) { writer ->

            writer.addImport(SwiftDependency.CLIENT_RUNTIME.target)
            writer.addImport(AWSSwiftDependency.AWS_CLIENT_RUNTIME.target)
            writer.openBlock(
                "extension ${streamSymbol.fullName}: \$N {", "}",
                ClientRuntimeTypes.Serde.MessageUnmarshallable
            ) {
                writer.openBlock(
                    "public init(message: \$N, decoder: \$N) throws {", "}",
                    ClientRuntimeTypes.EventStream.Message,
                    ClientRuntimeTypes.Serde.ResponseDecoder
                ) {
                    writer.write("switch try message.type() {")
                    writer.write("case .event(let params):")
                    writer.indent {
                        writer.write("switch params.eventType {")
                        streamShape.eventStreamEvents(ctx.model).forEach { member ->
                            writer.write("case \"${member.memberName}\":")
                            writer.indent {
                                renderDeserializeEventVariant(ctx, streamSymbol, member, writer)
                            }
                        }
                        writer.write("default:")
                        writer.indent {
                            writer.write("self = .sdkUnknown(\"error processing event stream, unrecognized event: \\(params.eventType)\")")
                        }
                        writer.write("}")
                    }
                    writer.write("case .exception(let params):")
                    writer.indent {
                        writer.write(
                            "let makeError: (\$N, \$N) throws -> \$N = { message, params in",
                            ClientRuntimeTypes.EventStream.Message,
                            ClientRuntimeTypes.EventStream.ExceptionParams,
                            SwiftTypes.Error
                        )
                        writer.indent {
                            writer.write("switch params.exceptionType {")
                            streamShape.eventStreamErrors(ctx.model).forEach { member ->
                                writer.write("case \"${member.memberName}\":")
                                writer.indent {
                                    val targetShape = ctx.model.expectShape(member.target)
                                    val symbol = ctx.symbolProvider.toSymbol(targetShape)
                                    writer.write("return try decoder.decode(responseBody: message.payload) as \$N", symbol)
                                }
                            }
                            writer.write("default:")
                            writer.indent {
                                writer.write("let httpResponse = HttpResponse(body: .data(message.payload), statusCode: .ok)")
                                writer.write(
                                    "return \$L(httpResponse: httpResponse, message: \"error processing event stream, unrecognized ':exceptionType': \\(params.exceptionType); contentType: \\(params.contentType ?? \"nil\")\", requestID: nil, typeName: nil)",
                                    AWSClientRuntimeTypes.Core.UnknownAWSHTTPServiceError
                                )
                            }
                            writer.write("}")
                        }
                        writer.write("}")
                        writer.write("let error = try makeError(message, params)")
                        writer.write("throw error")
                    }
                    writer.write("case .error(let params):")
                    writer.indent {
                        // this is a service exception still, just un-modeled
                        writer.write("let httpResponse = HttpResponse(body: .data(message.payload), statusCode: .ok)")
                        writer.write(
                            "throw \$L(httpResponse: httpResponse, message: \"error processing event stream, unrecognized ':errorType': \\(params.errorCode); message: \\(params.message ?? \"nil\")\", requestID: nil, typeName: nil)",
                            AWSClientRuntimeTypes.Core.UnknownAWSHTTPServiceError
                        )
                    }
                    writer.write("case .unknown(messageType: let messageType):")
                    writer.indent {
                        // this is a client exception because we failed to parse it
                        writer.write(
                            "throw \$L(\"unrecognized event stream message ':message-type': \\(messageType)\")",
                            ClientRuntimeTypes.Core.UnknownClientError
                        )
                    }
                    writer.write("}")
                }
            }
        }
    }

    fun renderNotImplemented(
        streamingMember: MemberShape
    ) {
        val symbol: Symbol = ctx.symbolProvider.toSymbol(ctx.model.expectShape(streamingMember.target))
        val rootNamespace = ctx.settings.moduleName
        val streamMember = Symbol.builder()
            .definitionFile("./$rootNamespace/models/${symbol.name}+MessageUnmarshallable.swift")
            .name(symbol.name)
            .build()

        val streamShape = ctx.model.expectShape<UnionShape>(streamingMember.target)
        val streamSymbol = ctx.symbolProvider.toSymbol(streamShape)

        ctx.delegator.useShapeWriter(streamMember) { writer ->

            writer.addImport(SwiftDependency.CLIENT_RUNTIME.target)
            writer.addImport(AWSSwiftDependency.AWS_CLIENT_RUNTIME.target)
            writer.openBlock(
                "extension ${streamSymbol.fullName}: \$N {", "}",
                ClientRuntimeTypes.Serde.MessageUnmarshallable
            ) {
                writer.write("")
                writer.openBlock(
                    "public init(message: \$N, decoder: \$N) throws {", "}",
                    ClientRuntimeTypes.EventStream.Message,
                    ClientRuntimeTypes.Serde.ResponseDecoder
                ) {
                    writer.write("fatalError(\"Not implemented\")")
                }
            }
        }
    }

    private fun renderDeserializeEventVariant(ctx: ProtocolGenerator.GenerationContext, unionSymbol: Symbol, member: MemberShape, writer: SwiftWriter) {
        val variant = ctx.model.expectShape(member.target)

        val eventHeaderBindings = variant.members().filter { it.hasTrait<EventHeaderTrait>() }
        val eventPayloadBinding = variant.members().firstOrNull { it.hasTrait<EventPayloadTrait>() }
        val unbound = variant.members().filterNot { it.hasTrait<EventHeaderTrait>() || it.hasTrait<EventPayloadTrait>() }
        val memberName = ctx.symbolProvider.toMemberName(member)

        if (eventHeaderBindings.isEmpty() && eventPayloadBinding == null) {
            writer.write("self = .\$L(try decoder.decode(responseBody: message.payload))", memberName)
        } else {
            val variantSymbol = ctx.symbolProvider.toSymbol(variant)
            writer.write("var event = \$N()", variantSymbol)
            // render members bound to header
            eventHeaderBindings.forEach { hdrBinding ->
                val target = ctx.model.expectShape(hdrBinding.target)

                val conversionFn = when (target.type) {
                    ShapeType.BOOLEAN -> "bool"
                    ShapeType.BYTE -> "byte"
                    ShapeType.SHORT -> "int16"
                    ShapeType.INTEGER -> "int32"
                    ShapeType.LONG -> "int64"
                    ShapeType.BLOB -> "byteArray"
                    ShapeType.STRING -> "string"
                    ShapeType.TIMESTAMP -> "timestamp"
                    else -> throw CodegenException("unsupported eventHeader shape: member=$hdrBinding; targetShape=$target")
                }

                writer.openBlock("if case let .\$L(value) = message.headers.value(name: \$S) {", "}", conversionFn, hdrBinding.memberName) {
                    val memberName = ctx.symbolProvider.toMemberName(hdrBinding)
                    when (target.type) {
                        ShapeType.INTEGER, ShapeType.LONG -> {
                            writer.write("event.\$L = Int(value)", memberName)
                        }
                        else -> {
                            writer.write("event.\$L = value", memberName)
                        }
                    }
                }
            }

            if (eventPayloadBinding != null) {
                renderDeserializeExplicitEventPayloadMember(ctx, eventPayloadBinding, writer)
            } else {
                if (unbound.isNotEmpty()) {
                    // all remaining members are bound to payload (but not explicitly bound via @eventPayload)
                    // generate a payload deserializer specific to the unbound members (note this will be a deserializer
                    // for the overall event shape but only payload members will be considered for deserialization),
                    // and then assign each deserialized payload member to the current builder instance
                    unbound.forEach {
                        val memberName = ctx.symbolProvider.toMemberName(it)
                        writer.write("event.\$L = try decoder.decode(responseBody: message.payload)", memberName)
                    }
                }
            }
            writer.write("self = .\$L(event)", memberName)
        }
    }

    private fun renderDeserializeExplicitEventPayloadMember(
        ctx: ProtocolGenerator.GenerationContext,
        member: MemberShape,
        writer: SwiftWriter,
    ) {
        val target = ctx.model.expectShape(member.target)
        val memberName = ctx.symbolProvider.toMemberName(member)
        when (target.type) {
            ShapeType.BLOB -> writer.write("event.\$L = message.payload", memberName)
            ShapeType.STRING -> writer.write("event.\$L = String(data: message.payload, encoding: .utf8)", memberName)
            ShapeType.STRUCTURE, ShapeType.UNION -> {
                writer.write("event.\$L = .init(try decoder.decode(responseBody: message.payload))", memberName)
            }
            else -> throw CodegenException("unsupported shape type `${target.type}` for target: $target; expected blob, string, structure, or union for eventPayload member: $member")
        }
    }
}
