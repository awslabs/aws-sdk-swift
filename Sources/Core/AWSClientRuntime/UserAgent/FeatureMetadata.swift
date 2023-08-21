//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

public struct FeatureMetadata {
    let feature: String
    let version: String?

    public init(feature: String, version: String? = nil) {
        self.feature = feature
        self.version = version
    }
 }

extension FeatureMetadata: CustomStringConvertible {

    public var description: String {
        if let version = version, !version.isEmpty {
            return "ft/\(feature.sanitizedForUserAgentToken)#\(version.sanitizedForUserAgentToken)"
        }
        return "ft/\(feature.sanitizedForUserAgentToken)"
    }
}
