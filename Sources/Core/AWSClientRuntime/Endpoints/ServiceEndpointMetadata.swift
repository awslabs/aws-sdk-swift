//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//
import ClientRuntime

public struct ServiceEndpointMetadata {
    private let defaultProtocol = ProtocolType.https.rawValue
    private let defaultSigner = "v4"
    private let protocolPriority = ProtocolType.allCases.map { $0.rawValue }
    private let signerPriority = ["v4"]
    /**
      A URI **template** used to resolve the hostname of the endpoint.
      Templates are of the form `{name}`. e.g. `{service}.{region}.amazonaws.com`

      Variables that may be substituted:
      - `service` - the service name
      - `region` - the region name
      - `dnsSuffix` - the dns suffix of the partition
     */
    let hostName: String?

    /// A list of supported protocols for the endpoint
    let protocols: [String]

    /// A custom signing constraint for the endpoint
    let credentialScope: CredentialScope?

    /// A list of allowable signature versions for the endpoint (e.g. "v4", "v2", "v3", "s3v3", etc)
    let signatureVersions: [String]

    public init(hostName: String? = nil,
                protocols: [String] = [],
                credentialScope: CredentialScope? = nil,
                signatureVersions: [String] = []) {
        self.hostName = hostName
        self.protocols = protocols
        self.credentialScope = credentialScope
        self.signatureVersions = signatureVersions
    }
}

extension ServiceEndpointMetadata {
    func resolve(region: String, defaults: ServiceEndpointMetadata) throws -> AWSEndpoint {
        let serviceEndpointMetadata = buildEndpointMetadataIfNotSet(defaults: defaults)
        guard let hostname = serviceEndpointMetadata.hostName else {
            throw EndpointError.hostnameIsNil("EndpointDefinition.hostname cannot be nil at this point")
        }
        let editedHostName = hostname.replacingOccurrences(of: "{region}", with: region)
        let transportProtocol = getProtocolByPriority(from: serviceEndpointMetadata.protocols)
        let signingName = serviceEndpointMetadata.credentialScope?.serviceId
        let signingRegion = serviceEndpointMetadata.credentialScope?.region ?? region

        return AWSEndpoint(endpoint: Endpoint(host: editedHostName,
                                              path: "/",
                                              protocolType: ProtocolType(rawValue: transportProtocol)),
                           signingName: signingName,
                           signingRegion: signingRegion)
    }

    private func buildEndpointMetadataIfNotSet(defaults: ServiceEndpointMetadata) -> ServiceEndpointMetadata {
        let hostName = self.hostName ?? defaults.hostName
        let protocols = !self.protocols.isEmpty ? self.protocols : defaults.protocols
        let credentialScope = CredentialScope(
            region: self.credentialScope?.region ?? defaults.credentialScope?.region,
            serviceId: self.credentialScope?.serviceId ?? defaults.credentialScope?.serviceId
        )
        let signatureVersions = !self.signatureVersions.isEmpty ? self.signatureVersions : defaults.signatureVersions
        return ServiceEndpointMetadata(
            hostName: hostName,
            protocols: protocols,
            credentialScope: credentialScope,
            signatureVersions: signatureVersions
        )
    }

    private func getProtocolByPriority(from: [String]) -> String {
        guard from.isEmpty else {
            return defaultProtocol
        }

        for p in protocolPriority {
            if let candidate = from.first(where: { $0 == p}) {
                return candidate
            }
        }

        return defaultProtocol
    }
}
