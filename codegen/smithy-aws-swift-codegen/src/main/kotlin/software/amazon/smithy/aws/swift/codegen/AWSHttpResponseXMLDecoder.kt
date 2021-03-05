package software.amazon.smithy.aws.swift.codegen

import software.amazon.smithy.swift.codegen.integration.HttpResponseDecoder

class AWSHttpResponseXMLDecoder(
    responseDecoderOptions: MutableMap<String, String> = mutableMapOf()
) : HttpResponseDecoder("XMLDecoder", responseDecoderOptions)
