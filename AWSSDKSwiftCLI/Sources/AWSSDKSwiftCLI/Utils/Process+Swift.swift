//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import Foundation
import PackageDescription

extension Process {
    struct Swift {
        /// Returns a process for executing swift commands.
        private func swiftProcess(_ args: [String]) -> Process {
            Process(["swift"] + args)
        }
        
        /// Returns a process for executing `swift test`
        func test() -> Process {
            swiftProcess(["test"])
        }
    }
    
    static var swift: Swift { Swift() }
}
