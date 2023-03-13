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
    }
    
    /// Returns the contents of a file located at the provied path.
    static func loadContents(atPath path: String) throws -> Data {
        guard let fileContents = FileManager.default.contents(atPath: path) else {
            throw Error("Failed to load data for file at path \(path)")
        }
        return fileContents
    }
}
