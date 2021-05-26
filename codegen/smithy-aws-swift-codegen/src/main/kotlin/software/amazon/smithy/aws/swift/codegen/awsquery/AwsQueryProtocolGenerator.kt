package software.amazon.smithy.aws.swift.codegen.awsquery

import software.amazon.smithy.aws.swift.codegen.AWSHttpBindingProtocolGenerator
import software.amazon.smithy.aws.swift.codegen.AWSHttpProtocolClientCustomizableFactory
import software.amazon.smithy.aws.swift.codegen.AWSHttpProtocolClientGeneratorFactory
import software.amazon.smithy.aws.swift.codegen.awsjson.AWSJsonHttpResponseBindingErrorGenerator
import software.amazon.smithy.aws.traits.protocols.AwsQueryTrait
import software.amazon.smithy.codegen.core.Symbol
import software.amazon.smithy.model.shapes.MemberShape
import software.amazon.smithy.model.shapes.Shape
import software.amazon.smithy.model.shapes.ShapeId
import software.amazon.smithy.model.traits.TimestampFormatTrait
import software.amazon.smithy.swift.codegen.Middleware
import software.amazon.smithy.swift.codegen.SwiftWriter
import software.amazon.smithy.swift.codegen.integration.HttpBindingDescriptor
import software.amazon.smithy.swift.codegen.integration.HttpBindingResolver
import software.amazon.smithy.swift.codegen.integration.ProtocolGenerator
import software.amazon.smithy.swift.codegen.integration.httpResponse.HttpResponseGenerator
import software.amazon.smithy.swift.codegen.integration.serde.formurl.StructEncodeFormURLGenerator
import software.amazon.smithy.swift.codegen.integration.serde.xml.StructDecodeXMLGenerator
import software.amazon.smithy.swift.codegen.model.ShapeMetadata

open class AwsQueryProtocolGenerator : AWSHttpBindingProtocolGenerator() {
    // TODO: Rename defaultContentType to differentiate between request & response
    // Requests are:
    //  application/x-www-form-urlencoded
    // Responses are:
    //  text/xml
    override val defaultContentType: String = "application/x-www-form-urlencoded"
    override val defaultTimestampFormat: TimestampFormatTrait.Format = TimestampFormatTrait.Format.DATE_TIME
    override val protocol: ShapeId = AwsQueryTrait.ID
    override val httpProtocolClientGeneratorFactory = AWSHttpProtocolClientGeneratorFactory()
    override val httpProtocolCustomizable = AWSHttpProtocolClientCustomizableFactory().constructClientCustomizable(protocol)
    override val httpResponseGenerator = HttpResponseGenerator(
        serviceErrorProtocolSymbol,
        unknownServiceErrorSymbol,
        defaultTimestampFormat,
        AWSJsonHttpResponseBindingErrorGenerator()
    )
    override val serdeContext = serdeContextAWSQuery
    override fun getProtocolHttpBindingResolver(ctx: ProtocolGenerator.GenerationContext):
        HttpBindingResolver = AwsQueryHttpBindingResolver(ctx)

    override val shouldRenderDecodableBodyStructForEncodableTypes = false
    override fun renderStructEncode(
        ctx: ProtocolGenerator.GenerationContext,
        shapeContainingMembers: Shape,
        shapeMetadata: Map<ShapeMetadata, Any>,
        members: List<MemberShape>,
        writer: SwiftWriter,
        defaultTimestampFormat: TimestampFormatTrait.Format,
    ) {
        val encoder = StructEncodeFormURLGenerator(ctx, shapeContainingMembers, shapeMetadata, members, writer, defaultTimestampFormat)
        encoder.render()
    }

    override fun renderStructDecode(
        ctx: ProtocolGenerator.GenerationContext,
        shapeMetaData: Map<ShapeMetadata, Any>,
        members: List<MemberShape>,
        writer: SwiftWriter,
        defaultTimestampFormat: TimestampFormatTrait.Format
    ) {
        val decoder = StructDecodeXMLGenerator(ctx, members, writer, defaultTimestampFormat)
        decoder.render()
    }

    override fun shouldRenderHttpBodyMiddleware(shape: Shape): Boolean {
        return true
    }

    override fun httpBodyMiddleware(
        writer: SwiftWriter,
        ctx: ProtocolGenerator.GenerationContext,
        inputSymbol: Symbol,
        outputSymbol: Symbol,
        outputErrorSymbol: Symbol,
        requestBindings: List<HttpBindingDescriptor>
    ): Middleware {
        return AwsQueryHttpBodyMiddleware(writer, ctx, inputSymbol, outputSymbol, outputErrorSymbol, requestBindings)
    }
}
