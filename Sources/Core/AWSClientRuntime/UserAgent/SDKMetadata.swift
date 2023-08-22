//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

struct SDKMetadata {
    let version: String

    init(version: String) {
        self.version = version
    }
}

extension SDKMetadata: CustomStringConvertible {

    var description: String {
        return "aws-sdk-swift/\(version.sanitizedForUserAgentToken)"
    }
}
