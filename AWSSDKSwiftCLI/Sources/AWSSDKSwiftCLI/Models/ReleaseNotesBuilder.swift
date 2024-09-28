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
    var isTest: Bool = false
    
    // MARK: - Build
    
    func build() throws -> String {
        let baseContent: [String] = (
            ["## What's Changed"] +
            buildSDKChangeSection()
        )
        let serviceClientChanges = repoType == .awsSdkSwift ? (try buildServiceChangeSection()) : []
        let fullCommitLogLink = [
            "\n**Full Changelog**: https://github.com/\(repoOrg.rawValue)/\(repoType.rawValue)/compare/\(previousVersion)...\(newVersion)"
        ]
        let contents = baseContent + serviceClientChanges + fullCommitLogLink
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
        // At this point, FileManager.default's current working directory is aws-sdk-swift/.
        // The JSON files we need are located one level above it, in the workspace directory.
        // For tests, due to sandboxing, the dummy files are created in current directory instead of
        //  in parent directory. Therefore, fetch them from current directory for tests.
        let buildRequestLocation = isTest ? "build-request.json" : "../build-request.json"
        let mappingLocation = isTest ? "feature-service-id.json" : "../feature-service-id.json"
        features = try Features.fromFile(buildRequestLocation)
        mapping = try Features.mappingFromFile(mappingLocation)
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
