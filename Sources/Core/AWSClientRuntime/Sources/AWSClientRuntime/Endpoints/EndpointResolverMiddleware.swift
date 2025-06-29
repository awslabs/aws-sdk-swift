//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import class Smithy.Context
import struct SmithyHTTPAPI.Endpoint
import class SmithyHTTPAPI.HTTPRequest
import class SmithyHTTPAPI.HTTPRequestBuilder
import struct SmithyHTTPAuthAPI.SelectedAuthScheme
import enum SmithyHTTPAuthAPI.SigningAlgorithm
import enum SmithyHTTPAuthAPI.SigningPropertyKeys
import protocol ClientRuntime.ApplyEndpoint
import struct ClientRuntime.DefaultEndpointsAuthSchemeResolver
import enum ClientRuntime.EndpointsAuthScheme
import protocol ClientRuntime.EndpointsAuthSchemeResolver
import protocol ClientRuntime.EndpointsRequestContextProviding

@_spi(AWSEndpointResolverMiddleware)
public struct AWSEndpointResolverMiddleware<OperationStackOutput, Params: EndpointsRequestContextProviding> {
    public let id: Swift.String = "EndpointResolverMiddleware"
    let paramsBlock: (Context) throws -> Params
    let resolverBlock: (Params) throws -> Endpoint
    let authSchemeResolver: ClientRuntime.EndpointsAuthSchemeResolver

    public init(
        paramsBlock: @escaping (Context) throws -> Params,
        resolverBlock: @escaping (Params) throws -> Endpoint,
        authSchemeResolver: EndpointsAuthSchemeResolver = DefaultEndpointsAuthSchemeResolver()
    ) {
        self.paramsBlock = paramsBlock
        self.resolverBlock = resolverBlock
        self.authSchemeResolver = authSchemeResolver
    }
}

extension AWSEndpointResolverMiddleware: ApplyEndpoint {

    public func apply(
        request: SmithyHTTPAPI.HTTPRequest,
        selectedAuthScheme: SelectedAuthScheme?,
        attributes: Smithy.Context
    ) async throws -> SmithyHTTPAPI.HTTPRequest {
        let builder = request.toBuilder()

        let endpoint = try resolverBlock(paramsBlock(attributes))

        var signingName: String?
        var signingAlgorithm: String?
        var signingRegion: String?
        if let authSchemes = endpoint.authSchemes() {
            let schemes = try authSchemes.map { try EndpointsAuthScheme(from: $0) }
            let authScheme = try authSchemeResolver.resolve(authSchemes: schemes)
            signingAlgorithm = authScheme.name
            switch authScheme {
            case .sigV4(let param), .sigV4S3Express(let param):
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

        if let signingAlgorithm = signingAlgorithm {
            attributes.signingAlgorithm = SigningAlgorithm(rawValue: signingAlgorithm)
        }

        return builder.withMethod(attributes.method)
            .withHost(host)
            .withPort(awsEndpoint.endpoint.port)
            .withPath(awsEndpoint.endpoint.path.appendingPathComponent(attributes.path))
            .withHeaders(endpoint.headers)
            .withHeader(name: "Host", value: host)
            .build()
    }
}
