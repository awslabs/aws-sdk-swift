//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

struct FeatureMetadata {
    let feature: String
    let version: String?
    let additionalMetadata: [AdditionalMetadata]

    init(feature: String, version: String? = nil, additionalMetadata: [AdditionalMetadata] = []) {
        self.feature = feature
        self.version = version
        self.additionalMetadata = additionalMetadata
    }
 }

extension FeatureMetadata: CustomStringConvertible {

    var description: String {
        var description = "ft/\(feature.userAgentToken)"
        if let version = version, !version.isEmpty {
            description += "#\(version.userAgentToken)"
        }
        return description
    }
}
