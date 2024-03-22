package software.amazon.smithy.aws.swift.codegen.plugins

import software.amazon.smithy.aws.swift.codegen.AWSClientRuntimeTypes
import software.amazon.smithy.aws.swift.codegen.AWSSwiftDependency
import software.amazon.smithy.codegen.core.Symbol
import software.amazon.smithy.swift.codegen.AuthSchemeResolverGenerator
import software.amazon.smithy.swift.codegen.ClientRuntimeTypes
import software.amazon.smithy.swift.codegen.SwiftWriter
import software.amazon.smithy.swift.codegen.integration.Plugin
import software.amazon.smithy.swift.codegen.integration.ProtocolGenerator
import software.amazon.smithy.swift.codegen.integration.ServiceConfig
import software.amazon.smithy.swift.codegen.model.buildSymbol
import software.amazon.smithy.swift.codegen.model.toGeneric
import software.amazon.smithy.swift.codegen.model.toOptional
import software.amazon.smithy.swift.codegen.utils.toUpperCamelCase

class AuthSchemePlugin(private val serviceConfig: ServiceConfig) : Plugin {

    private val pluginName: String = "${serviceConfig.clientName.toUpperCamelCase()}AuthSchemePlugin"

    override val className: Symbol
        get() = buildSymbol {
            this.name = pluginName
        }

    override fun render(ctx: ProtocolGenerator.GenerationContext, writer: SwiftWriter) {
        writer.addImport(AWSSwiftDependency.AWS_CLIENT_RUNTIME.target, false, "FileBasedConfig")

        writer.openBlock("public class $pluginName: Plugin {", "}") {
            writer.write("private var authSchemes: \$N", ClientRuntimeTypes.Auth.AuthSchemes.toOptional())
            writer.write("private var authSchemeResolver: \$N", ClientRuntimeTypes.Auth.AuthSchemeResolver.toOptional())
            writer.write("private var awsCredentialIdentityResolver: \$N", AWSClientRuntimeTypes.Core.AWSCredentialIdentityResolver.toGeneric().toOptional())

            writer.openBlock(
                "public init(authSchemes: \$N = nil, authSchemeResolver: \$N = nil, awsCredentialIdentityResolver: \$N = nil) {", "}",
                ClientRuntimeTypes.Auth.AuthSchemes.toOptional(),
                AuthSchemeResolverGenerator.getServiceSpecificAuthSchemeResolverName(ctx).toOptional(),
                AWSClientRuntimeTypes.Core.AWSCredentialIdentityResolver.toGeneric().toOptional()
            ) {
                writer.write("self.authSchemeResolver = authSchemeResolver")
                writer.write("self.authSchemes = authSchemes")
                writer.write("self.awsCredentialIdentityResolver = awsCredentialIdentityResolver")
            }
            writer.openBlock("public func configureClient(clientConfiguration: ClientRuntime.ClientConfiguration) throws {", "}") {
                writer.openBlock("if let config = clientConfiguration as? ${serviceConfig.typeName} {", "}") {
                    writer.openBlock("if (self.authSchemes != nil) {", "}") {
                        writer.write("config.authSchemes = self.authSchemes")
                    }
                    writer.openBlock("if (self.authSchemeResolver != nil) {", "}") {
                        writer.write("config.authSchemeResolver = self.authSchemeResolver!")
                    }
                    writer.openBlock("if (self.awsCredentialIdentityResolver != nil) {", "}") {
                        writer.write("config.awsCredentialIdentityResolver = self.awsCredentialIdentityResolver!")
                    }
                }
            }
        }
        writer.write("")
    }
}
