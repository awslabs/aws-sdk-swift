/*
 * Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
 * SPDX-License-Identifier: Apache-2.0.
 */

package software.amazon.smithy.aws.swift.codegen.middleware

import software.amazon.smithy.codegen.core.Symbol
import software.amazon.smithy.swift.codegen.SwiftWriter
import software.amazon.smithy.swift.codegen.middleware.EndpointResolverMiddleware

/**
 * Generates endpoint middleware for the service.
 */
class AWSEndpointResolverMiddleware(
    private val writer: SwiftWriter,
    inputSymbol: Symbol,
    outputSymbol: Symbol,
    outputErrorSymbol: Symbol
) : EndpointResolverMiddleware(writer, inputSymbol, outputSymbol, outputErrorSymbol) {
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
                        let schemes = try authSchemes.map { try EndpointsAuthScheme(from: ${'$'}${'$'}0) }
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
                    
                    return builder.withMethod(attributes.getMethod())
                        .withHost(host)
                        .withPort(awsEndpoint.endpoint.port)
                        .withPath(awsEndpoint.endpoint.path.appendingPathComponent(attributes.getPath()))
                        .withHeaders(endpoint.headers)
                        .withHeader(name: "Host", value: host)
                        .build()
                }
            }
            """.trimIndent()
        )
    }
}
