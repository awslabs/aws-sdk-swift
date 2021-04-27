package software.amazon.smithy.aws.swift.codegen

import software.amazon.smithy.aws.swift.codegen.restxml.AWSHttpResponseBindingRestXML
import software.amazon.smithy.aws.traits.protocols.RestXmlTrait
import software.amazon.smithy.model.shapes.ShapeId
import software.amazon.smithy.model.traits.TimestampFormatTrait
import software.amazon.smithy.swift.codegen.integration.HttpProtocolCustomizable
import software.amazon.smithy.swift.codegen.integration.httpResponse.HttpResponseGeneratorJson

class MockRestXmlProtocolGenerator : AWSHttpBindingProtocolGenerator() {
    override val defaultContentType: String = "application/xml"
    override val defaultTimestampFormat: TimestampFormatTrait.Format = TimestampFormatTrait.Format.DATE_TIME
    override val protocol: ShapeId = RestXmlTrait.ID
    override val httpProtocolClientGeneratorFactory = AWSHttpProtocolClientGeneratorFactory()
    override val httpProtocolCustomizable = HttpProtocolCustomizable()
    override val httpResponseGenerator = HttpResponseGeneratorJson(
        AWSHttpResponseBindingRestXML(),
        serviceErrorProtocolSymbol,
        unknownServiceErrorSymbol,
        defaultTimestampFormat
    )
}
