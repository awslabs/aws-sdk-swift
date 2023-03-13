//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import Foundation

extension Process {
    /// Creates a process using `/usr/bin/env` as the executable
    /// This makes it easy to create a process  for any command, as long as the corresponding executable exists in the PATH.
    ///
    /// - Parameter argsList: The command arguments, such as `["swift", "build"]`
    convenience init(_ argsList: [String]) {
        self.init()
        self.executableURL = URL(fileURLWithPath: "/usr/bin/env")
        self.arguments = argsList
    }
    
    /// Creates a process using `/usr/bin/env` as the executable
    /// This makes it easy to create a process  for any command, as long as the corresponding executable exists in the PATH.
    ///
    /// - Parameter args: The command arguments, such as `"swift", "build"`
    convenience init(_ args: String...) {
        self.init(Array(args))
    }
    
    /// Returns the executable and arguments combined as a string
    var commandString: String {
        let items = [executableURL?.path] + (arguments ?? [])
        return items
            .compactMap { $0 }
            .joined(separator: " ")
    }
}

/// Runs the pprocess and prints out the process's full command.
func _run(_ process: Process) throws {
    print("Running process: \(process.commandString)")
    try process.run()
}
