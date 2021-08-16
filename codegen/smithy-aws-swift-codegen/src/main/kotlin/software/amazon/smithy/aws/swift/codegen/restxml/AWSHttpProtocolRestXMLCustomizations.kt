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
        // TODO: Subject to change when we figure out which strategy to use for XML
        // TODO: Subject to change if Foundation dependency is removed
        requestEncoderOptions["dateEncodingStrategy"] = ".secondsSince1970"
        responseDecoderOptions["dateDecodingStrategy"] = ".secondsSince1970"
        responseDecoderOptions["trimValueWhitespaces"] = "false"
        responseDecoderOptions["removeWhitespaceElements"] = "true"
        properties.add(AWSHttpRequestXMLEncoder(requestEncoderOptions))
        properties.add(AWSHttpResponseXMLDecoder(responseDecoderOptions))
        return properties
    }
}
