/*
 * Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
 * SPDX-License-Identifier: Apache-2.0.
 */

package software.amazon.smithy.aws.swift.codegen

import software.amazon.smithy.codegen.core.Symbol
import software.amazon.smithy.swift.codegen.SwiftWriter
import software.amazon.smithy.swift.codegen.integration.ClientProperty
import software.amazon.smithy.swift.codegen.integration.HttpProtocolServiceClient
import software.amazon.smithy.swift.codegen.integration.ProtocolGenerator
import software.amazon.smithy.swift.codegen.integration.ServiceConfig

class AWSHttpProtocolServiceClient(
    ctx: ProtocolGenerator.GenerationContext,
    private val writer: SwiftWriter,
    properties: List<ClientProperty>,
    private val serviceConfig: ServiceConfig
) : HttpProtocolServiceClient(ctx, writer, properties, serviceConfig) {
    override fun renderConvenienceInit(serviceSymbol: Symbol) {
        writer.openBlock("public convenience init(region: Swift.String) throws {", "}") {
            writer.write("let config = try ${serviceConfig.typeName}(region: region)")
            writer.write("self.init(config: config)")
        }
        writer.write("")
        writer.openBlock("public convenience init() async throws {", "}") {
            writer.write("let config = try await ${serviceConfig.typeName}()")
            writer.write("self.init(config: config)")
        }
    }
}
