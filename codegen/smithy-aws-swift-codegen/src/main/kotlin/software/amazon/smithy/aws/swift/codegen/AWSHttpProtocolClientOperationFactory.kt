package software.amazon.smithy.aws.swift.codegen

import software.amazon.smithy.aws.swift.codegen.awsjson.AWSHttpProtocolJson10ClientCustomizations
import software.amazon.smithy.aws.swift.codegen.awsjson.AWSHttpProtocolJson11ClientCustomizations
import software.amazon.smithy.aws.swift.codegen.restjson.AWSHttpProtocolRestJsonClientCustomizations
import software.amazon.smithy.aws.traits.protocols.AwsJson1_0Trait
import software.amazon.smithy.aws.traits.protocols.AwsJson1_1Trait
import software.amazon.smithy.aws.traits.protocols.RestJson1Trait
import software.amazon.smithy.codegen.core.Symbol
import software.amazon.smithy.model.shapes.OperationShape
import software.amazon.smithy.model.shapes.ShapeId
import software.amazon.smithy.protocoltests.traits.HttpRequestTestCase
import software.amazon.smithy.swift.codegen.SwiftWriter
import software.amazon.smithy.swift.codegen.integration.HttpProtocolClientCustomizable
import software.amazon.smithy.swift.codegen.integration.ProtocolGenerator

class AWSHttpProtocolClientCustomizableFactory {
    fun constructClientCustomizable(protocol: ShapeId): HttpProtocolClientCustomizable {
        when (protocol) {
            AwsJson1_0Trait.ID -> return AWSHttpProtocolJson10ClientCustomizations()
            AwsJson1_1Trait.ID -> return AWSHttpProtocolJson11ClientCustomizations()
            RestJson1Trait.ID -> return AWSHttpProtocolRestJsonClientCustomizations()
        }
        return AWSHttpProtocolClientNoopCustomizations()
    }
}

class AWSHttpProtocolClientNoopCustomizations : HttpProtocolClientCustomizable() {
    override fun renderContextAttributes(ctx: ProtocolGenerator.GenerationContext, writer: SwiftWriter, op: OperationShape) {
    }
}
