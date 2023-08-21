//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

public struct APIMetadata {
    let serviceId: String
    let version: String

    public init(serviceId: String, version: String) {
        self.serviceId = serviceId
        self.version = version
    }
}

extension APIMetadata: CustomStringConvertible {

    /// Provides API metadata in string form, suitable for inclusion in a user-agent string.
    ///
    /// For modular service clients, API metadata MUST be included following this format:
    ///
    /// `api/service-id "#" version`
    public var description: String {
        let formattedServiceId = serviceId.replacingOccurrences(of: " ", with: "-").lowercased()
        return "api/\(formattedServiceId.sanitizedForUserAgentToken)#\(version.sanitizedForUserAgentToken)"
    }
}
