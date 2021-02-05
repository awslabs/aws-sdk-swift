/*
 * Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
 * SPDX-License-Identifier: Apache-2.0.
 */
package software.amazon.smithy.aws.swift.codegen

import software.amazon.smithy.swift.codegen.integration.ClientProperty
import software.amazon.smithy.swift.codegen.integration.ProtocolGenerator

/**
 * Shared base protocol generator for all AWS JSON protocol variants
 */
abstract class AWSHttpBindingJsonProtocolGenerator : AWSHttpBindingProtocolGenerator() {

    override fun getClientProperties(ctx: ProtocolGenerator.GenerationContext): List<ClientProperty> {
        val features = mutableListOf<ClientProperty>()
        val requestEncoderOptions = mutableMapOf<String, String>()
        val responseDecoderOptions = mutableMapOf<String, String>()
        // TODO:: Subject to change if Foundation dependency is removed
        requestEncoderOptions["dateEncodingStrategy"] = ".secondsSince1970"
        responseDecoderOptions["dateDecodingStrategy"] = ".secondsSince1970"
        features.add(AWSHttpRequestJsonEncoder(requestEncoderOptions))
        features.add(AWSHttpResponseJsonDecoder(responseDecoderOptions))
        return features
    }
}
