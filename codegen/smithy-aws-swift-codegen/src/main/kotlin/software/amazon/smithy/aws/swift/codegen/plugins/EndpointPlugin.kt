package software.amazon.smithy.aws.swift.codegen.plugins

import software.amazon.smithy.aws.swift.codegen.AWSServiceTypes
import software.amazon.smithy.aws.swift.codegen.AWSSwiftDependency
import software.amazon.smithy.codegen.core.Symbol
import software.amazon.smithy.swift.codegen.SwiftWriter
import software.amazon.smithy.swift.codegen.integration.Plugin
import software.amazon.smithy.swift.codegen.integration.ServiceConfig
import software.amazon.smithy.swift.codegen.model.buildSymbol

class EndpointPlugin(private val serviceConfig: ServiceConfig) : Plugin {
    override val className: Symbol
        get() = buildSymbol {
            this.name = "EndpointPlugin"
            this.namespace = AWSSwiftDependency.AWS_CLIENT_RUNTIME.target
            dependency(AWSSwiftDependency.AWS_CLIENT_RUNTIME)
        }

    override fun render(writer: SwiftWriter) {
        writer.openBlock("public class EndpointPlugin: Plugin {", "}") {
            writer.write("private var endpointResolver: \$L", AWSServiceTypes.EndpointResolver)
            writer.openBlock("public init(endpointResolver: \$L) {", "}", AWSServiceTypes.EndpointResolver) {
                writer.write("self.endpointResolver = endpointResolver")
            }
            writer.openBlock("public convenience init() throws {", "}") {
                writer.write("self.init(endpointResolver: try \$L())", AWSServiceTypes.DefaultEndpointResolver)
            }
            writer.openBlock("public func configureClient(clientConfiguration: ClientRuntime.ClientConfiguration) throws {", "}") {
                writer.openBlock("if var config = clientConfiguration as? ${serviceConfig.typeName} {", "}") {
                    writer.write("config.endpointResolver = self.endpointResolver")
                }
            }
        }
    }
}
