//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

/// Contains config properties specific to one AWS service
///
/// A custom service-specific configuration that conforms to this protocol will be code-generated
/// for every AWS service, and an instance of it will be exposed by `AWSClientConfiguration`'s
/// `serviceSpecific` property.
public protocol AWSServiceSpecificConfiguration {
    /// The type for the service's endpoint resolver.
    associatedtype AWSServiceEndpointResolver

    var serviceName: String { get }
    var clientName: String { get }
    var endpointResolver: AWSServiceEndpointResolver { get }

    init(endpointResolver: AWSServiceEndpointResolver?) throws
}
