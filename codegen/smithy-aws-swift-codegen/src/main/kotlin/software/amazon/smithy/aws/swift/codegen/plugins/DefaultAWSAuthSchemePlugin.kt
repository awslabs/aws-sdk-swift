package software.amazon.smithy.aws.swift.codegen.plugins

import software.amazon.smithy.aws.swift.codegen.SigV4Utils.Companion.getModeledAuthSchemesSupportedBySDK
import software.amazon.smithy.codegen.core.Symbol
import software.amazon.smithy.swift.codegen.AuthSchemeResolverGenerator
import software.amazon.smithy.swift.codegen.SwiftWriter
import software.amazon.smithy.swift.codegen.integration.Plugin
import software.amazon.smithy.swift.codegen.integration.ProtocolGenerator
import software.amazon.smithy.swift.codegen.integration.ServiceConfig
import software.amazon.smithy.swift.codegen.model.buildSymbol

class DefaultAWSAuthSchemePlugin(private val serviceConfig: ServiceConfig) : Plugin {
    override val className: Symbol
        get() = buildSymbol {
            this.name = "DefaultAWSAuthSchemePlugin"
        }

    override val isDefault: Boolean
        get() = true

    override fun render(ctx: ProtocolGenerator.GenerationContext, writer: SwiftWriter) {
        writer.openBlock("public class DefaultAWSAuthSchemePlugin: Plugin {", "}") {
            writer.openBlock("public init() {", "}") {
            }

            writer.openBlock("public func configureClient(clientConfiguration: ClientRuntime.ClientConfiguration) throws {", "}") {
                writer.openBlock("if let config = clientConfiguration as? ${serviceConfig.typeName} {", "}") {
                    writer.write("config.authSchemeResolver = \$L", "Default${AuthSchemeResolverGenerator.getSdkId(ctx)}AuthSchemeResolver()")
                    writer.write("config.authSchemes = \$L", getModeledAuthSchemesSupportedBySDK(ctx))
                    writer.write("config.awsCredentialIdentityResolver = try AWSClientConfigDefaultsProvider.awsCredentialIdentityResolver()")
                }
            }
        }
        writer.write("")
    }
}
