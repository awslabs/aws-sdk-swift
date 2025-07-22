//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//
import Foundation
@_spi(FileBasedConfig) import AWSSDKCommon

public struct ConfigFileReader {
    public let configFilePath: String
    public let credentialsFilePath: String
    
    public init?(_ configFilePath: String?, _ credentialsFilePath: String?) async throws {
        
        // You will likely have to modify this code.
        self.configFilePath = configFilePath ?? "~/.aws/config"
        self.credentialsFilePath = credentialsFilePath ?? "~/.aws/credentials"
    }
    
    func config() -> FileBasedConfigurationSectionProviding? {
        // Replace this function body with code that works.
        guard let storedConfigData = FileManager.default.contents(atPath: configFilePath) else {
            print("Could not open File")
            return nil
            }
        guard let stringConfigData = String(data: storedConfigData, encoding: .utf8) else {
            print ("Could not decode file")
            return nil
        }
        
        print("Successfully read configuration file at: \(configFilePath)")
        print("File contents:", stringConfigData.split(separator: "\n"))
        
        let arrayConfigData = stringConfigData.split(separator: "\n")
        
        enum Sections{
            case con(String.SubSequence)
            case cred(String.SubSequence)
        }
        
        var sections = [String: ConfigFileSection]()
        for line in arrayConfigData{
            switch line{
            case "[default]":
                let section = ConfigFileSection(name: "default")
                sections["default"] = section
            default:
                break
            }
        }
        return ConfigFile(sections: sections)
    }
}

@_spi(FileBasedConfig)
public extension ConfigFileReader {

    static func makeAsync(configFilePath: String?, credentialsFilePath: String?) async throws -> FileBasedConfiguration? {
        try await ConfigFileReader(configFilePath, credentialsFilePath)?.config()
    }
}

struct ConfigFile: FileBasedConfiguration {
    let sections: [String: ConfigFileSection]

    func section(for name: String, type: FileBasedConfigurationSectionType) -> (any FileBasedConfigurationSection)? {
        // Replace this function body with code that works.
        let sectionName: String
        switch type {
        case .profile:
            sectionName = name
        default:
            sectionName = name
        }
        return sections[sectionName]
    }
}

struct ConfigFileSection: FileBasedConfigurationSection {
    let name: String
    let keys: [String: String] = [:]
    
    func property(for name: FileBasedConfigurationKey) -> FileBasedConfigurationProperty? {
        // Replace this function body with code that works.
        return nil
    }
}
struct Config: FileBasedConfigurationSectionProviding {
    func section(for name: String, type: AWSSDKCommon.FileBasedConfigurationSectionType) -> (any AWSSDKCommon.FileBasedConfigurationSection)? {
        return nil
    }
}
extension String: @retroactive Error {
    var description: String { self }
}
