//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import Foundation
import AWSCLIUtils

struct FeaturesReader: Decodable {
    private let requestFilePath: String
    private let mappingFilePath: String

    public init(
        requestFilePath: String = "../build-request.json",
        mappingFilePath: String = "../feature-service-id.json"
    ) {
        self.requestFilePath = requestFilePath
        self.mappingFilePath = mappingFilePath
    }

    public func getFeaturesFromFile() throws -> Features {
        let fileContents = try FileManager.default.loadContents(atPath: requestFilePath)
        return try JSONDecoder().decode(Features.self, from: fileContents)
    }

    public func getFeaturesIDToServiceNameDictFromFile() throws -> [String: String] {
        let fileContents = try FileManager.default.loadContents(atPath: mappingFilePath)
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
