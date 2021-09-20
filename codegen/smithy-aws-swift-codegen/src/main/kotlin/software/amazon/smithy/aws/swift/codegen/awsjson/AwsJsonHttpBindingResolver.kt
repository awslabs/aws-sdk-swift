/*
 * Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
 * SPDX-License-Identifier: Apache-2.0.
 */

package software.amazon.smithy.aws.swift.codegen.awsjson

import software.amazon.smithy.model.pattern.UriPattern
import software.amazon.smithy.model.traits.HttpTrait
import software.amazon.smithy.swift.codegen.integration.ProtocolGenerator
import software.amazon.smithy.swift.codegen.integration.protocols.core.StaticHttpBindingResolver

class AwsJsonHttpBindingResolver(
    private val context: ProtocolGenerator.GenerationContext,
    private val defaultContentType: String
) : StaticHttpBindingResolver(context, awsJsonHttpTrait, defaultContentType) {

    companion object {
        private val awsJsonHttpTrait: HttpTrait = HttpTrait
            .builder()
            .code(200)
            .method("POST")
            .uri(UriPattern.parse("/"))
            .build()
    }
}
