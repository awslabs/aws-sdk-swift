//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import Foundation
import ArgumentParser
import PackageDescription

// MARK: - Decodable

extension Version: Decodable {
    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let value = try container.decode(String.self)
        self.init(stringLiteral: value)
    }
}

// MARK: - Loading from File

extension Version {
    /// Returns a version loaded from the provided file.
    /// The file's contents must only contain the version and nothing else.
    /// This is used to load a Version from a `Package.version` file.
    ///
    /// - Parameter filePath: The path to file containing the version
    /// - Returns: A version loaded from the provided file.
    static func fromFile(_ filePath: String) throws -> Version {
        let fileContents = try FileManager.loadContents(atPath: filePath)
        
        guard let versionString = String(data: fileContents, encoding: .utf8) else {
            throw Error("Failed to convert data to string for file at path: \(filePath)")
        }
        
        let normalizedVersionString = versionString.trimmingCharacters(in: .whitespacesAndNewlines)
        
        guard let version = Version.init(normalizedVersionString) else {
            throw Error("Failed to parse version from string \(normalizedVersionString)")
        }
        
        return version
    }
}

// MARK: - Incrementing versions

extension Version {
    /// Returns a new version by incrementing the major version of the receiver
    ///
    /// - Returns: A new version by incrementing the major version of the receiver
    func incrementingMajor() -> Self {
       Version(
            self.major + 1,
            0,
            0,
            prereleaseIdentifiers: prereleaseIdentifiers,
            buildMetadataIdentifiers: buildMetadataIdentifiers
        )
    }
    
    /// Returns a new version by incrementing the minor version of the receiver
    ///
    /// - Returns: A new version by incrementing the minor version of the receiver
    func incrementingMinor() -> Self {
        Version(
            self.major,
            self.minor + 1,
            0,
            prereleaseIdentifiers: prereleaseIdentifiers,
            buildMetadataIdentifiers: buildMetadataIdentifiers
        )
    }
    
    /// Returns a new version by incrementing the patch version of the receiver
    ///
    /// - Returns: A new version by incrementing the patch version of the receiver
    func incrementingPatch() -> Self {
        Version(
            self.major,
            self.minor,
            self.patch + 1,
            prereleaseIdentifiers: prereleaseIdentifiers,
            buildMetadataIdentifiers: buildMetadataIdentifiers
        )
    }
}

// MARK: - ExpressibleByArgument

extension Version: ExpressibleByArgument {
    public init?(argument: String) {
        self.init(argument)
    }
}
