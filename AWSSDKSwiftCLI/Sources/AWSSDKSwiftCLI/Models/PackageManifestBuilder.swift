//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import Foundation
import AWSCLIUtils

/// Builds the contents of the package manifest file.
struct PackageManifestBuilder {

    struct Service {
        let moduleName: String
        let codegenName: String
        let dependencies: [String]
        let isInternal: Bool
    }

    let clientRuntimeVersion: Version
    let crtVersion: Version
    let services: [Service]
    let excludeRuntimeTests: Bool
    let previewBuild: Bool
    let prefixContents: () throws -> String
    let basePackageContents: () throws -> String
    
    init(
        clientRuntimeVersion: Version,
        crtVersion: Version,
        services: [Service],
        excludeRuntimeTests: Bool,
        previewBuild: Bool,
        prefixContents: @escaping () throws -> String,
        basePackageContents: @escaping () throws -> String
    ) {
        self.clientRuntimeVersion = clientRuntimeVersion
        self.crtVersion = crtVersion
        self.services = services
        self.excludeRuntimeTests = excludeRuntimeTests
        self.previewBuild = previewBuild
        self.prefixContents = prefixContents
        self.basePackageContents = basePackageContents
    }
    
    init(
        clientRuntimeVersion: Version,
        crtVersion: Version,
        services: [Service],
        excludeRuntimeTests: Bool,
        previewBuild: Bool
    ) {
        self.init(
            clientRuntimeVersion: clientRuntimeVersion,
            crtVersion: crtVersion,
            services: services,
            excludeRuntimeTests: excludeRuntimeTests,
            previewBuild: previewBuild,
            prefixContents: Self.contentReader(filename: "Package.Prefix"),
            basePackageContents: Self.contentReader(filename: "Package.Base")
        )
    }

    static func contentReader(filename: String) -> () throws -> String {
        return {
            // Get the url for the file that is stored in the bundle
            guard let url = Bundle.module.url(forResource: filename, withExtension: "txt") else {
                throw Error("Could not find \(filename).txt in bundle")
            }

            // Load the contents of the base package manifest
            let fileContents = try FileManager.default.loadContents(atPath: url.path)

            // Convert the base package manifest data to a string
            guard let fileText = String(data: fileContents, encoding: .utf8) else {
                throw Error("Failed to create string from contents of file \(filename).txt")
            }

            return fileText
        }
    }

    // MARK: - Build
    
    /// Builds the contents of the package manifest file.
    func build() throws-> String {
        let contents = try [
            prefixContents(),
            buildGeneratedContent(),
            basePackageContents(),
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
            // Remove the runtime tests if needed
            buildRuntimeTests(),
            "",
            // Configure for preview or regular build
            buildPreviewFlag(),
            "",
            // Add the generated content that defines the list of services to include
            buildServiceTargets(),
            "",
        ]
        return contents.joined(separator: .newline)
    }
    
    /// Returns a pragma mark comment to provide separation between the non-generated (base) and generated content
    ///
    /// - Returns: A pragma mark comment to provide separation between the non-generated (base) and generated content
    private func buildPragmaMark() -> String {
        "// MARK: - Dynamic Content"
    }
    
    
    /// Builds the dependencies versions
    private func buildDependencies() -> String {
        """
        let clientRuntimeVersion: Version = \(clientRuntimeVersion.description.wrappedInQuotes())
        let crtVersion: Version = \(crtVersion.description.wrappedInQuotes())
        """
    }

    private func buildRuntimeTests() -> String {
        "let excludeRuntimeUnitTests = \(excludeRuntimeTests)"
    }

    private func buildPreviewFlag() -> String {
        "let isPreviewBuild = \(previewBuild)"
    }

    /// Builds the list of services to include.
    /// This generates an array of strings, where the each item is a name of a service
    /// and calls the `addServiceTarget` for each item.
    private func buildServiceTargets() -> String {
        guard !services.isEmpty else {
            return "private let serviceClientData: [ServiceClientData] = []"
        }
        var lines: [String] = []
        lines += ["private let serviceClientData: [ServiceClientData] = ["]
        lines += services.map { serviceTargetData(service: $0) }
        lines += ["]"]
        return lines.joined(separator: .newline)
    }

    private func serviceTargetData(service: Service) -> String {
        var lines = [String]()
        lines += ["    .init("]
        lines += ["        \(service.moduleName.wrappedInQuotes()),"]
        lines += ["        \(service.codegenName.wrappedInQuotes()),"]
        if service.isInternal {
            lines += ["        \(clientDependencies(service: service)),"]
            lines += ["        .internalUse"]
        } else {
            lines += ["        \(clientDependencies(service: service))"]
        }
        lines += ["    ),"]
        return lines.joined(separator: "\n")
    }

    private func clientDependencies(service: Service) -> String {
        return "[" + service.dependencies.map { ".\($0)" }.joined(separator: ", ") + "]"
    }
}

