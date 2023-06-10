//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import Foundation

/// A custom service-specific configuration that conforms to this protocol will be code-generated
/// for every AWS service.
public protocol AWSServiceSpecificConfiguration {
    /// The type for the service's endpoint resolver.
    associatedtype AWSServiceEndpointResolver

    var serviceName: String { get }
    var clientName: String { get }
    var endpointResolver: AWSServiceEndpointResolver { get }

    init(endpointResolver: AWSServiceEndpointResolver?) throws
}
