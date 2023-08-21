//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import ClientRuntime

public struct LanguageMetadata {
    let version: String
    let extras: [String: String]

    public init(version: String = swiftVersion, extras: [String: String] = [:]) {
        self.version = version
        self.extras = extras
    }
 }

extension LanguageMetadata: CustomStringConvertible {

    public var description: String {
        let extrasMetadata = !extras.isEmpty
            ? extras.map {
                " md/\($0.key.sanitizedForUserAgentToken)#\($0.value.sanitizedForUserAgentToken)"
            }.joined()
            : ""
        return "lang/swift#\(version.sanitizedForUserAgentToken)\(extrasMetadata)"
    }
}
