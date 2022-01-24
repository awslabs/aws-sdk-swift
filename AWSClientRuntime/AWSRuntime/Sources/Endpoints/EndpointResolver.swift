//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

/// Resolves endpoints for a given service and region
public protocol EndpointResolver {

  /// Resolve the `AWSEndpoint` for the given serviceId and region
  func resolve(serviceId: String, region: String) throws -> AWSEndpoint
}
