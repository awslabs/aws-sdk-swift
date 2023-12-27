//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import Foundation
import PackageDescription

/// Builds the contents of the package manifest file.
struct DocIndexBuilder {
    struct Service {
        let name: String
    }

    let services: [String]
    let baseDocIndexContents: () throws -> String

    init(services: [String]) {
        self.services = services
        self.baseDocIndexContents = {
            // Returns the contents of the base doc index stored in the bundle at `Resources/DocIndex.Base.md`
            let basePackageName = "DocIndex.Base"

            // Get the url for the base doc index that is stored in the bundle
            guard let url = Bundle.module.url(forResource: basePackageName, withExtension: "md") else {
                throw Error("Could not find \(basePackageName).md in bundle")
            }

            // Load the contents of the base doc index
            let fileContents = try FileManager.default.loadContents(atPath: url.path)

            // Convert the base doc index data to a string
            guard let fileText = String(data: fileContents, encoding: .utf8) else {
                throw Error("Failed to create string from contents of file \(basePackageName).swift")
            }

            return fileText
        }
    }

    // MARK: - Build

    /// Builds the contents of the package manifest file.
    func build() throws -> String {
        let contents = try [
            baseDocIndexContents(),
            "",
            buildGeneratedContent()
        ]
        return contents.joined(separator: "\n")
    }

    /// Builds all the generated package manifest content
    private func buildGeneratedContent() -> String {
        let contents = [
            buildServiceIndex(),
            ""
        ]
        return contents.joined(separator: .newline)
    }

    /// Returns a pragma mark comment to provide separation between the non-generated (base) and generated content
    ///
    /// - Returns: A pragma mark comment to provide separation between the non-generated (base) and generated content
    private func buildServiceIndex() -> String {
        return services.map { service in
            let urlService = service.lowercased(with: Locale(identifier: "en_US_POSIX"))
            return "[\(service)](../../../../../swift/api/\(urlService)/latest)\n"
            }.joined(separator: "\n")
    }
}
