package software.amazon.smithy.aws.swift.codegen

import software.amazon.smithy.swift.codegen.SwiftWriter
import software.amazon.smithy.swift.codegen.integration.HttpResponseDecoder

class AWSHttpResponseXMLDecoder(
    responseDecoderOptions: MutableMap<String, String> = mutableMapOf()
) : HttpResponseDecoder("XMLDecoder", responseDecoderOptions) {
    override fun renderInitialization(writer: SwiftWriter, nameOfConfigObject: String) {
        writer.write("self.decoder = \$L.decoder ?? \$L", nameOfConfigObject, name)
    }
}
