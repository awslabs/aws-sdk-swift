package software.amazon.smithy.aws.swift.codegen.awsjson

import software.amazon.smithy.aws.swift.codegen.RestJsonProtocolGenerator
import software.amazon.smithy.aws.traits.protocols.AwsJson1_0Trait
import software.amazon.smithy.model.shapes.ShapeId
import software.amazon.smithy.model.traits.TimestampFormatTrait
import software.amazon.smithy.swift.codegen.SwiftWriter
import software.amazon.smithy.swift.codegen.integration.HttpBindingResolver
import software.amazon.smithy.swift.codegen.integration.ProtocolGenerator

class AwsJson1_0_ProtocolGenerator : RestJsonProtocolGenerator() {
    override val defaultContentType: String = "application/x-amz-json-1.0"
    override val defaultTimestampFormat: TimestampFormatTrait.Format = TimestampFormatTrait.Format.EPOCH_SECONDS
    override val protocol: ShapeId = AwsJson1_0Trait.ID

    override fun headersContentType(contentType: String, writer: SwiftWriter, hasHttpBody: Boolean,
                                operationShape: String) {
        writer.write("builder.withHeader(name: \"X-Amz-Target\", value: \"JsonRpc10.${operationShape}\")")
        writer.write("builder.withHeader(name: \"Content-Type\", value: \"$contentType\")")
    }

    override fun getProtocolHttpBindingResolver(generationContext: ProtocolGenerator.GenerationContext):
            HttpBindingResolver = AwsJsonHttpBindingResolver(generationContext)
}