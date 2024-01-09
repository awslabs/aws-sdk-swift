package software.amazon.smithy.aws.swift.codegen.customization

import software.amazon.smithy.aws.traits.auth.SigV4Trait
import software.amazon.smithy.rulesengine.language.EndpointRuleSet
import software.amazon.smithy.rulesengine.traits.EndpointRuleSetTrait
import software.amazon.smithy.swift.codegen.AuthSchemeResolverGenerator
import software.amazon.smithy.swift.codegen.ClientRuntimeTypes
import software.amazon.smithy.swift.codegen.SwiftDependency
import software.amazon.smithy.swift.codegen.SwiftWriter
import software.amazon.smithy.swift.codegen.integration.ProtocolGenerator
import software.amazon.smithy.swift.codegen.integration.ServiceTypes
import software.amazon.smithy.swift.codegen.model.getTrait
import software.amazon.smithy.swift.codegen.utils.toLowerCamelCase

class RulesBasedAuthSchemeResolverGenerator {
    fun render(ctx: ProtocolGenerator.GenerationContext) {
        val rootNamespace = ctx.settings.moduleName

        ctx.delegator.useFileWriter("./$rootNamespace/${ClientRuntimeTypes.Core.AuthSchemeResolver.name}.swift") {
            renderServiceSpecificDefaultResolver(ctx, it)
            it.write("")
            it.addImport(SwiftDependency.CLIENT_RUNTIME.target)
            it.addIndividualTypeImport("enum", "AWSClientRuntime", "AuthScheme")
        }
    }

    private fun renderServiceSpecificDefaultResolver(ctx: ProtocolGenerator.GenerationContext, writer: SwiftWriter) {
        val sdkId = AuthSchemeResolverGenerator.getSdkId(ctx)
        val serviceSpecificDefaultResolverName = "Default$sdkId${ClientRuntimeTypes.Core.AuthSchemeResolver.name}"
        val serviceSpecificAuthResolverProtocol = sdkId + ClientRuntimeTypes.Core.AuthSchemeResolver.name

        writer.apply {
            writer.openBlock(
                "public struct \$L: \$L {",
                "}",
                serviceSpecificDefaultResolverName,
                serviceSpecificAuthResolverProtocol
            ) {
                renderResolveAuthSchemeMethod(ctx, writer)
                write("")
                renderConstructParametersMethod(
                    ctx,
                    sdkId + ClientRuntimeTypes.Core.AuthSchemeResolverParameters.name,
                    writer
                )
            }
        }
    }

    private fun renderResolveAuthSchemeMethod(ctx: ProtocolGenerator.GenerationContext, writer: SwiftWriter) {
        val sdkId = AuthSchemeResolverGenerator.getSdkId(ctx)
        val serviceParamsName = sdkId + ClientRuntimeTypes.Core.AuthSchemeResolverParameters.name

        writer.apply {
            openBlock(
                "public func resolveAuthScheme(params: \$L) throws -> [AuthOption] {",
                "}",
                ServiceTypes.AuthSchemeResolverParams
            ) {
                // Return value of array of auth options
                write("var validAuthOptions = [AuthOption]()")

                // Cast params to service specific params object
                openBlock(
                    "guard let serviceParams = params as? \$L else {",
                    "}",
                    serviceParamsName
                ) {
                    write("throw ClientError.authError(\"Service specific auth scheme parameters type must be passed to auth scheme resolver.\")")
                }

                // Construct endpoint params from auth params
                write("let endpointParams = EndpointParams(authSchemeParams: serviceParams)")
                // Resolve endpoint, and retrieve auth schemes valid for the resolved endpoint
                write("let endpoint = try DefaultEndpointResolver().resolve(params: endpointParams)")
                openBlock("guard let authSchemes = endpoint.authSchemes() else {", "}") {
                    // Call internal modeled model-based auth scheme resolver as fall-back if no auth schemes
                    // are returned by endpoint resolver.
                    write("return try InternalModeled${sdkId + ClientRuntimeTypes.Core.AuthSchemeResolver.name}().resolveAuthScheme(params: params)")
                }
                writer.write("let schemes = try authSchemes.map { (input) -> AWSClientRuntime.AuthScheme in try AWSClientRuntime.AuthScheme(from: input) }")
                // If endpoint resolver returned auth schemes, iterate over them and save each as valid auth option to return
                openBlock("for scheme in schemes {", "}") {
                    openBlock("switch scheme {", "}") {
                        // SigV4 case
                        write("case .sigV4(let param):")
                        indent()
                        write("var sigV4Option = AuthOption(schemeID: \"${SigV4Trait.ID}\")")
                        write("sigV4Option.signingProperties.set(key: AttributeKeys.signingName, value: param.signingName)")
                        write("sigV4Option.signingProperties.set(key: AttributeKeys.signingRegion, value: param.signingRegion)")
                        write("validAuthOptions.append(sigV4Option)")
                        dedent()
                        // SigV4A case
                        write("case .sigV4A(let param):")
                        indent()
                        // sigv4a trait is not yet implemented by Smithy
                        // This is a SDK-level customization until the trait is added
                        write("var sigV4Option = AuthOption(schemeID: \"${SigV4Trait.ID}a\")")
                        write("sigV4Option.signingProperties.set(key: AttributeKeys.signingName, value: param.signingName)")
                        write("sigV4Option.signingProperties.set(key: AttributeKeys.signingRegion, value: param.signingRegionSet?[0])")
                        write("validAuthOptions.append(sigV4Option)")
                        dedent()
                        // Default case: throw error if returned auth scheme is neither SigV4 nor SigV4A
                        write("default:")
                        indent()
                        write("throw ClientError.authError(\"Unknown auth scheme name: \\(scheme.name)\")")
                        dedent()
                    }
                }
                // Return result
                write("return validAuthOptions")
            }
        }
    }

    private fun renderConstructParametersMethod(ctx: ProtocolGenerator.GenerationContext, returnTypeName: String, writer: SwiftWriter) {
        writer.apply {
            openBlock(
                "public func constructParameters(context: HttpContext) throws -> \$L {",
                "}",
                ServiceTypes.AuthSchemeResolverParams
            ) {
                openBlock("guard let opName = context.getOperation() else {", "}") {
                    write("throw ClientError.dataNotFound(\"Operation name not configured in middleware context for auth scheme resolver params construction.\")")
                }

                // Get endpoint param from middleware context
                openBlock("guard let endpointParam = context.attributes.get(key: AttributeKey<EndpointParams>(name: \"EndpointParams\")) else {", "}") {
                    write("throw ClientError.dataNotFound(\"Endpoint param not configured in middleware context for rules-based auth scheme resolver params construction.\")")
                }

                // Copy over endpoint param fields to auth param fields
                val ruleSetNode = ctx.service.getTrait<EndpointRuleSetTrait>()?.ruleSet
                val ruleSet = if (ruleSetNode != null) EndpointRuleSet.fromNode(ruleSetNode) else null
                val paramList = ArrayList<String>()
                ruleSet?.parameters?.toList()?.sortedBy { it.name.toString() }?.let { sortedParameters ->
                    sortedParameters.forEach { param ->
                        val memberName = param.name.toString().toLowerCamelCase()
                        paramList.add("$memberName: endpointParam.$memberName")
                    }
                }

                val argStringToAppend = if (paramList.isEmpty()) "" else ", " + paramList.joinToString()
                write("return $returnTypeName(operation: opName$argStringToAppend)")
            }
        }
    }
}
