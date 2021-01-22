package software.amazon.smithy.aws.swift.codegen.awsjson

import software.amazon.smithy.aws.traits.protocols.AwsJson1_1Trait
import software.amazon.smithy.model.shapes.ShapeId
import software.amazon.smithy.model.traits.TimestampFormatTrait

class AwsJson1_1_ProtocolGenerator : AwsJson1_0_ProtocolGenerator() {
    override val defaultContentType: String = "application/x-amz-json-1.1"
    override val defaultTimestampFormat: TimestampFormatTrait.Format = TimestampFormatTrait.Format.EPOCH_SECONDS
    override val protocol: ShapeId = AwsJson1_1Trait.ID
}