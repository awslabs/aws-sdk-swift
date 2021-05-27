package software.amazon.smithy.aws.swift.codegen.awsquery

import software.amazon.smithy.aws.swift.codegen.AWSHttpBindingProtocolGenerator
import software.amazon.smithy.aws.swift.codegen.AWSHttpProtocolClientCustomizableFactory
import software.amazon.smithy.aws.swift.codegen.AWSHttpProtocolClientGeneratorFactory
import software.amazon.smithy.aws.swift.codegen.awsjson.AWSJsonHttpResponseBindingErrorGenerator
import software.amazon.smithy.aws.traits.protocols.AwsQueryTrait
import software.amazon.smithy.model.shapes.ShapeId
import software.amazon.smithy.model.traits.TimestampFormatTrait
import software.amazon.smithy.swift.codegen.integration.httpResponse.HttpResponseGenerator

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
}
