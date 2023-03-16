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

struct GeneratePackageManifestCommand: ParsableCommand {
    static var configuration = CommandConfiguration(
        commandName: "generate-package-manifest",
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
        let generatePackageManifest = GeneratePackageManifest.standard(
            repoPath: repoPath,
            packageFileName: packageFileName,
            clientRuntimeVersion: clientRuntimeVersion,
            crtVersion: crtVersion,
            services: services.isEmpty ? nil : services
        )
        try generatePackageManifest.run()
    }
}

// MARK: - Generate Package Manifest

struct GeneratePackageManifest {
    let repoPath: String
    let packageFileName: String
    let clientRuntimeVersion: Version?
    let crtVersion: Version?
    let services: [String]?
    
    typealias BuildPackageManifest = (
        _ clientRuntimeVersion: Version,
        _ crtVersion: Version,
        _ services: [String]
    ) throws -> String
    let buildPackageManifest: BuildPackageManifest
    
    func run() throws {
        try FileManager.default.changeWorkingDirectory(repoPath)
        let contents = try generatePackageManifestContents()
        try savePackageManifest(contents)
    }

    // MARK: - Helpers

    /// Returns the contents of the generated package manifest.
    /// This determines the versions of the dependencies and the list of services to include and then genraetes the package manifest with those values.
    ///
    /// - Returns: The contents of the generated package manifest.
    func generatePackageManifestContents() throws -> String {
        let versions = try resolveVersions()
        let services = try resolveServices()
        log("Creating package manifest contents...")
        let contents = try buildPackageManifest(versions.clientRuntime, versions.crt, services)
        log("Successfully created package manifest contents")
        return contents
    }
    
    /// Saves the package manifest file.
    /// If no file exists, then this will create a new file. Otherwise, this will overwrite the existing file.
    ///
    /// - Parameter contents: The contents of the package manifest.
    func savePackageManifest(_ contents: String) throws {
        log("Saving package manifest to \(packageFileName)...")
        try contents.write(
            toFile: packageFileName,
            atomically: true,
            encoding: .utf8
        )
        log("Successfully saved package manifest to \(packageFileName)")
    }
    
    /// Returns the versions for ClientRuntime and CRT.
    /// If explcit versions are provided by the command, then this returns the specified versions.
    /// Otherwise, this returns the versions defined in `packageDependencies.plist`.
    ///
    /// - Returns: The versions for ClientRuntime and CRT.
    func resolveVersions() throws -> (clientRuntime: Version, crt: Version) {
        log("Resolving versions of dependencies...")
        let packageDependencies = LazyValue { try PackageDependencies.load() }
        let resolvedClientRuntime: Version
        let resolvedCRT: Version
    
        if let explicitVersion = self.clientRuntimeVersion {
            resolvedClientRuntime = explicitVersion
            log("Using ClientRuntime version provided: \(resolvedClientRuntime.description)")
        } else {
            resolvedClientRuntime = try packageDependencies.value().clientRuntimeVersion
            log("Using ClientRuntime version loaded from file: \(resolvedClientRuntime.description)")
        }
        
        if let explicitVersion = self.crtVersion {
            resolvedCRT = explicitVersion
            log("Using CRT version provided: \(resolvedCRT.description)")
        } else {
            resolvedCRT = try packageDependencies.value().awsCRTSwiftVersion
            log("Using CRT version loaded from file: \(resolvedCRT.description)")
        }
        
        log("""
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
        log("Resolving services...")
        let resolvedServices: [String]
        if let services = self.services {
            log("Using list of services provided.")
            resolvedServices = services
        } else {
            log("Using list of services that exist within Sources/Services")
            resolvedServices = try FileManager.default.enabledServices()
        }
        log("Resolved list of services: \(resolvedServices.count)")
        return resolvedServices
    }
}

extension GeneratePackageManifest {
    static func standard(
        repoPath: String,
        packageFileName: String,
        clientRuntimeVersion: Version? = nil,
        crtVersion: Version? = nil,
        services: [String]? = nil
    ) -> Self {
        GeneratePackageManifest(
            repoPath: repoPath,
            packageFileName: packageFileName,
            clientRuntimeVersion: clientRuntimeVersion,
            crtVersion: crtVersion,
            services: services
        ) { _clientRuntimeVersion, _crtVersion, _services in
            let builder = PackageManifestBuilder(
                clientRuntimeVersion: _clientRuntimeVersion,
                crtVersion: _crtVersion,
                services: _services
            )
            return try builder.build()
        }
    }
}
