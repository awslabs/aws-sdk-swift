//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

struct FeatureMetadata {
    let feature: String
    let version: String?

    init(feature: String, version: String? = nil) {
        self.feature = feature
        self.version = version
    }
 }

extension FeatureMetadata: CustomStringConvertible {

    var description: String {
        if let version = version, !version.isEmpty {
            return "ft/\(feature.sanitizedForUserAgentToken)#\(version.sanitizedForUserAgentToken)"
        }
        return "ft/\(feature.sanitizedForUserAgentToken)"
    }
}
