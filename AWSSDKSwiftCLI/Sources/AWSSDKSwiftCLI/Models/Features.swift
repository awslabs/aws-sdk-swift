//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import Foundation
import AWSCLIUtils

struct FeaturesReader {
    private let repoPath: String
    private let requestFile = "build-request.json"
    private let mappingFile = "feature-service-id.json"

    public init(
        repoPath: String = "."
    ) {
        self.repoPath = repoPath
    }

    public func getFeaturesFromFile() throws -> Features {
        let path = URL(fileURLWithPath: repoPath).appendingPathComponent(requestFile, isDirectory: false).path
        let fileContents = try FileManager.default.loadContents(atPath: path)
        return try JSONDecoder().decode(Features.self, from: fileContents)
    }

    public func getFeaturesIDToServiceNameDictFromFile() throws -> [String: String] {
        let path = URL(fileURLWithPath: repoPath).appendingPathComponent(mappingFile, isDirectory: false).path
        let fileContents = try FileManager.default.loadContents(atPath: path)
        return try JSONDecoder().decode([String: String].self, from: fileContents)
    }
}

struct Features: Decodable {
    let features: [Feature]
}

struct Feature: Decodable {
    let releaseNotes: String?
    let featureMetadata: FeatureMetadata

    struct FeatureMetadata: Decodable {
        let trebuchet: Trebuchet

        struct Trebuchet: Decodable {
            let featureId: String
            let featureType: String
        }
    }
}
