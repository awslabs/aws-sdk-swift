//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import Foundation
import PackageDescription

/// Builds the contents of the package manifest file.
struct PackageManifestBuilder {
    struct Service {
        let name: String
        let includeIntegrationTests: Bool
        let includeCustomizations: Bool
    }

    let clientRuntimeVersion: Version
    let crtVersion: Version
    let services: [Service]
    let includeProtocolTests: Bool
    let basePackageContents: () throws -> String
    
    init(
        clientRuntimeVersion: Version,
        crtVersion: Version,
        services: [Service],
        includeProtocolTests: Bool,
        basePackageContents: @escaping () throws -> String
    ) {
        self.clientRuntimeVersion = clientRuntimeVersion
        self.crtVersion = crtVersion
        self.services = services
        self.includeProtocolTests = includeProtocolTests
        self.basePackageContents = basePackageContents
    }
    
    init(
        clientRuntimeVersion: Version,
        crtVersion: Version,
        services: [Service],
        includeProtocolTests: Bool
    ) {
        self.init(clientRuntimeVersion: clientRuntimeVersion, crtVersion: crtVersion, services: services, includeProtocolTests: includeProtocolTests) {
            // Returns the contents of the base package manifest stored in the bundle at `Resources/Package.Base.swift`
            let basePackageName = "Package.Base"
            
            // Get the url for the base package manifest that is stored in the bundle
            guard let url = Bundle.module.url(forResource: basePackageName, withExtension: "swift") else {
                throw Error("Could not find \(basePackageName).swift in bundle")
            }
            
            // Load the contents of the base package manifest
            let fileContents = try FileManager.default.loadContents(atPath: url.path)
            
            // Convert the base package manifest data to a string
            guard let fileText = String(data: fileContents, encoding: .utf8) else {
                throw Error("Failed to create string from contents of file \(basePackageName).swift")
            }
            
            return fileText
        }
    }
    
    // MARK: - Build
    
    /// Builds the contents of the package manifest file.
    func build() throws-> String {
        let contents = try [
            basePackageContents(),
            "",
            buildGeneratedContent()
        ]
        return contents.joined(separator: .newline)
    }
    
    /// Builds all the generated package manifest content
    private func buildGeneratedContent() -> String {
        let contents = [
            // Start with a pragma mark to provide a clear separation between the non-generated (base) and generated content
            buildPragmaMark(),
            "",
            // Add the generated content that defines the dependencies' versions
            buildDependencies(),
            "",
            // Add the generated content that defines the list of services with customizations
            buildServiceCustomizations(),
            "",
            // Add the generated content that defines the list of services to include
            buildServiceTargets(),
            "",
            // Add the generated content that defines the list of services with integration tests to include
            buildIntegrationTestsTargets(),
            "",
            buildProtocolTests(),
        ]
        return contents.joined(separator: .newline)
    }
    
    /// Returns a pragma mark comment to provide separation between the non-generated (base) and generated content
    ///
    /// - Returns: A pragma mark comment to provide separation between the non-generated (base) and generated content
    private func buildPragmaMark() -> String {
        "// MARK: - Generated"
    }
    
    
    /// Builds the dependencies versions
    ///
    ///```swift
    ///addDependencies(
    ///    clientRuntimeVersion: 0.1.0,
    ///    crtVersion: 0.1.0
    ///)
    ///```
    ///
    private func buildDependencies() -> String {
        """
        addDependencies(
            clientRuntimeVersion: \(clientRuntimeVersion.description.wrappedInQuotes()),
            crtVersion: \(crtVersion.description.wrappedInQuotes())
        )
        """
    }

    private func buildServiceCustomizations() -> String {
        let customizedServices = services.filter { $0.includeCustomizations }
        var lines: [String] = []
        lines += ["let serviceTargetsWithCustomizations: [String] = ["]
        lines += customizedServices.map { "    \($0.name.wrappedInQuotes())," }
        lines += ["]"]

        return lines.joined(separator: .newline)
    }

    /// Builds the list of services to include.
    /// This generates an array of strings, where the each item is a name of a service
    /// and calls the `addServiceTarget` for each item.
    ///
    ///```
    ///let serviceTargets: [String] = [
    ///    "Service Name 1",
    ///    "Service Name 2",
    ///    "Service Name 3"
    ///    // etc...
    ///]
    ///serviceTagets.forEach(addServiceTarget)
    ///```
    ///
    private func buildServiceTargets() -> String {
        let propertyName = "serviceTargets"
        
        var lines: [String] = []
        lines += ["let \(propertyName): [String] = ["]
        lines += services.map { "    \($0.name.wrappedInQuotes())," }
        lines += ["]"]
        lines += [""]
        lines += ["\(propertyName).forEach { addServiceTarget(name: $0, customize: serviceTargetsWithCustomizations.contains($0)) }"]

        return lines.joined(separator: .newline)
    }

    /// Builds the list of services to add integration test targets for..
    /// This generates an array of strings, where the each item is a name of a service
    /// and calls the `addIntegrationTestTarget` for each item.
    ///
    ///```
    ///let servicesWithIntegrationTests: [String] = [
    ///    "Service Name 1",
    ///    "Service Name 2",
    ///    "Service Name 3"
    ///    // etc...
    ///]
    ///serviceTagets.forEach(addIntegrationTestTarget)
    ///```
    ///
    private func buildIntegrationTestsTargets() -> String {
        let propertyName = "servicesWithIntegrationTests"

        var lines: [String] = []
        lines += ["let \(propertyName): [String] = ["]
        lines += services.filter(\.includeIntegrationTests).map { "    \($0.name.wrappedInQuotes())," }
        lines += ["]"]
        lines += [""]
        lines += ["\(propertyName).forEach(addIntegrationTestTarget)"]

        return lines.joined(separator: .newline)
    }

    /// Calls the method to include protocol tests in the manifest.
    ///
    ///```
    ///// Uncomment this line to enable protocol tests
    ///addProtocolTests()
    ///```
    private func buildProtocolTests() -> String {
        return [
            "// Uncomment this line to enable protocol tests",
            (includeProtocolTests ? "" : "// ") + "addProtocolTests()"

        ].joined(separator: .newline)
    }
}
