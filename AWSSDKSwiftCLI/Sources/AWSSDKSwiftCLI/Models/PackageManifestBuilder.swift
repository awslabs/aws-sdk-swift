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
    let clientRuntimeVersion: Version
    let crtVersion: Version
    let services: [String]
    let basePackageManifestName = "BasePackageManifest"
    
    // MARK: - Build
    
    /// Builds the contents of the package manifest file.
    func build() throws-> String {
        let contents = try [
            basePackageManifestContents(),
            "",
            buildGeneratedContent()
        ]
        return contents.joined(separator: .newline)
    }

    /// Returns the contents of the base package manifest stored in the bundle at `Resources/BasePackageManifest.swift`
    /// - Returns: The contents of the base package manifest
    private func basePackageManifestContents() throws -> String {
        // Get the url for the base package manifest that is stored in the bundle
        guard let url = Bundle.module.url(forResource: basePackageManifestName, withExtension: "swift") else {
            throw Error("Could not find \(basePackageManifestName).swift in bundle")
        }
        
        // Load the contents of the base package manifest
        let fileContents = try FileManager.loadContents(atPath: url.path)
        
        // Convert the base package manifest data to a string
        guard let fileText = String(data: fileContents, encoding: .utf8) else {
            throw Error("Failed to create string from contents of file \(basePackageManifestName).swift")
        }
        
        return fileText
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
            // Add the generated content that defines the list of services to include
            buildServiceTargets()
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
        lines += services.map { "    \($0.wrappedInQuotes())," }
        lines += ["]"]
        lines += [""]
        lines += ["\(propertyName).forEach(addServiceTarget)"]
        
        return lines.joined(separator: .newline)
    }
}
