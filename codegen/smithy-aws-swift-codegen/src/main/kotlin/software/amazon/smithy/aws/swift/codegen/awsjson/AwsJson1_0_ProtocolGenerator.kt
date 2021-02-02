package software.amazon.smithy.aws.swift.codegen.awsjson

import software.amazon.smithy.aws.swift.codegen.JsonProtocolBase
import software.amazon.smithy.aws.traits.protocols.AwsJson1_0Trait
import software.amazon.smithy.model.shapes.ShapeId
import software.amazon.smithy.model.traits.TimestampFormatTrait
import software.amazon.smithy.swift.codegen.SwiftWriter
import software.amazon.smithy.swift.codegen.integration.HttpBindingResolver
import software.amazon.smithy.swift.codegen.integration.ProtocolGenerator

open class AwsJson1_0_ProtocolGenerator : JsonProtocolBase() {
    override val defaultContentType: String = "application/x-amz-json-1.0"
    override val defaultTimestampFormat: TimestampFormatTrait.Format = TimestampFormatTrait.Format.EPOCH_SECONDS
    override val protocol: ShapeId = AwsJson1_0Trait.ID

    override fun headersContentType(
        ctx: ProtocolGenerator.GenerationContext,
        hasHttpBody: Boolean,
        contentType: String,
        writer: SwiftWriter,
        operationShape: String
    ) {
        writer.write("builder.withHeader(name: \"X-Amz-Target\", value: \"${ctx.service.id.name}.${operationShape}\")")
        writer.write("builder.withHeader(name: \"Content-Type\", value: \"$contentType\")")
    }

    override fun getProtocolHttpBindingResolver(ctx: ProtocolGenerator.GenerationContext):
        HttpBindingResolver = AwsJsonHttpBindingResolver(ctx)
}
