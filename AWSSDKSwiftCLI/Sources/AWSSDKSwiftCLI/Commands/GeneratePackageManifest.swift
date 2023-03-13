//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import ArgumentParser
import Foundation
import PackageDescription

struct GeneratePackageManifest: ParsableCommand {
    static var configuration = CommandConfiguration(
        abstract: "Generates the Package.swift manifest for the aws-sdk-swift package."
    )
    
    @Argument(help: "The path to the aws-sdk-swift repository")
    var repoPath: String
    
    @Option(help: "The file name of the package manifest. Defaults to Package.swift")
    var packageFileName: String = "Package.swift"
    
    @Option(help: "The version to set for ClientRuntime in aws-sdk-swift. This defaults to the value specified in packageDependencies.plist")
    var clientRuntimeVersion: Version?
    
    @Option(help: "The version to set for CRT in aws-sdk-swift. This defaults to the value specified in packageDependencies.plist")
    var crtVersion: Version?
    
    @Option(help: "The names of the services to include in the package manifest. This defaults to all services located in aws-sdk-swift/Sources/Services")
    var services: [String] = []
    
    func run() throws {
        try FileManager.changeWorkingDirectory(repoPath)
        let contents = try generatePackageManifestContents()
        try savePackageManifest(contents)
    }
}

// MARK: - Helpers

extension GeneratePackageManifest {
    /// Returns the contents of the generated package manifest.
    /// This determines the versions of the dependencies and the list of services to include and then genraetes the package manifest with those values.
    ///
    /// - Returns: The contents of the generated package manifest.
    func generatePackageManifestContents() throws -> String {
        let versions = try resolveVersions()
        let services = try resolveServices()
        print("Creating package manifest contents...")
        let builder = PackageManifestBuilder(
            clientRuntimeVersion: versions.clientRuntime,
            crtVersion: versions.crt,
            services: services
        )
        let contents = try builder.build()
        print("Successfully created package manifest contents")
        return contents
    }
    
    /// Saves the package manifest file.
    /// If no file exists, then this will create a new file. Otherwise, this will overwrite the existing file.
    ///
    /// - Parameter contents: The contents of the package manifest.
    func savePackageManifest(_ contents: String) throws {
        print("Saving package manifest to \(packageFileName)...")
        try contents.write(
            toFile: packageFileName,
            atomically: true,
            encoding: .utf8
        )
        print("Successfully saved package manifest to \(packageFileName)")
    }
    
    /// Returns the versions for ClientRuntime and CRT.
    /// If explcit versions are provided by the command, then this returns the specified versions.
    /// Otherwise, this returns the versions defined in `packageDependencies.plist`.
    ///
    /// - Returns: The versions for ClientRuntime and CRT.
    func resolveVersions() throws -> (clientRuntime: Version, crt: Version) {
        print("Resolving versions of dependencies...")
        let packageDependencies = LazyValue { try PackageDependencies.load() }
        let resolvedClientRuntime: Version
        let resolvedCRT: Version
    
        if let explicitVersion = self.clientRuntimeVersion {
            resolvedClientRuntime = explicitVersion
            print("Using ClientRuntime version provided: \(resolvedClientRuntime.description)")
        } else {
            resolvedClientRuntime = try packageDependencies.value().clientRuntimeVersion
            print("Using ClientRuntime version loaded from file: \(resolvedClientRuntime.description)")
        }
        
        if let explicitVersion = self.crtVersion {
            resolvedCRT = explicitVersion
            print("Using CRT version provided: \(resolvedCRT.description)")
        } else {
            resolvedCRT = try packageDependencies.value().awsCRTSwiftVersion
            print("Using CRT version loaded from file: \(resolvedCRT.description)")
        }
        
        print("""
        Resolved versions of dependencies:
            * ClientRuntime: \(resolvedClientRuntime.description)
            * CRT: \(resolvedCRT.description)
        """)
            
        return (
            clientRuntime: resolvedClientRuntime,
            crt: resolvedCRT
        )
    }
    
    /// Returns the list of services to include in the package manifest.
    /// If an explicit list of services was provided by the command, then this returns the specified services.
    /// Otherwise, this returns the list of services that exist within `Sources/Services`
    ///
    /// - Returns: The list of services to include in the package manifest
    func resolveServices() throws -> [String] {
        print("Resolving services...")
        let services: [String]
        if self.services.isEmpty {
            print("Using list of services that exist within Sources/Services")
            services = try enabledServices()
        } else {
            print("Using list of services provided.")
            services = self.services
        }
        print("Resolved list of services: \(services.count)")
        return services
    }
    
    /// Returns the list of enabled services.
    /// A service is considered enabled if it was generated successfully and therefore a folder for the service and its contents, exists within `Sources/Services`
    ///
    /// - Returns: The list of enabled services.
    func enabledServices() throws -> [String] {
        try FileManager.default
            .contentsOfDirectory(atPath: "Sources/Services")
            .sorted()
    }
}
