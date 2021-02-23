package software.amazon.smithy.aws.swift.codegen

import software.amazon.smithy.swift.codegen.SwiftWriter
import software.amazon.smithy.swift.codegen.integration.ClientProperty
import software.amazon.smithy.swift.codegen.integration.HttpBindingResolver
import software.amazon.smithy.swift.codegen.integration.HttpProtocolClientGenerator
import software.amazon.smithy.swift.codegen.integration.HttpProtocolClientGeneratorFactory
import software.amazon.smithy.swift.codegen.integration.HttpProtocolCustomizable
import software.amazon.smithy.swift.codegen.integration.ProtocolGenerator

class AWSHttpProtocolClientGeneratorFactory : HttpProtocolClientGeneratorFactory {
    override fun createHttpProtocolClientGenerator(
        ctx: ProtocolGenerator.GenerationContext,
        httpBindingResolver: HttpBindingResolver,
        writer: SwiftWriter,
        serviceName: String,
        defaultContentType: String,
        httpProtocolCustomizable: HttpProtocolCustomizable
    ): HttpProtocolClientGenerator {
        val serviceName = ctx.symbolProvider.toSymbol(ctx.service).name
        val config = AWSServiceConfig(writer, serviceName)
        val clientProperties = httpProtocolCustomizable.getClientProperties(ctx)
        return HttpProtocolClientGenerator(ctx, writer, clientProperties, config, httpBindingResolver, defaultContentType, httpProtocolCustomizable)
    }
}
