//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//
import ClientRuntime

/**
  Represents the endpoint a service client should make API operation calls to.
  The SDK will automatically resolve endpoints per API client using an internal resolver.
 */
public struct AWSEndpoint: Equatable {
    /// the endpoint object contains the host name (e.g. "{service-id}.{region}.amazonaws.com") , the transport protocol (e.g. "HTTPS") and the port to connect to when making requests to this endpoint.
    let endpoint: Endpoint

    /**
    Flag indicating that the hostname can be modified by the SDK client.
    If the hostname is mutable the SDK clients may modify any part of the hostname based
    on the requirements of the API (e.g. adding or removing content in the hostname).
    As an example Amazon S3 Client prefixing "bucketname" to the hostname or changing th hostname
    service name component from "s3" to "s3-accespoint.dualstack." requires mutable hostnames.
    Care should be taken when setting this flag and providing a custom endpoint. If the hostname
    is expected to be mutable and the client cannot modify the endpoint correctly, the operation
    will likely fail.
    */
    let isHostnameImmutable: Bool

    /// The service name that should be used for signing requests to this endpoint. This overrides the default
    /// signing name used by an SDK client.
    let signingName: String?

    /// The region that should be used for signing requests to this endpoint. This overrides the default
    /// signing region used by an SDK client.
    let signingRegion: String?
    
    public init(endpoint: Endpoint, isHostnameImmutable: Bool = false, signingName: String? = nil, signingRegion: String? = nil) {
        self.endpoint = endpoint
        self.isHostnameImmutable = isHostnameImmutable
        self.signingName = signingName
        self.signingRegion = signingRegion
    }
    
    static func resolveEndpoint(partitions: [Partition], region: String) throws -> AWSEndpoint {
        if partitions.isEmpty {
            throw EndpointError.partitionsEmpty("The partitions array cannot be empty in order to properly resolve an AWS endpoint")
        }
        
        let candidate = partitions.first { $0.canResolveEndpoint(region: region)} ?? partitions[0]
        return try candidate.resolveEndpoint(region: region)
    }
}
