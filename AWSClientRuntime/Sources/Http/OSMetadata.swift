//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//
import ClientRuntime
        
public struct OSMetadata {
    let family: OSFamily
    let version: String?
    
    public init(family: OSFamily, version: String? = nil) {
        self.family = family
        self.version = version
    }
}

extension OSMetadata: CustomStringConvertible {
    public var description: String {
        guard let version = version else {
            return "os/\(family)"
        }
        return "os/\(family)/\(version.encodeUaToken())"
    }
}
