package software.amazon.smithy.aws.swift.codegen.awsquery

import software.amazon.smithy.aws.swift.codegen.AWSHttpBindingProtocolGenerator
import software.amazon.smithy.aws.swift.codegen.AWSHttpProtocolClientCustomizableFactory
import software.amazon.smithy.aws.swift.codegen.AWSHttpProtocolClientGeneratorFactory
import software.amazon.smithy.aws.swift.codegen.awsjson.AWSJsonHttpResponseBindingErrorGenerator
import software.amazon.smithy.aws.swift.codegen.awsjson.AwsJsonHttpBindingResolver
import software.amazon.smithy.aws.traits.protocols.AwsQueryTrait
import software.amazon.smithy.model.shapes.ShapeId
import software.amazon.smithy.model.traits.TimestampFormatTrait
import software.amazon.smithy.swift.codegen.integration.HttpBindingResolver
import software.amazon.smithy.swift.codegen.integration.ProtocolGenerator
import software.amazon.smithy.swift.codegen.integration.httpResponse.HttpResponseGenerator

open class AwsQueryProtocolGenerator : AWSHttpBindingProtocolGenerator() {
    //TODO: probably need this to be renamed since default contentType for requests are:
    //  application/x-www-form-urlencoded
    // but content type for responses are:
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

    // TODO: this is wrong, but, something to get this party started.
    override val serdeContext = serdeContextAWSQuery
    override fun getProtocolHttpBindingResolver(ctx: ProtocolGenerator.GenerationContext):
            HttpBindingResolver = AwsJsonHttpBindingResolver(ctx)
}