//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//
import ClientRuntime
        
public struct OSMetadata {
    let family: PlatformOperatingSystem
    let version: String?
    
    public init(family: PlatformOperatingSystem, version: String? = nil) {
        self.family = family
        self.version = version
    }
}

extension OSMetadata: CustomStringConvertible {
    public var description: String {
        guard let version = version else {
            return "os/\(family)"
        }
        let versionSanitized = version.sanitizeForUserAgentToken()
        guard !versionSanitized.isEmpty else {
            return "os/\(family)"
        }
        
        return "os/\(family)/\(versionSanitized)"
    }
}
