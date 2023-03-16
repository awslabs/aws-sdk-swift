//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import ArgumentParser
import Foundation
import PackageDescription

// MARK: - Command

struct PrepareReleaseCommand: ParsableCommand {
    static var configuration = CommandConfiguration(
        commandName: "prepare-release",
        abstract: "Prepares a repository for release",
        discussion: "If there are no changes, then this does nothing as there is nothing new to release"
    )
    
    @Argument(help: "The repository type to release. sdk or smithy-swift")
    var repoType: PrepareRelease.Repo
    
    @Argument(help: "The path to the git repository.")
    var repoPath: String
    
    func run() throws {
        let prepareRelease = PrepareRelease.standard(
            repoType: repoType,
            repoPath: repoPath
        )
        try prepareRelease.run()
    }
}

// MARK: - Prepare Release

/// Prepares a release for the specified repository.
struct PrepareRelease {
    enum Repo: String, ExpressibleByArgument {
        case awsSdkSwift = "aws-sdk-swift"
        case smithySwift = "smithy-swift"
    }
    
    /// The repository type to prepare the release
    /// This dictates which files are staged for commit
    let repoType: Repo
    
    /// The path to the package repository
    let repoPath: String
    
    typealias DiffChecker = (_ branch: String, _ version: Version) throws -> Bool
    /// Returns true if the repsoitory has changes given the current branch and the version to compare, otherwise returns false
    let diffChecker: DiffChecker
    
    /// Prepares a release for the specified repository.
    /// If the respository doesn't have any changes, then this does nothing.
    func run() throws {
        try FileManager.default.changeWorkingDirectory(repoPath)
        
        let previousVersion = try getPreviousVersion()
        guard try repoHasChanges(previousVersion) else { return }
        let newVersion = try createNewVersion(previousVersion)
        
        try stageFiles()
        try commitChanges(newVersion)
        try tagVersion(newVersion)
    }
    
    // MARK: - Helpers
    
    /// Returns the version of the previous release.
    /// This version is read from the version defined in the `Package.version` file.
    ///
    /// - Returns: The version of the previous release.
    func getPreviousVersion() throws -> Version {
        let previousVersion = try Version.fromFile("Package.version")
        log("Previous release version: \(previousVersion)")
        return previousVersion
    }
    
    
    /// Returns true if the `main` branch has changes since the previous release, otherwise returns false.
    ///
    /// - Parameter previousVersion: The version of the previous release
    /// - Returns: True if the `main` branch has changes since the previous release, otherwise returns false.
    func repoHasChanges(_ previousVersion: Version) throws -> Bool {
        let hasChanges = try diffChecker("main", previousVersion)
        if hasChanges {
            log("Changes detected between 'main' and the previous release \(previousVersion)")
        } else {
            log("No changes detected between 'main' and the previous release \(previousVersion)")
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
        log("Updated Package.version: \(newVersion)")
        return newVersion
    }
    
    /// Stages files to be committed
    func stageFiles() throws {
        let files: [String]
        switch repoType {
        case .awsSdkSwift:
            files = [
                "Package.swift",
                "Package.version",
                "Core/Services",
                "Tests/Services"
            ]
        case .smithySwift:
            files = ["Package.version"]
        }
        
        try _run(Process.git.add(files))
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

// MARK: - Factory

extension PrepareRelease {
    /// Returns the standard release preparer.
    /// This configures the diff checker to return true if the repository has local changes or if the specified branch is different than the specified version.
    ///
    /// - Parameters:
    ///   - repoType: The repository type to prepare the release
    ///   - repoPath: The path to the package repository
    ///
    /// - Returns: The standard release preparer
    static func standard(
        repoType: Repo,
        repoPath: String
    ) -> Self {
        PrepareRelease(repoType: repoType, repoPath: repoPath) { branch, version in
            try Process.git.hasLocalChanges()
                || Process.git.diffHasChanges(branch, "\(version)")
        }
    }
}
