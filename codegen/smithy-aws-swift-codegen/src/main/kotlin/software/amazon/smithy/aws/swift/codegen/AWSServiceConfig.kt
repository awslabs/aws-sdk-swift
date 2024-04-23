/*
 * Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
 * SPDX-License-Identifier: Apache-2.0.
 */

package software.amazon.smithy.aws.swift.codegen

import software.amazon.smithy.codegen.core.Symbol
import software.amazon.smithy.model.shapes.ShapeType
import software.amazon.smithy.swift.codegen.SwiftTypes
import software.amazon.smithy.swift.codegen.SwiftWriter
import software.amazon.smithy.swift.codegen.integration.ProtocolGenerator
import software.amazon.smithy.swift.codegen.integration.ServiceConfig

class AWSServiceConfig(writer: SwiftWriter, val ctx: ProtocolGenerator.GenerationContext) :
    ServiceConfig(writer, ctx.symbolProvider.toSymbol(ctx.service).name, ctx.settings.sdkId) {
}

//object AWSServiceTypes {
//    val EndpointResolver = symbol("EndpointResolver")
//    val EndpointParams = symbol("EndpointParams")
//    val EndpointResolverMiddleware = symbol("EndpointResolverMiddleware")
//    val DefaultEndpointResolver = symbol("DefaultEndpointResolver")
//
//    private fun symbol(name: String): Symbol = buildSymbol {
//        this.name = name
//    }
//}
