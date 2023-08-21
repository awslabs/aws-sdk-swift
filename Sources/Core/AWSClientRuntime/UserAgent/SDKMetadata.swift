//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

public struct SDKMetadata {
    let version: String

    public init(version: String) {
        self.version = version
    }
}

extension SDKMetadata: CustomStringConvertible {
    public var description: String {
        return "aws-sdk-swift/\(version.sanitizedForUserAgentToken)"
    }
}
