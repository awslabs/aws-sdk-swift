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
    var sanitizedVersion: String {
        return version.sanitizeForUserAgentToken()
    }

    public init(version: String = swiftVersion, extras: [String: String] = [String: String]()) {
        self.version = version
        self.extras = extras
    }
 }

extension LanguageMetadata: CustomStringConvertible {
    public var description: String {
        let extrasMetadata = !extras.isEmpty
            ? extras.map {
                " md/\($0.key.sanitizeForUserAgentToken())/\($0.value.sanitizeForUserAgentToken())"
            }.joined()
            : ""
        return "lang/swift/\(sanitizedVersion)\(extrasMetadata)"
    }
}
