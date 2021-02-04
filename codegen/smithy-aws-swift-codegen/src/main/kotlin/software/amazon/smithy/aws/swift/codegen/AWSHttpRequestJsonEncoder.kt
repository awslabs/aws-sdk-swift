package software.amazon.smithy.aws.swift.codegen

import software.amazon.smithy.swift.codegen.SwiftWriter
import software.amazon.smithy.swift.codegen.integration.HttpRequestEncoder

class AWSHttpRequestJsonEncoder(
    requestEncoderOptions: MutableMap<String, String> = mutableMapOf()
) : HttpRequestEncoder("JSONEncoder", requestEncoderOptions) {
    override fun renderInitialization(writer: SwiftWriter, nameOfConfigObject: String) {
        writer.write("self.encoder = \$L.encoder ?? \$L", nameOfConfigObject, name)
    }
}
