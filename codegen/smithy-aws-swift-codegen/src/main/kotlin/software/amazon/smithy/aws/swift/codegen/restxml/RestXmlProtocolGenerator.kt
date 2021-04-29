package software.amazon.smithy.aws.swift.codegen.restxml

import software.amazon.smithy.aws.swift.codegen.AWSHttpBindingProtocolGenerator
import software.amazon.smithy.aws.swift.codegen.AWSHttpProtocolClientGeneratorFactory
import software.amazon.smithy.aws.traits.protocols.RestXmlTrait
import software.amazon.smithy.model.shapes.ShapeId
import software.amazon.smithy.model.traits.TimestampFormatTrait
import software.amazon.smithy.swift.codegen.integration.httpResponse.HttpResponseGenerator

class RestXmlProtocolGenerator : AWSHttpBindingProtocolGenerator() {
    override val defaultContentType: String = "application/xml"
    override val defaultTimestampFormat: TimestampFormatTrait.Format = TimestampFormatTrait.Format.DATE_TIME
    override val protocol: ShapeId = RestXmlTrait.ID
    override val httpProtocolClientGeneratorFactory = AWSHttpProtocolClientGeneratorFactory()
    override val httpProtocolCustomizable = AWSHttpProtocolRestXMLCustomizations()
    override val httpResponseGenerator = HttpResponseGenerator(
        serviceErrorProtocolSymbol,
        unknownServiceErrorSymbol,
        defaultTimestampFormat,
        AWSRestXMLHttpResponseBindingErrorGenerator(),
        AWSRestXMLHttpResponseBindingErrorInitGeneratorFactory()
    )
    override val serdeContext = serdeContextXML
}
