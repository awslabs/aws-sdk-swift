/*
 * Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
 * SPDX-License-Identifier: Apache-2.0.
 */

package software.amazon.smithy.aws.swift.codegen.protocols.rpcv2cbor

import software.amazon.smithy.model.pattern.UriPattern
import software.amazon.smithy.model.shapes.OperationShape
import software.amazon.smithy.model.traits.HttpTrait
import software.amazon.smithy.swift.codegen.integration.ProtocolGenerator
import software.amazon.smithy.swift.codegen.integration.protocols.core.StaticHttpBindingResolver

class RPCV2CBORHttpBindingResolver(
    context: ProtocolGenerator.GenerationContext,
    defaultContentType: String
) : StaticHttpBindingResolver(context, rpcv2CborHttpTrait, defaultContentType) {

    companion object {
        private val rpcv2CborHttpTrait: HttpTrait =  HttpTrait
            .builder()
            .code(200)
            .method("POST")
            .uri(UriPattern.parse("/"))
            .build()
    }

    override fun httpTrait(operationShape: OperationShape): HttpTrait = HttpTrait
        .builder()
        .code(200)
        .method("POST")
        .uri(UriPattern.parse("/service/${getServiceName()}/operation/${operationShape.id.name}"))
        .build()
}
