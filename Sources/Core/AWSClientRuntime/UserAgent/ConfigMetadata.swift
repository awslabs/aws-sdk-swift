//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

public struct ConfigMetadata {
    let type: ConfigMetadataType

    public init(type: ConfigMetadataType) {
        self.type = type
    }
 }

extension ConfigMetadata: CustomStringConvertible {

    public var description: String {
        switch type {
        case .retry(let mode):
            return "cfg/retry-mode#\(mode.rawValue.sanitizedForUserAgentToken)"
        }
    }
}

public enum ConfigMetadataType {
    case retry(AWSRetryMode)
}
