package software.amazon.smithy.aws.swift.codegen.plugins

import software.amazon.smithy.aws.swift.codegen.AWSAuthUtils
import software.amazon.smithy.aws.swift.codegen.swiftmodules.AWSClientRuntimeTypes
import software.amazon.smithy.aws.swift.codegen.swiftmodules.AWSSDKIdentityTypes
import software.amazon.smithy.codegen.core.Symbol
import software.amazon.smithy.swift.codegen.AuthSchemeResolverGenerator
import software.amazon.smithy.swift.codegen.SwiftWriter
import software.amazon.smithy.swift.codegen.integration.Plugin
import software.amazon.smithy.swift.codegen.integration.ProtocolGenerator
import software.amazon.smithy.swift.codegen.integration.ServiceConfig
import software.amazon.smithy.swift.codegen.model.buildSymbol
import software.amazon.smithy.swift.codegen.swiftmodules.ClientRuntimeTypes

class DefaultAWSAuthSchemePlugin(private val serviceConfig: ServiceConfig) : Plugin {
    override val className: Symbol
        get() = buildSymbol {
            this.name = "DefaultAWSAuthSchemePlugin"
        }

    override val isDefault: Boolean
        get() = true

    override fun render(ctx: ProtocolGenerator.GenerationContext, writer: SwiftWriter) {
        writer.openBlock("public class DefaultAWSAuthSchemePlugin: \$N {", "}", ClientRuntimeTypes.Core.Plugin) {
            writer.write("")
            writer.write("public init() {}")
            writer.write("")
            writer.openBlock("public func configureClient(clientConfiguration: \$N) throws {", "}", ClientRuntimeTypes.Core.ClientConfiguration) {
                writer.openBlock("if let config = clientConfiguration as? ${serviceConfig.typeName} {", "}") {
                    writer.write("config.authSchemeResolver = \$L", "Default${AuthSchemeResolverGenerator.getSdkId(ctx)}AuthSchemeResolver()")
                    writer.write("config.authSchemes = \$L", AWSAuthUtils(ctx).getModeledAuthSchemesSupportedBySDK(ctx, writer))
                    writer.write("config.awsCredentialIdentityResolver = try \$N.awsCredentialIdentityResolver()", AWSClientRuntimeTypes.Core.AWSClientConfigDefaultsProvider)
                    writer.write("config.bearerTokenIdentityResolver = try \$N()", AWSSDKIdentityTypes.DefaultBearerTokenIdentityResolverChain)
                }
            }
        }
        writer.write("")
    }
}
