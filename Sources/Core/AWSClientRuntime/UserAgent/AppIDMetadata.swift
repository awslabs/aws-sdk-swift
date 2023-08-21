//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import class Foundation.ProcessInfo

public struct AppIDMetadata {
    let name: String

    public init(name: String) {
        self.name = name
    }
}

extension AppIDMetadata: CustomStringConvertible {

    public var description: String {
        return "app/\(name.sanitizedForUserAgentToken)"
    }
}
