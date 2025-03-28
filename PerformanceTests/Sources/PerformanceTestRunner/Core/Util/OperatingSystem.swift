//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

enum OperatingSystem: String {
    case macOS = "macOS"
    case linux = "linux"
    case unknownOS = "unknown"

    static var current: OperatingSystem {
    #if os(macOS)
        return .macOS
    #elseif os(Linux)
        return .linux
    #else
        return .unknownOS
    #endif
    }
}
