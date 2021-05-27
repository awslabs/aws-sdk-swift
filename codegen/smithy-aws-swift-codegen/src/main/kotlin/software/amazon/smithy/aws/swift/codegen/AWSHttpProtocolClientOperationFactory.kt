package software.amazon.smithy.aws.swift.codegen

import software.amazon.smithy.aws.swift.codegen.awsjson.AWSHttpProtocolJson10Customizations
import software.amazon.smithy.aws.swift.codegen.awsjson.AWSHttpProtocolJson11Customizations
import software.amazon.smithy.aws.swift.codegen.restjson.AWSHttpProtocolRestJsonCustomizations
import software.amazon.smithy.aws.traits.protocols.AwsJson1_0Trait
import software.amazon.smithy.aws.traits.protocols.AwsJson1_1Trait
import software.amazon.smithy.aws.traits.protocols.RestJson1Trait
import software.amazon.smithy.model.shapes.OperationShape
import software.amazon.smithy.model.shapes.ServiceShape
import software.amazon.smithy.model.shapes.ShapeId
import software.amazon.smithy.swift.codegen.SwiftWriter
import software.amazon.smithy.swift.codegen.integration.DefaultHttpProtocolCustomizations
import software.amazon.smithy.swift.codegen.integration.ProtocolGenerator

class AWSHttpProtocolClientCustomizableFactory {
    fun constructClientCustomizable(protocol: ShapeId): DefaultHttpProtocolCustomizations {
        when (protocol) {
            AwsJson1_0Trait.ID -> return AWSHttpProtocolJson10Customizations()
            AwsJson1_1Trait.ID -> return AWSHttpProtocolJson11Customizations()
            RestJson1Trait.ID -> return AWSHttpProtocolRestJsonCustomizations()
        }
        return AWSHttpProtocolNoopCustomizations()
    }
}

class AWSHttpProtocolNoopCustomizations : DefaultHttpProtocolCustomizations() {
    override fun renderContextAttributes(
        ctx: ProtocolGenerator.GenerationContext,
        writer: SwiftWriter,
        serviceShape: ServiceShape,
        op: OperationShape
    ) {
    }
}
