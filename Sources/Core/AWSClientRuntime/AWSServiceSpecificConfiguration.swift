//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import protocol ClientRuntime.AuthScheme
import protocol ClientRuntime.AuthSchemeResolver

/// Contains config properties specific to one AWS service
///
/// A custom service-specific configuration that conforms to this protocol will be code-generated
/// for every AWS service, and an instance of it will be exposed by `AWSClientConfiguration`'s
/// `serviceSpecific` property.
public protocol AWSServiceSpecificConfiguration {

    /// The type for the service's endpoint resolver.
    associatedtype AWSServiceEndpointResolver

    /// The name of the service, i.e. "STS".
    ///
    /// Derived from the service's `sdkId` property.
    var serviceName: String { get }

    /// The name of the service's client, i.e. "STSClient".
    var clientName: String { get }

    /// An endpoint resolver for this service.
    ///
    /// If none is provided at compile time, the service will provide one.
    var endpointResolver: AWSServiceEndpointResolver { get }

    /// Creates a service-specific configuration for this service
    /// - Parameter endpointResolver: An endpoint resolver for the service, or `nil` to let
    /// the service resolve its own endpoint.
    init(
        endpointResolver: AWSServiceEndpointResolver?,
        authSchemeResolver: ClientRuntime.AuthSchemeResolver?,
        authSchemes: Array<ClientRuntime.AuthScheme>?
    ) throws
    
    /// List of configured auth schemes for the service.
    ///
    /// If none is provided at compile time, value will default to auth schemes supported by the service as defined in its model.
    var authSchemes: Array<ClientRuntime.AuthScheme> { get }
    
    /// The auth scheme resolver to use for the service.
    ///
    /// If none is provided at compile time, value will default to default auth scheme resolver for the service generated based on its model.
    var authSchemeResolver: ClientRuntime.AuthSchemeResolver { get }
}
