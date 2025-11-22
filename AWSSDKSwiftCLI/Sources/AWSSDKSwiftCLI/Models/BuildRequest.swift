//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import Foundation
import AWSCLIUtils

/// Reads the Trebuchet request & service mapping files from the parent of the current working directory.
struct BuildRequestReader {
    private static let requestFile = "../build-request.json"
    private static let mappingFile = "../feature-service-id.json"

    public static func buildRequestAndMappingExist() -> Bool {
        return FileManager.default.fileExists(atPath: requestFile) &&
            FileManager.default.fileExists(atPath: mappingFile)
    }

    public func getFeaturesFromFile() throws -> BuildRequest {
        let fileContents = try FileManager.default.loadContents(atPath: Self.requestFile)
        return try JSONDecoder().decode(BuildRequest.self, from: fileContents)
    }

    public func getFeaturesIDToServiceNameDictFromFile() throws -> [String: String] {
        let fileContents = try FileManager.default.loadContents(atPath: Self.mappingFile)
        return try JSONDecoder().decode([String: String].self, from: fileContents)
    }
}

struct BuildRequest: Decodable {
    let buildType: BuildType?
    let features: [Feature]?
}

enum BuildType: Decodable, RawRepresentable, Equatable {
    typealias RawValue = String

    case release
    case preview
    case pullRequest
    case dryRun
    case unknown(String)

    init?(rawValue: String) {
        switch rawValue {
        case "RELEASE":
            self = .release
        case "PREVIEW":
            self = .preview
        case "PULL_REQUEST":
            self = .pullRequest
        case "DRY_RUN":
            self = .dryRun
        default:
            self = .unknown(rawValue)
        }
    }

    init(from decoder: any Decoder) throws {
        let container = try decoder.singleValueContainer()
        let rawValue = try container.decode(String.self)
        // Force-unwrap is safe below because our init?(rawValue:) (just above)
        // never returns nil.
        self.init(rawValue: rawValue)!
    }

    var rawValue: String {
        switch self {
        case .release: 
            return "RELEASE"
        case .preview:
            return "PREVIEW"
        case .pullRequest:
            return "PULL_REQUEST"
        case .dryRun:
            return "DRY_RUN"
        case .unknown(let value):
            return value
        }
    }
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
