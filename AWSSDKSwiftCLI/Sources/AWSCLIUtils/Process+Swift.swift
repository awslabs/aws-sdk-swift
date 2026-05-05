//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import Foundation

public extension Process {

    struct Swift {

        /// Returns a process for executing `swift test`
        public func test(envVars: [String: String] = [:]) -> Process {
            Process(envVars: envVars, argsList: ["swift", "test"])
        }
    }

    static var swift: Swift { Swift() }
}
