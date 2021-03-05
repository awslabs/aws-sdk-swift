package software.amazon.smithy.aws.swift.codegen

import software.amazon.smithy.swift.codegen.integration.HttpResponseDecoder

class AWSHttpResponseJsonDecoder(
    responseDecoderOptions: MutableMap<String, String> = mutableMapOf()
) : HttpResponseDecoder("JSONDecoder", responseDecoderOptions)
