package software.amazon.smithy.aws.swift.codegen

import software.amazon.smithy.swift.codegen.ClientRuntimeTypes
import software.amazon.smithy.swift.codegen.integration.HttpRequestEncoder

class AWSHttpRequestFormURLEncoder(
    requestEncoderOptions: MutableMap<String, String> = mutableMapOf()
) : HttpRequestEncoder(ClientRuntimeTypes.Serde.FormURLEncoder, requestEncoderOptions)
