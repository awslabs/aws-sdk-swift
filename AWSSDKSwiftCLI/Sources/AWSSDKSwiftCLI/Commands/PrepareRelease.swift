//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import ArgumentParser
import Foundation
import PackageDescription

struct PrepareRelease: ParsableCommand {
    static var configuration = CommandConfiguration(
        abstract: "Prepares a repository for release",
        discussion: "If there are no changes, then this does nothing as there is nothing new to release"
    )
    
    enum Repo: String, ExpressibleByArgument {
        case sdk
        case smithySwift = "smithy-swift"
    }
    
    @Argument(help: "The repository type to release. sdk or smithy-swift")
    var repoType: Repo
    
    @Argument(help: "The path to the git repository.")
    var repoPath: String
    
    func run() throws {
        try FileManager.changeWorkingDirectory(repoPath)
        
        let previousVersion = try getPreviousVersion()
        guard try repoHasChanges(previousVersion) else { return }
        let newVersion = try createNewVersion(previousVersion)
        
        try stageFiles()
        try commitChanges(newVersion)
        try tagVersion(newVersion)
    }
}

// MARK: - Helpers

extension PrepareRelease {
    /// Returns the version of the previous release.
    /// This version is read from the version defined in the `Package.version` file.
    ///
    /// - Returns: The version of the previous release.
    func getPreviousVersion() throws -> Version {
        let previousVersion = try Version.fromFile("Package.version")
        print("Previous release version: \(previousVersion)")
        return previousVersion
    }
    
    
    /// Returns true if the `main` branch has changes since the previous release, otherwise returns false.
    ///
    /// - Parameter previousVersion: The version of the previous release
    /// - Returns: True if the `main` branch has changes since the previous release, otherwise returns false.
    func repoHasChanges(_ previousVersion: Version) throws -> Bool {
        let hasChanges = try Process.git.hasLocalChanges()
            || Process.git.diffHasChanges("main", "\(previousVersion)")
        if hasChanges {
            print("Changes detected between 'main' and the previous release \(previousVersion)")
        } else {
            print("No changes detected between 'main' and the previous release \(previousVersion)")
        }
        return hasChanges
    }
    
    /// Creates and returns a new version to be used for this release
    ///
    /// - Parameter previousVersion: The version of the previous release
    /// - Returns: A new version to be used for this release
    func createNewVersion(_ previousVersion: Version) throws -> Version {
        let newVersion = previousVersion.incrementingMinor()
        do {
          try "\(newVersion)".write(toFile: "Package.version" , atomically: true, encoding: .utf8)
        } catch {
          throw Error("Failed to write version \(newVersion) to Package.version")
        }
        print("Updated Package.version: \(newVersion)")
        return newVersion
    }
    
    /// Stages files to be committed
    func stageFiles() throws {
        let files: [String]
        switch repoType {
        case .sdk:
            files = [
                "Package.swift",
                "Package.version",
                "Core/Services",
                "Tests/Services"
            ]
        case .smithySwift:
            files = ["Package.version"]
        }
        
        try files
            .map{ Process.git.add($0) }
            .forEach { try _run($0) }
    }
    
    /// Commits the staged changes
    ///
    /// - Parameter newVersion: The version to use in the commit message
    func commitChanges(_ newVersion: Version) throws {
        try _run(Process.git.commit("Updates version to \(newVersion)"))
    }
    
    /// Tags the repository with the provided version
    ///
    /// - Parameter newVersion: The version to use for the tag
    func tagVersion(_ newVersion: Version) throws {
        try _run(Process.git.tag(newVersion, "Release \(newVersion)"))
    }
}
