//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

enum OperatingSystem: String {
    case macOS = "macOS"
    case Linux = "Linux"
    case Unknown = "Unknown"

    static var current: OperatingSystem {
    #if os(macOS)
        return .macOS
    #elseif os(Linux)
        return .Linux
    #else
        return .Unknown
    #endif
    }
}
