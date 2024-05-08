/*
 * Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
 * SPDX-License-Identifier: Apache-2.0.
 */

package software.amazon.smithy.aws.swift.codegen.middleware

import software.amazon.smithy.aws.swift.codegen.AUTH_SCHEME_RESOLVER
import software.amazon.smithy.aws.swift.codegen.AWSClientRuntimeTypes
import software.amazon.smithy.aws.swift.codegen.AWSServiceTypes
import software.amazon.smithy.aws.swift.codegen.AWSSwiftDependency
import software.amazon.smithy.aws.swift.codegen.ENDPOINT_PARAMS
import software.amazon.smithy.aws.swift.codegen.ENDPOINT_RESOLVER
import software.amazon.smithy.codegen.core.Symbol
import software.amazon.smithy.swift.codegen.Middleware
import software.amazon.smithy.swift.codegen.SwiftDependency
import software.amazon.smithy.swift.codegen.SwiftWriter
import software.amazon.smithy.swift.codegen.integration.steps.OperationBuildStep

/**
 * Generates endpoint middleware for the service.
 */
class EndpointResolverMiddleware(
    private val writer: SwiftWriter,
    inputSymbol: Symbol,
    outputSymbol: Symbol,
    outputErrorSymbol: Symbol
) : Middleware(writer, inputSymbol, OperationBuildStep(outputSymbol, outputErrorSymbol)) {

    override val id: String = "EndpointResolverMiddleware"

    override val typeName = "EndpointResolverMiddleware<$outputSymbol>"

    override val properties: MutableMap<String, Symbol> = mutableMapOf(
        ENDPOINT_RESOLVER to AWSServiceTypes.EndpointResolver,
        ENDPOINT_PARAMS to AWSServiceTypes.EndpointParams,
        AUTH_SCHEME_RESOLVER to AWSClientRuntimeTypes.Core.AuthSchemeResolver
    )

    override fun generateInit() {
        writer.openBlock(
            "public init($ENDPOINT_RESOLVER: \$N, $ENDPOINT_PARAMS: \$N, $AUTH_SCHEME_RESOLVER: \$N = \$N()) {",
            "}",
            AWSServiceTypes.EndpointResolver,
            AWSServiceTypes.EndpointParams,
            AWSClientRuntimeTypes.Core.AuthSchemeResolver,
            AWSClientRuntimeTypes.Core.DefaultAuthSchemeResolver
        ) {
            writer.write("self.\$L = \$L", ENDPOINT_RESOLVER, ENDPOINT_RESOLVER)
            writer.write("self.\$L = \$L", ENDPOINT_PARAMS, ENDPOINT_PARAMS)
            writer.write("self.\$L = \$L", AUTH_SCHEME_RESOLVER, AUTH_SCHEME_RESOLVER)
        }
    }

    override fun renderExtensions() {
        writer.write(
            """
            extension EndpointResolverMiddleware: ApplyEndpoint {
                public func apply(
                    request: SdkHttpRequest,
                    selectedAuthScheme: SelectedAuthScheme?,
                    attributes: HttpContext) async throws -> SdkHttpRequest
                {
                    let builder = request.toBuilder()
                    
                    let endpoint = try endpointResolver.resolve(params: endpointParams)
                    
                    var signingName: String? = nil
                    var signingRegion: String? = nil
                    var signingAlgorithm: String? = nil
                    if let authSchemes = endpoint.authSchemes() {
                        let schemes = try authSchemes.map { try AuthScheme(from: ${'$'}${'$'}0) }
                        let authScheme = try authSchemeResolver.resolve(authSchemes: schemes)
                        signingAlgorithm = authScheme.name
                        switch authScheme {
                        case .sigV4(let param):
                            signingName = param.signingName
                            signingRegion = param.signingRegion
                        case .sigV4A(let param):
                            signingName = param.signingName
                            signingRegion = param.signingRegionSet?.first
                        case .none:
                            break
                        }
                    }
                    
                    let awsEndpoint = AWSEndpoint(endpoint: endpoint, signingName: signingName, signingRegion: signingRegion)
                    
                    var host = ""
                    if let hostOverride = attributes.getHost() {
                        host = hostOverride
                    } else {
                        host = "\(attributes.getHostPrefix() ?? "")\(awsEndpoint.endpoint.host)"
                    }
                    
                    if let protocolType = awsEndpoint.endpoint.protocolType {
                        builder.withProtocol(protocolType)
                    }
                    
                    if let signingRegion = signingRegion {
                        attributes.set(key: AttributeKeys.signingRegion, value: signingRegion)
                        attributes.set(key: AttributeKeys.selectedAuthScheme, value: selectedAuthScheme?.getCopyWithUpdatedSigningProperty(key: AttributeKeys.signingRegion, value: signingRegion))
                    }
                    
                    if let signingName = signingName {
                       attributes.set(key: AttributeKeys.signingName, value: signingName) 
                       attributes.set(key: AttributeKeys.selectedAuthScheme, value: selectedAuthScheme?.getCopyWithUpdatedSigningProperty(key: AttributeKeys.signingName, value: signingName))
                    }
                    
                    if let signingAlgorithm = signingAlgorithm {
                        attributes.set(key: AttributeKeys.signingAlgorithm, value: AWSSigningAlgorithm(rawValue: signingAlgorithm))
                    }
                    
                    if let headers = endpoint.headers {
                        builder.withHeaders(headers)
                    }
                    
                    return builder.withMethod(attributes.getMethod())
                        .withHost(host)
                        .withPort(awsEndpoint.endpoint.port)
                        .withPath(awsEndpoint.endpoint.path.appendingPathComponent(attributes.getPath()))
                        .withHeader(name: "Host", value: host)
                        .build()
                }
            }
            """.trimIndent()
        )
    }

    override fun generateMiddlewareClosure() {
        writer.addImport(SwiftDependency.CLIENT_RUNTIME.target)
        writer.addImport(AWSSwiftDependency.AWS_CLIENT_RUNTIME.target)
        writer.write(
            """
            let selectedAuthScheme = context.getSelectedAuthScheme()
            let request = input.build()
            let updatedRequest = try await apply(request: request, selectedAuthScheme: selectedAuthScheme, attributes: context)
            """.trimIndent()
        )
    }

    override fun renderReturn() {
        writer.write("return try await next.handle(context: context, input: updatedRequest.toBuilder())")
    }
}
