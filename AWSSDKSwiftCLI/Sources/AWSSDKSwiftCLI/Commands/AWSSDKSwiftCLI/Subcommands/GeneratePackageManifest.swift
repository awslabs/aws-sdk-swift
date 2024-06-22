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

    @Flag(help: "If the package manifest should include the integration tests.")
    var includeIntegrationTests: Bool = false
    
    @Flag(help: "If the package manifest should include the protocol tests.")
    var includeProtocolTests: Bool = false

    @Flag(help: "If the package manifest should exclude AWS services.")
    var excludeAWSServices = false

    @Flag(help: "If the package manifest should exclude runtime tests.")
    var excludeRuntimeTests = false

    func run() throws {
        let generatePackageManifest = GeneratePackageManifest.standard(
            repoPath: repoPath,
            packageFileName: packageFileName,
            clientRuntimeVersion: clientRuntimeVersion,
            crtVersion: crtVersion,
            services: services.isEmpty ? nil : services,
            includeIntegrationTests: includeIntegrationTests,
            includeProtocolTests: includeProtocolTests,
            excludeAWSServices: excludeAWSServices,
            excludeRuntimeTests: excludeRuntimeTests
        )
        try generatePackageManifest.run()
    }
}

// MARK: - Generate Package Manifest

/// Generates a new package manifest with the provided parameters
struct GeneratePackageManifest {
    /// The path to the package repository
    let repoPath: String
    /// The name of the package manifest file, usually `Package.swift`
    let packageFileName: String
    /// The version to set for the ClientRuntime dependency
    /// /// If `nil` then the version is set to the corresponding value defined in `packageDependencies.plist`
    let clientRuntimeVersion: Version?
    /// The verstion to set for the CRT depdenency
    /// If `nil` then the version is set to the corresponding value defined in `packageDependencies.plist`
    let crtVersion: Version?
    /// The list of services to include as products
    /// If `nil` then the list is populated with the names of all items within the `Sources/Services` directory
    let services: [String]?
    /// If the package manifest should include the integration tests.
    let includeIntegrationTests: Bool
    /// If the package manifest should include the protocol tests.
    let includeProtocolTests: Bool
    /// If the package manifest should exclude the AWS services.
    let excludeAWSServices: Bool
    /// If the package manifest should exclude runtime unit tests.
    let excludeRuntimeTests: Bool

    typealias BuildPackageManifest = (
        _ clientRuntimeVersion: Version,
        _ crtVersion: Version,
        _ services: [PackageManifestBuilder.Service]
    ) throws -> String
    /// Returns the contents of the package manifest file given the versions of dependencies and the list of services.
    let buildPackageManifest: BuildPackageManifest
    
    /// Generates a package manifest file and saves it to `packageFileName`
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
        let servicesWithIntegrationTests = try resolveServicesWithIntegrationTests()
        let services = try resolveServices().map {
            PackageManifestBuilder.Service(
                name: $0,
                includeIntegrationTests: servicesWithIntegrationTests.contains($0)
            )
        }
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
        let packageDependencies = LazyValue<PackageDependencies> {
            do {
                return try PackageDependencies.load()
            } catch let error as Error {
                log(level: .error, "\(error.message)")
                fatalError(error.message)
            }
        }
        let resolvedClientRuntime: Version
        let resolvedCRT: Version
    
        if let explicitVersion = self.clientRuntimeVersion {
            resolvedClientRuntime = explicitVersion
            log("Using ClientRuntime version provided: \(resolvedClientRuntime.description)")
        } else {
            resolvedClientRuntime = packageDependencies.value.clientRuntimeVersion
            log("Using ClientRuntime version loaded from file: \(resolvedClientRuntime.description)")
        }
        
        if let explicitVersion = self.crtVersion {
            resolvedCRT = explicitVersion
            log("Using CRT version provided: \(resolvedCRT.description)")
        } else {
            resolvedCRT = packageDependencies.value.awsCRTSwiftVersion
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

    /// Returns the list of services to include in the package manifest.
    /// If an explicit list of services was provided by the command, then this returns the specified services.
    /// Otherwise, this returns the list of services that exist within `Sources/Services`
    ///
    /// - Returns: The list of services to include in the package manifest
    func resolveServicesWithIntegrationTests() throws -> [String] {
        log("Resolving services with integration tests...")
        let resolvedServices = try FileManager
            .default
            .integrationTests()
            .map { $0.replacingOccurrences(of: "IntegrationTests", with: "") }
        log("List of services with integration tests: \(resolvedServices.count)")
        return resolvedServices
    }
}

// MARK: - Factory

extension GeneratePackageManifest {
    /// Returns the standard  package manifest generator
    /// This configures `buildPackageManifest` to use `PackageManifestBuilder`
    ///
    /// - Parameters:
    ///   - repoPath: The path to the package repository
    ///   - packageFileName: The name of the package manifest file, usually `Package.swift`
    ///   - clientRuntimeVersion: The version to set for the ClientRuntime dependency
    ///   - crtVersion: The verstion to set for the CRT depdenency
    ///   - services: The list of services to include as products
    ///
    /// - Returns: the standard package manifest generator
    static func standard(
        repoPath: String,
        packageFileName: String,
        clientRuntimeVersion: Version? = nil,
        crtVersion: Version? = nil,
        services: [String]? = nil,
        includeIntegrationTests: Bool = false,
        includeProtocolTests: Bool = false,
        excludeAWSServices: Bool = false,
        excludeRuntimeTests: Bool = false
    ) -> Self {
        GeneratePackageManifest(
            repoPath: repoPath,
            packageFileName: packageFileName,
            clientRuntimeVersion: clientRuntimeVersion,
            crtVersion: crtVersion,
            services: services,
            includeIntegrationTests: includeIntegrationTests,
            includeProtocolTests: includeProtocolTests,
            excludeAWSServices: excludeAWSServices,
            excludeRuntimeTests: excludeRuntimeTests
        ) { _clientRuntimeVersion, _crtVersion, _services in
            let builder = PackageManifestBuilder(
                clientRuntimeVersion: _clientRuntimeVersion,
                crtVersion: _crtVersion,
                services: _services,
                includeProtocolTests: includeProtocolTests,
                includeIntegrationTests: includeIntegrationTests,
                excludeAWSServices: excludeAWSServices,
                excludeRuntimeTests: excludeRuntimeTests
            )
            return try builder.build()
        }
    }
}
