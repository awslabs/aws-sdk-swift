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
    
    public init(version: String = currentSwiftVersion, extras: [String: String] = [String: String]()) {
        self.version = version
        self.extras = extras
    }
 }

extension LanguageMetadata: CustomStringConvertible {
    public var description: String {
        return !extras.isEmpty ? "lang/swift/\(version)\(extras.map {" md/\($0.key)/\($0.value.encodeUaToken())"})"
            : "lang/swift/\(version)"
    }
}
