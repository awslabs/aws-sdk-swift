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
    let buildRequest: BuildRequest
    let featuresIDToServiceName: [String: String]

    // MARK: - Build

    func build() throws -> String {
        let sdkChanges: [String] = buildSDKChangeSection()
        let serviceClientChanges = repoType == .awsSdkSwift ? (try buildServiceChangeSection()) : []
        let fullCommitLogLink = [
            "\n**Full Changelog**: https://github.com/\(repoOrg.rawValue)/\(repoType.rawValue)/compare/\(previousVersion)...\(newVersion)"
        ]
        let contents = ["## What's Changed"] + serviceClientChanges + sdkChanges + fullCommitLogLink
        return contents.joined(separator: .newline)
    }

    func buildSDKChangeSection() -> [String] {
        let formattedCommits = commits
            .filter { $0.hasPrefix("feat") || $0.hasPrefix("fix") }
            .map { "* \($0)" }
            .joined(separator: .newline)
        if (!formattedCommits.isEmpty) {
            return ["### Miscellaneous", formattedCommits]
        }
        return []
    }

    func buildServiceChangeSection() throws -> [String] {
        return buildServiceFeatureSection(buildRequest, featuresIDToServiceName) + buildServiceDocSection(buildRequest, featuresIDToServiceName)
    }

    private func buildServiceFeatureSection(
        _ buildRequest: BuildRequest,
        _ mapping: [String: String]
    ) -> [String] {
        let formattedFeatures = (buildRequest.features ?? [])
            .filter { $0.featureMetadata.trebuchet.featureType == "NEW_FEATURE" }
            .map { "* **AWS \(mapping[$0.featureMetadata.trebuchet.featureId]!)**: \($0.releaseNotes ?? "No description provided.")" }
            .joined(separator: .newline)
        if (!formattedFeatures.isEmpty) {
            return ["### Service Features", formattedFeatures]
        }
        return []
    }

    private func buildServiceDocSection(
        _ buildRequest: BuildRequest,
        _ mapping: [String: String]
    ) -> [String] {
        let formattedDocUpdates = (buildRequest.features ?? [])
            .filter { $0.featureMetadata.trebuchet.featureType == "DOC_UPDATE" }
            .map { "* **AWS \(mapping[$0.featureMetadata.trebuchet.featureId]!)**: \($0.releaseNotes ?? "No description provided.")" }
            .joined(separator: .newline)
        if (!formattedDocUpdates.isEmpty) {
            return ["### Service Documentation", formattedDocUpdates]
        }
        return []
    }
}
