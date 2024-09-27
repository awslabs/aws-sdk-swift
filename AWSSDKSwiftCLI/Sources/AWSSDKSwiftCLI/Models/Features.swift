//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import Foundation
import AWSCLIUtils

struct Features: Decodable {
    let features: [Feature]

    static func fromFile(_ filePath: String) throws -> Self {
        var fileContents: Data
        do {
            fileContents = try FileManager.default.loadContents(atPath: filePath)
        } catch {
            throw Error("Failed to load build-request.json.")
        }
        do {
            return try JSONDecoder().decode(Self.self, from: fileContents)
        } catch {
            throw Error("Failed to decode build-request.json.")
        }
    }

    static func mappingFromFile(_ filePath: String) throws -> [String: String] {
        var fileContents: Data
        do {
            fileContents = try FileManager.default.loadContents(atPath: filePath)
        } catch {
            throw Error("Failed to load feature-service-id.json.")
        }
        do {
            return try JSONDecoder().decode([String: String].self, from: fileContents)
        } catch {
            throw Error("Failed to decode feature-service-id.json.")
        }
    }
}

struct Feature: Decodable {
    let featureId: String
    let featureType: String
    let releaseNotes: String

    // Custom coding keys for decoding nested values into top level fields in Feature struct
    private enum CodingKeys: String, CodingKey {
        case releaseNotes
        case featureMetadata

        enum FeatureMetadataKeys: String, CodingKey {
            case trebuchet

            enum TrebuchetKeys: String, CodingKey {
                case featureId, featureType
            }
        }
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        releaseNotes = try container.decode(String.self, forKey: .releaseNotes)

        let featureMetadata = try container.nestedContainer(keyedBy: CodingKeys.FeatureMetadataKeys.self, forKey: .featureMetadata)
        let trebuchet = try featureMetadata.nestedContainer(keyedBy: CodingKeys.FeatureMetadataKeys.TrebuchetKeys.self, forKey: .trebuchet)

        featureId = try trebuchet.decode(String.self, forKey: .featureId)
        featureType = try trebuchet.decode(String.self, forKey: .featureType)
    }
}
