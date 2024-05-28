/*
 * Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
 * SPDX-License-Identifier: Apache-2.0.
 */

package software.amazon.smithy.aws.swift.codegen.middleware

import software.amazon.smithy.aws.swift.codegen.AWSSwiftDependency
import software.amazon.smithy.codegen.core.Symbol
import software.amazon.smithy.swift.codegen.SwiftDependency
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
        writer.addImport(SwiftDependency.SMITHY.target)
        writer.addImport(SwiftDependency.SMITHY_HTTP_API.target)
        writer.addImport(SwiftDependency.SMITHY_HTTP_AUTH_API.target)
        writer.addImport(AWSSwiftDependency.AWS_SDK_HTTP_AUTH.target)
        writer.write(
            """
            extension EndpointResolverMiddleware: ApplyEndpoint {
                public func apply(
                    request: SdkHttpRequest,
                    selectedAuthScheme: SelectedAuthScheme?,
                    attributes: Smithy.Context) async throws -> SdkHttpRequest
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
                    if let hostOverride = attributes.host {
                        host = hostOverride
                    } else {
                        host = "\(attributes.hostPrefix ?? "")\(awsEndpoint.endpoint.host)"
                    }
                    
                    if let protocolType = awsEndpoint.endpoint.protocolType {
                        builder.withProtocol(protocolType)
                    }
                    
                    if let signingRegion = signingRegion {
                        attributes.signingRegion = signingRegion
                        attributes.selectedAuthScheme = selectedAuthScheme?.getCopyWithUpdatedSigningProperty(key: SigningPropertyKeys.signingRegion, value: signingRegion)
                    }
                    
                    if let signingName = signingName {
                       attributes.signingName = signingName
                       attributes.selectedAuthScheme = selectedAuthScheme?.getCopyWithUpdatedSigningProperty(key: SigningPropertyKeys.signingName, value: signingName)
                    }
                    
                    if let signingAlgorithm = signingAlgorithm {
                        attributes.signingAlgorithm = SigningAlgorithm(rawValue: signingAlgorithm)
                    }
                    
                    if let headers = endpoint.headers {
                        builder.withHeaders(headers)
                    }
                    
                    return builder.withMethod(attributes.method)
                        .withHost(host)
                        .withPort(awsEndpoint.endpoint.port)
                        .withPath(awsEndpoint.endpoint.path.appendingPathComponent(attributes.path))
                        .withHeader(name: "Host", value: host)
                        .build()
                }
            }
            """.trimIndent()
        )
    }
}
