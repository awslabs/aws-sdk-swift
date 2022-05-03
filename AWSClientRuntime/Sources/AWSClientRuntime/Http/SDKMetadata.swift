//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

public struct SDKMetadata {
    let name: String
    let version: String
    
    public init(name: String, version: String) {
        self.name = name
        self.version = version
    }
}

extension SDKMetadata: CustomStringConvertible {
    public var description: String {
        return "aws-sdk-\(name)/\(version)"
    }
}
