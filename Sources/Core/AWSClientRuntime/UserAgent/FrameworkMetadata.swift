//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import ClientRuntime

public struct FrameworkMetadata {
    let name: String
    let version: String
    let extras: [String: String]

    var sanitizedName: String {
        name.sanitizedForUserAgentToken
    }
    var sanitizedVersion: String {
        version.sanitizedForUserAgentToken
    }

    public init(name: String, version: String, extras: [String: String] = [String: String]()) {
        self.name = name
        self.version = version
        self.extras = extras
    }
 }

extension FrameworkMetadata: CustomStringConvertible {
    public var description: String {
        let extrasMetaData = !extras.isEmpty
            ? extras.map {
                " md/\($0.key.sanitizedForUserAgentToken)#\($0.value.sanitizedForUserAgentToken)"
            }.joined()
            : ""
        return "lib/\(sanitizedName)#\(sanitizedVersion)\(extrasMetaData)"
    }
}
