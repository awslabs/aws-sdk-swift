//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//
import ClientRuntime

/// Service endpoint metadata
public struct EndpointDefinition {
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

extension EndpointDefinition {
    func resolve(region: String, defaults: EndpointDefinition) throws -> AWSEndpoint {
        let merged = mergeDefinitions(into: self, from: defaults)
        guard let hostname = merged.hostName else {
            throw EndpointError.hostnameIsNil("EndpointDefinition.hostname cannot be nil at this point")
        }
        let editedHostName = hostname.replacingOccurrences(of: "{region}", with: region)
        let transportProtocol = getByPriority(from: merged.protocols, priority: protocolPriority, defaultValue: defaultProtocol)
        let signingName = merged.credentialScope?.serviceId
        let signingRegion = merged.credentialScope?.region ?? region
        
        return AWSEndpoint(endpoint: Endpoint(host: editedHostName, path: "/", protocolType: ProtocolType(rawValue: transportProtocol)), signingName: signingName, signingRegion: signingRegion)
    }
    
    private func mergeDefinitions(into: EndpointDefinition, from: EndpointDefinition) -> EndpointDefinition {
        let hostName = into.hostName ?? from.hostName
        let protocols = !into.protocols.isEmpty ? into.protocols : from.protocols
        let credentialScope = CredentialScope(region: into.credentialScope?.region ?? from.credentialScope?.region, serviceId: into.credentialScope?.serviceId ?? from.credentialScope?.serviceId)
        let signatureVersions = !into.signatureVersions.isEmpty ? into.signatureVersions : from.signatureVersions
        return EndpointDefinition(hostName: hostName,
                                  protocols: protocols,
                                  credentialScope: credentialScope,
                                  signatureVersions: signatureVersions)
    }
    
    private func getByPriority(from: [String], priority: [String], defaultValue: String) -> String {
        if from.isEmpty {
            return defaultValue
        }
        
        for p in priority {
            if let candidate = from.first(where: { $0 == p}) {
                return candidate
            }
        }
        
        return defaultValue
    }
}
