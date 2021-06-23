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
    public var description: String {
        let formattedServiceId = serviceId.replacingOccurrences(of: " ", with: "-").lowercased()
        return "api/\(formattedServiceId)/\(version.sanitizeForUserAgentToken())"
    }
}
