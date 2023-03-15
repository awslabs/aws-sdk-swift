//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import Foundation

extension FileManager {
    /// Changes the working directory to the provided path
    static func changeWorkingDirectory(_ path: String) throws {
        print("Changing working directory to: \(path)")
        guard FileManager.default.changeCurrentDirectoryPath(path) else {
            throw Error("Failed to change directory to \(path)")
        }
        print("Changed working directory to: \(FileManager.default.currentDirectoryPath)")
    }
    
    /// Returns the contents of a file located at the provied path.
    static func loadContents(atPath path: String) throws -> Data {
        guard let fileContents = FileManager.default.contents(atPath: path) else {
            throw Error("Failed to load data for file at path \(path)")
        }
        return fileContents
    }
    
    /// Returns the list of enabled services.
    /// A service is considered enabled if it was generated successfully and therefore a folder for the service and its contents, exists within `Sources/Services`
    ///
    /// - Returns: The list of enabled services.
    static func enabledServices() throws -> [String] {
        try FileManager.default
            .contentsOfDirectory(atPath: "Sources/Services")
            .sorted()
    }
}
