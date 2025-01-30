package software.amazon.smithy.aws.swift.codegen.middleware

import software.amazon.smithy.aws.swift.codegen.swiftmodules.AWSClientRuntimeTypes
import software.amazon.smithy.codegen.core.Symbol
import software.amazon.smithy.rulesengine.language.syntax.parameters.Parameter
import software.amazon.smithy.swift.codegen.SwiftWriter
import software.amazon.smithy.swift.codegen.integration.ProtocolGenerator
import software.amazon.smithy.swift.codegen.integration.middlewares.OperationEndpointResolverMiddleware

class AWSOperationEndpointResolverMiddleware(
    ctx: ProtocolGenerator.GenerationContext,
    endpointResolverMiddlewareSymbol: Symbol,
) : OperationEndpointResolverMiddleware(ctx, endpointResolverMiddlewareSymbol) {
    override fun handleClientContextParam(param: Parameter, writer: SwiftWriter): String {
        return when (param.name.toString()) {
            "AccountId" -> {
                writer.format("context.resolvedAccountID")
            }
            "AccountIdEndpointMode" -> {
                "config.accountIdEndpointMode?.rawValue"
            }
            else -> {
                // Delegate to base class for everything else
                super.handleClientContextParam(param, writer)
            }
        }
    }

    override fun handleBuiltInParam(param: Parameter, writer: SwiftWriter): String {
        // Handle endpoint param if present
        if (getBuiltInName(param) == "endpoint") {
            writer.write(
                "let configuredEndpoint = try config.${getBuiltInName(param)} " +
                        "?? \$N.configuredEndpoint(\$S, config.ignoreConfiguredEndpointURLs)",
                AWSClientRuntimeTypes.Core.AWSClientConfigDefaultsProvider,
                ctx.settings.sdkId)
            return "configuredEndpoint"
        }

        // Otherwise, just use the base class logic
        return super.handleBuiltInParam(param, writer)
    }
}
