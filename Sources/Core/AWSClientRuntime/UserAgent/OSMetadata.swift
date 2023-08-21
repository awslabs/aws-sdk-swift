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
            return "os/\(family.userAgentName)"
        }
        let versionSanitized = version.sanitizedForUserAgentToken
        guard !versionSanitized.isEmpty else {
            return "os/\(family.userAgentName)"
        }

        return "os/\(family.userAgentName)#\(versionSanitized)"
    }
}

private extension PlatformOperatingSystem {

    var userAgentName: String {
        switch self {
        case .windows: return "windows"
        case .linux: return "linux"
        case .iOS: return "ios"
        case .macOS: return "macos"
        case .watchOS: return "watchos"
        case .tvOS: return "tvos"
        case .unknown: return "other"
        }
    }
}
