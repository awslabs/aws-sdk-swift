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
    private val ctx: ProtocolGenerator.GenerationContext,
    private val writer: SwiftWriter,
    properties: List<ClientProperty>,
    private val serviceConfig: ServiceConfig
) : HttpProtocolServiceClient(ctx, writer, properties, serviceConfig) {
    override fun renderConvenienceInitFunctions(serviceSymbol: Symbol) {
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

    override fun renderServiceExtension(serviceSymbol: Symbol) {
        val serviceConfigs = serviceConfig.serviceSpecificConfigProperties()
        writer.openBlock("extension \$L {", "}", serviceConfig.clientName) {
            writer.write("public typealias \$LConfiguration = AWSClientConfiguration<ServiceSpecificConfiguration>", serviceConfig.clientName)
            writer.write("")

            writer.openBlock("public struct ServiceSpecificConfiguration: AWSServiceSpecificConfiguration {", "}") {
                writer.write("public typealias AWSServiceEndpointResolver = EndpointResolver")
                writer.write("")
                writer.write("public var serviceName: String { \$S }", serviceConfig.serviceName)
                writer.write("public var clientName: String { \$S }", serviceConfig.clientName)
                serviceConfigs.forEach { config ->
                    writer.write("public var \$L: ${config.propFormatter}", config.memberName, config.type)
                }
                writer.write("")
                writer.openBlock("public init(endpointResolver: EndpointResolver? = nil) throws {", "}") {
                    writer.write("self.endpointResolver = try endpointResolver ?? DefaultEndpointResolver()")
                }
            }
            writer.write("")

            writer.openBlock("static func resolve(plugins: [any Plugin]) async throws -> \$L {", "}", serviceConfig.typeName) {
                writer.write("let clientConfiguration = try await \$L()", serviceConfig.typeName)
                writer.openBlock("for plugin in plugins {", "}") {
                    writer.write("try await plugin.configureClient(clientConfiguration: clientConfiguration)")
                }
                writer.write("return clientConfiguration")
            }

            writer.write("")
            writer.openBlock("public class Builder {", "}") {
                writer.write("private var plugins: [Plugin]")
                writer.openBlock("public init(defaultPlugins: [Plugin] = []) {", "}") {
                    writer.write("self.plugins = defaultPlugins")
                }
                writer.openBlock("public func withPlugin(plugin: any Plugin) {", "}") {
                    writer.write("self.plugins.append(plugin)")
                }
                writer.openBlock("public func build() async throws -> \$L {", "}", serviceConfig.clientName) {
                    writer.write("let configuration = try await resolve(plugins: self.plugins)")
                    writer.write("return \$L(config: configuration)", serviceConfig.clientName)
                }
            }

            writer.write("")
            writer.openBlock("public static func builder() -> Builder {", "}") {
                writer.write(
                    "return Builder(defaultPlugins: [\$L])",
                    ctx.integrations
                        .flatMap { it.plugins() }
                        .onEach { it.addImport(writer) }
                        .joinToString(" , ") { "${it.className}()" }
                )
            }
        }
        writer.write("")

        val clientConfigurationProtocols =
            ctx.integrations
                .flatMap { it.clientConfigurations() }
                .onEach { it.addImport(writer) }
                .joinToString(" & ") { it.swiftProtocolName }

        writer.openBlock(
            "extension \$L.\$LConfiguration: \$L {", "}",
            serviceConfig.clientName,
            serviceConfig.clientName,
            clientConfigurationProtocols
        ) {
            ctx.integrations.flatMap { it.clientConfigurations() }.forEach {
                it.protocolImplementation(writer, serviceConfig)
            }
        }
        writer.write("")
    }
}
