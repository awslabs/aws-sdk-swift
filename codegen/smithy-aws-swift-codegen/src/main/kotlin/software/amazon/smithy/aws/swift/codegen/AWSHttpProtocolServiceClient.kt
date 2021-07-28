package software.amazon.smithy.aws.swift.codegen

import software.amazon.smithy.codegen.core.Symbol
import software.amazon.smithy.swift.codegen.SwiftWriter
import software.amazon.smithy.swift.codegen.integration.ClientProperty
import software.amazon.smithy.swift.codegen.integration.HttpProtocolServiceClient
import software.amazon.smithy.swift.codegen.integration.ProtocolGenerator
import software.amazon.smithy.swift.codegen.integration.ServiceConfig

class AWSHttpProtocolServiceClient(ctx: ProtocolGenerator.GenerationContext,
                                   private val writer: SwiftWriter,
                                   properties: List<ClientProperty>,
                                   serviceConfig: ServiceConfig): HttpProtocolServiceClient(ctx, writer, properties, serviceConfig) {
    override fun renderConvenienceInit(serviceSymbol: Symbol) {
        writer.openBlock("public convenience init(region: String? = nil) throws {", "}") {
            writer.write("let unwrappedRegion = region ?? \"us-east-1\"") //TODO: replace with call to region resolver
            writer.write("let config = try ${serviceSymbol.name}Configuration(region: unwrappedRegion)")
            writer.write("self.init(config: config)")
        }
    }
}