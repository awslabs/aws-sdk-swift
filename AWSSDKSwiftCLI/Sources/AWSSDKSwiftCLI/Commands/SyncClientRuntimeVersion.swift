//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import ArgumentParser
import Foundation
import PackageDescription

struct SyncClientRuntimeVersion: ParsableCommand {
    static var configuration = CommandConfiguration(
        abstract: "Sets the version of ClientRuntime in aws-sdk-swift to the version defined in smithy-swift"
    )
    
    @Argument(help: "The path to the aws-sdk-swift repository")
    var repoPath: String
    
    @Option(help: "The path to the smithy-swift repository. If no value is provided, then it assumes the repo is located next to the aws-sdk-swift repo (../smith-swift)")
    var smithySwiftPath: String?
    
    func run() throws {
        try FileManager.changeWorkingDirectory(repoPath)
        try syncClientRuntimeVersion()
    }
}

// MARK: - Helpers

extension SyncClientRuntimeVersion {
    /// Returns the path to the `smithy-swift` repository.
    ///
    /// - Returns: The path to the `smithy-swift` repository
    func resolveSmithySwiftPath() -> String {
        smithySwiftPath ?? "../smithy-swift"
    }
    
    /// Returns the version of ClientRuntime retrieved from the `Package.version` file located in `smithy-swift`.
    ///
    /// - Returns: The version of ClientRuntime retrieved from the `Package.version` file located in `smithy-swift`.
    func smithySwiftPackageVersion() throws -> Version {
        let path = resolveSmithySwiftPath() + "/Package.version"
        print("Loading ClientRuntime version from \(path)")
        let version = try Version.fromFile(path)
        print("Successfully loaded ClientRuntime version \(version.description)")
        return version
    }
    
    /// Syncs the version of ClientRuntime by setting the version to the value defined in the `Package.version` file located in`smithy-swift'.
    func syncClientRuntimeVersion() throws {
        print("Syncing ClientRuntime version...")
        let version = try smithySwiftPackageVersion()
        try setClientRuntimeVersion(version)
    }
    
    /// Sets the ClientRuntime version in `packageDependencies.plist` to the provided value.
    ///
    /// - Parameter version: The version to set for ClientRuntime.
    func setClientRuntimeVersion(_ version: Version) throws {
        print("Setting ClientRuntime version to \(version.description)")
        var packageDependencies = try PackageDependencies.load()
        packageDependencies.clientRuntimeVersion = version
        try packageDependencies.save()
        print("Successfully saved ClientRuntime version to \(version.description)")
    }
}
