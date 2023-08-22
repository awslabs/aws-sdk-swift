//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

struct APIMetadata {
    let serviceID: String
    let version: String

    init(serviceID: String, version: String) {
        self.serviceID = serviceID
        self.version = version
    }
}

extension APIMetadata: CustomStringConvertible {

    /// Provides API metadata in string form, suitable for inclusion in a user-agent string.
    ///
    /// For modular service clients, API metadata MUST be included following this format:
    ///
    /// `api/service-id "#" version`
    var description: String {
        let formattedServiceID = serviceID.replacingOccurrences(of: " ", with: "_").lowercased()
        return "api/\(formattedServiceID.sanitizedForUserAgentToken)#\(version.sanitizedForUserAgentToken)"
    }
}
