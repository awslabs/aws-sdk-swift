//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//
import class Foundation.NSRegularExpression

public struct Partition {

    /// The partition name/id e.g. "aws"
    let id: String

    /// The regular expression that specified the pattern that region names in the endpoint adhere to
    let regionRegex: NSRegularExpression

    /// Endpoint that works across all regions or if [isRegionalized] is false
    let partitionEndpoint: String


    /// Flag indicating whether or not the service is regionalized in the partition. Some services have only a single,
    /// partition-global endpoint (e.g. CloudFront).
    let isRegionalized: Bool

    
    /// Default endpoint values for the partition. Some or all of the defaults specified may be superseded
    /// by an entry in [endpoints].
    let defaults: ServiceEndpointMetadata

    /// Map of endpoint names to their definitions
    let endpoints: [String: ServiceEndpointMetadata]
    
    public init(id: String,
                regionRegex: NSRegularExpression,
                partitionEndpoint: String,
                isRegionalized: Bool,
                defaults: ServiceEndpointMetadata,
                endpoints: [String: ServiceEndpointMetadata]) {
        self.id = id
        self.regionRegex = regionRegex
        self.partitionEndpoint = partitionEndpoint
        self.isRegionalized = isRegionalized
        self.defaults = defaults
        self.endpoints = endpoints
    }
    
    func canResolveEndpoint(region: String) -> Bool {
        return endpoints[region] != nil || regionRegex.matches(region)
    }
    
    func resolveEndpoint(region: String) throws -> AWSEndpoint {
        let resolvedRegion = region.isEmpty && !partitionEndpoint.isEmpty ? partitionEndpoint : region
        let endpointDefinition = endpointDefinitionForRegion(region: resolvedRegion)
        return try endpointDefinition.resolve(region: region, defaults: defaults)
    }
    
    func endpointDefinitionForRegion(region: String) -> ServiceEndpointMetadata {
        return (!isRegionalized ? endpoints[partitionEndpoint] : endpoints[region]) ?? ServiceEndpointMetadata()
    }
}
