//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import Foundation

struct ExampleMeta: Codable {
    let services: [String: Service]
    let examples: [String: Example]

    private var serviceNamesBySdkId: [String: String] {
        var result: [String: String] = [:]
        for (name, service) in services {
            if !service.sdkId.isEmpty && !name.isEmpty {
                result[service.sdkId] = name
            }
        }
        return result
    }

    func sdkId(serviceName: String) throws -> String {
        guard let sdkId = services[serviceName]?.sdkId else {
            throw ExampleMetaError.unknownServiceName(serviceName)
        }
        return sdkId
    }

    func serviceName(sdkId: String) throws -> String {
        guard let serviceName = serviceNamesBySdkId[sdkId] else {
            throw ExampleMetaError.unknownSdkId(sdkId)
        }
        return serviceName
    }
}

struct Service: Codable {
    let sdkId: String
}

struct Example: Codable {
    let id: String
    let title: String
    let languages: [String: Language]
    let category: String?
    let services: [String: ExampleService]
    let docFilenames: DocFilenames

    var isSwiftSpecific: Bool {
        languages.values.contains { $0.name == "Swift" }
    }
}

struct Language: Codable {
    let name: String
    let versions: [LanguageVersion]
}

struct LanguageVersion: Codable {
    let sdkVersion: Int
}

struct ExampleService: Codable {
    let operations: [String]

    enum CodingKeys: String, CodingKey {
        case operations = "__set__"
    }
}

struct DocFilenames: Codable {
    let servicePages: [String: String]
}

enum ExampleMetaError: Swift.Error {
    case unknownServiceName(String)
    case unknownSdkId(String)
}