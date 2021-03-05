package software.amazon.smithy.aws.swift.codegen

import software.amazon.smithy.swift.codegen.SwiftWriter
import software.amazon.smithy.swift.codegen.integration.HttpRequestEncoder

class AWSHttpRequestXMLEncoder(
    requestEncoderOptions: MutableMap<String, String> = mutableMapOf()
) : HttpRequestEncoder("XMLEncoder", requestEncoderOptions) {
    override fun renderInitialization(writer: SwiftWriter, nameOfConfigObject: String) {
        writer.write("self.encoder = \$L.encoder ?? \$L", nameOfConfigObject, name)
    }
}
