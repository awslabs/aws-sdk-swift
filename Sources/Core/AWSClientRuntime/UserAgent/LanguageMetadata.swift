//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import ClientRuntime

struct LanguageMetadata {
    let version: String
    let extras: [String: String]

    init(version: String = swiftVersion, extras: [String: String] = [:]) {
        self.version = version
        self.extras = extras
    }
 }

extension LanguageMetadata: CustomStringConvertible {

    var description: String {
        let extrasMetadata = !extras.isEmpty
            ? extras.map {
                " md/\($0.key.sanitizedForUserAgentToken)#\($0.value.sanitizedForUserAgentToken)"
            }.joined()
            : ""
        return "lang/swift#\(version.sanitizedForUserAgentToken)\(extrasMetadata)"
    }
}
