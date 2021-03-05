package software.amazon.smithy.aws.swift.codegen

import software.amazon.smithy.swift.codegen.integration.HttpRequestEncoder

class AWSHttpRequestJsonEncoder(
    requestEncoderOptions: MutableMap<String, String> = mutableMapOf()
) : HttpRequestEncoder("JSONEncoder", requestEncoderOptions)
