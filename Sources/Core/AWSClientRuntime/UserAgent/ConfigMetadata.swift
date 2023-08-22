//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

struct ConfigMetadata {
    let type: ConfigMetadataType

    init(type: ConfigMetadataType) {
        self.type = type
    }
 }

extension ConfigMetadata: CustomStringConvertible {

    var description: String {
        switch type {
        case .retry(let mode):
            return "cfg/retry-mode#\(mode.rawValue.sanitizedForUserAgentToken)"
        }
    }
}

enum ConfigMetadataType {
    case retry(AWSRetryMode)
}
