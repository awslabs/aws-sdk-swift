package software.amazon.smithy.aws.swift.codegen

import software.amazon.smithy.codegen.core.Symbol
import software.amazon.smithy.swift.codegen.SwiftTypes
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
        writer.openBlock("public convenience init(region: \$N) throws {", "}", SwiftTypes.String) {
            writer.write("let unwrappedRegion = region ?? \"us-east-1\"") // TODO: replace with call to region resolver
            writer.write("let config = try ${serviceConfig.typeName}(region: unwrappedRegion)")
            writer.write("self.init(config: config)")
        }
    }
}
