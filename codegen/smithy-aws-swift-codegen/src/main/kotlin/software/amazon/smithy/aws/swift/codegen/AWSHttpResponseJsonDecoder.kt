package software.amazon.smithy.aws.swift.codegen

import software.amazon.smithy.swift.codegen.ClientRuntimeTypes
import software.amazon.smithy.swift.codegen.integration.HttpResponseDecoder

class AWSHttpResponseJsonDecoder(
    responseDecoderOptions: MutableMap<String, String> = mutableMapOf()
) : HttpResponseDecoder(ClientRuntimeTypes.Serde.JSONDecoder, responseDecoderOptions)
