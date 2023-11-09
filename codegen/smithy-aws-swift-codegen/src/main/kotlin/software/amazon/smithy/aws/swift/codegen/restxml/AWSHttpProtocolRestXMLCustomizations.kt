/*
 * Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
 * SPDX-License-Identifier: Apache-2.0.
 */

package software.amazon.smithy.aws.swift.codegen.restxml

import software.amazon.smithy.aws.swift.codegen.AWSHttpProtocolCustomizations
import software.amazon.smithy.aws.swift.codegen.AWSHttpRequestXMLEncoder
import software.amazon.smithy.aws.swift.codegen.AWSHttpResponseXMLDecoder
import software.amazon.smithy.swift.codegen.integration.ClientProperty

class AWSHttpProtocolRestXMLCustomizations : AWSHttpProtocolCustomizations() {

    override fun getClientProperties(): List<ClientProperty> {
        val properties = mutableListOf<ClientProperty>()
        val requestEncoderOptions = mutableMapOf<String, String>()
        val responseDecoderOptions = mutableMapOf<String, String>()
        requestEncoderOptions["dateEncodingStrategy"] = ".secondsSince1970"
        requestEncoderOptions["nonConformingFloatEncodingStrategy"] = ".convertToString(positiveInfinity: \"Infinity\", negativeInfinity: \"-Infinity\", nan: \"NaN\")"
        responseDecoderOptions["dateDecodingStrategy"] = ".secondsSince1970"
        responseDecoderOptions["nonConformingFloatDecodingStrategy"] = ".convertFromString(positiveInfinity: \"Infinity\", negativeInfinity: \"-Infinity\", nan: \"NaN\")"
        responseDecoderOptions["trimValueWhitespaces"] = "false"
        responseDecoderOptions["removeWhitespaceElements"] = "true"
        properties.add(AWSHttpRequestXMLEncoder(requestEncoderOptions))
        properties.add(AWSHttpResponseXMLDecoder(responseDecoderOptions))
        return properties
    }
}
