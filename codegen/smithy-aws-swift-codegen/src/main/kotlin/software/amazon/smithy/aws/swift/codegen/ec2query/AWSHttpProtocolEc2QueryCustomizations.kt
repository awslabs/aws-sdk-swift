package software.amazon.smithy.aws.swift.codegen.ec2query

import software.amazon.smithy.aws.swift.codegen.AWSHttpProtocolCustomizations
import software.amazon.smithy.aws.swift.codegen.AWSHttpRequestFormURLEncoder
import software.amazon.smithy.aws.swift.codegen.AWSHttpResponseXMLDecoder
import software.amazon.smithy.codegen.core.Symbol
import software.amazon.smithy.model.shapes.Shape
import software.amazon.smithy.protocoltests.traits.HttpRequestTestCase
import software.amazon.smithy.swift.codegen.SwiftWriter
import software.amazon.smithy.swift.codegen.integration.ClientProperty
import software.amazon.smithy.swift.codegen.integration.ProtocolGenerator

class AWSHttpProtocolEc2QueryCustomizations : AWSHttpProtocolCustomizations() {

    override fun getClientProperties(ctx: ProtocolGenerator.GenerationContext): List<ClientProperty> {
        val properties = mutableListOf<ClientProperty>()
        val requestEncoderOptions = mutableMapOf<String, String>()
        val responseDecoderOptions = mutableMapOf<String, String>()
        properties.add(AWSHttpRequestFormURLEncoder(requestEncoderOptions))
        properties.add(AWSHttpResponseXMLDecoder(responseDecoderOptions))
        return properties
    }

    override fun customRenderBodyComparison(test: HttpRequestTestCase): ((SwiftWriter, HttpRequestTestCase, Symbol, Shape, Boolean, String, String) -> Unit)? {
        return this::renderFormURLBodyComparison
    }

    private fun renderFormURLBodyComparison(writer: SwiftWriter, test: HttpRequestTestCase, symbol: Symbol, shape: Shape, appendBody: Boolean, expectedData: String, actualData: String) {
        writer.write("self.assertEqualFormURLBody($expectedData, $actualData)")
    }

    override fun alwaysHasHttpBody(): Boolean {
        return true
    }
}
