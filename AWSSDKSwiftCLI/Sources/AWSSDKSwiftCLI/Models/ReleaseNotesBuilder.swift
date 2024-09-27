//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import Foundation
import AWSCLIUtils

// Builds the release notes
struct ReleaseNotesBuilder {
    let previousVersion: Version
    let newVersion: Version
    let repoOrg: PrepareRelease.Org
    let repoType: PrepareRelease.Repo
    let commits: [String]
    
    // MARK: - Build
    
    func build() throws -> String {
        let contents: [String] = (
            ["## What's Changed"] +
            buildSDKChangeSection() +
            (try buildServiceChangeSection()) +
            ["\n**Full Changelog**: https://github.com/\(repoOrg.rawValue)/\(repoType.rawValue)/compare/\(previousVersion)...\(newVersion)"]
        )
        return contents.joined(separator: .newline)
    }

    func buildSDKChangeSection() -> [String] {
        let formattedCommits = commits
            .filter { !$0.hasPrefix("chore") && !$0.hasPrefix("Update") }
            .map { "* \($0)" }
            .joined(separator: .newline)
        if (!formattedCommits.isEmpty) {
            return ["### AWS SDK for Swift", formattedCommits]
        }
        return []
    }

    func buildServiceChangeSection() throws -> [String] {
        var features: Features
        var mapping: [String: String]
        features = try Features.fromFile("build-request.json")
        mapping = try Features.mappingFromFile("feature-service-id.json")
        return buildServiceFeatureSection(features, mapping) + buildServiceDocSection(features, mapping)
    }

    private func buildServiceFeatureSection(
        _ features: Features,
        _ mapping: [String: String]
    ) -> [String] {
        let formattedFeatures = features.features
            .filter { $0.featureType == "NEW_FEATURE" }
            .map { "* **AWS \(mapping[$0.featureId]!)**: \($0.releaseNotes)" }
            .joined(separator: .newline)
        if (!formattedFeatures.isEmpty) {
            return ["### Service Features", formattedFeatures]
        }
        return []
    }

    private func buildServiceDocSection(
        _ features: Features,
        _ mapping: [String: String]
    ) -> [String] {
        let formattedDocUpdates = features.features
            .filter { $0.featureType == "DOC_UPDATE" }
            .map { "* **AWS \(mapping[$0.featureId]!)**: \($0.releaseNotes)" }
            .joined(separator: .newline)
        if (!formattedDocUpdates.isEmpty) {
            return ["### Service Documentation", formattedDocUpdates]
        }
        return []
    }
}
