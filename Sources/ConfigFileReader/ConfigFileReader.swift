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
    
        self.configFilePath = configFilePath ?? "~/.aws/config"
        self.credentialsFilePath = credentialsFilePath ?? "~/.aws/credentials"
    }
    
    func config() -> FileBasedConfigurationSectionProviding? {
    
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
        
        var sections = [String: ConfigFileSection]()
        var currentSectionName: String? // Keep track of current section name
        var currentPropertyName: String? // Keep track of current subsection name
        let profileSection = try! NSRegularExpression(pattern: "profile", options: .caseInsensitive) // Regex pattern to match any line containing "profile"
        
        for line in arrayConfigData{
            switch line{
            case "[default]":
                let profileName = "default"
                currentSectionName = profileName
                let section = ConfigFileSection(name: "default")
                sections[profileName] = section
                // Use a 'where' clause with regex matching
            case _ where profileSection.firstMatch(in: String(line), options: [], range: NSRange(line.startIndex..., in: line)) != nil:
                // Extract the profile name using another regex or string manipulation
                if let range = line.range(of: "\\[profile\\s(.+?)\\]", options: .regularExpression),
                   let profileNameRange = line.range(of: "\\s(.+?)\\]", options: .regularExpression, range: range.lowerBound..<range.upperBound) {
                    let profileName = String(line[profileNameRange].dropFirst().dropLast()) // Remove space and ']'
                    currentSectionName = profileName
                    let section = ConfigFileSection(name: "profile")
                    sections[profileName] = section
                    print("Found new profile: \(profileName)") // For demonstration
                }
            case _ where currentSectionName != nil && line.contains("="):
                //Identify new Property
                if line.contains("nested"){
                    let PropertyName = String(line)
                    currentPropertyName = PropertyName
                    let section = ConfigFileSection(name: "undefined-property")
                    sections[PropertyName] = section
                    print("Found new Property: \(String(describing: currentPropertyName))") // For demonstration
                }
                
                // This case handles key-value pairs within a section
                if !line.hasPrefix(" ") && !line.hasPrefix("\t"){
                    let components = line.split(separator: "=", maxSplits: 1).map(String.init)
                    if components.count == 2, let currentName = currentSectionName {
                        let key = components[0].trimmingCharacters(in: .whitespaces)
                        let value = components[1].trimmingCharacters(in: .whitespaces)
                        sections[currentName]?.keys[key] = value
                        print("  Added key and value '\(key)' = '\(value)' to section '\(currentName)'")
                    }
                } else {
                    let components = line.split(separator: "=", maxSplits: 1).map(String.init)
                    if components.count == 2, let currentName = currentPropertyName {
                        let key = components[0].trimmingCharacters(in: .whitespaces)
                        let value = components[1].trimmingCharacters(in: .whitespaces)
                        sections[currentName]?.keys[key] = value
                        print("  Added sub-property key and value '\(key)' = '\(value)' to property '\(currentName)'")
                    }
                }
            default:
                print ("No profile found, values will be placed in [default] section")
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
    var keys: [String: String] = ["":""]
    var properties: [String: String] = [:]
    
    func property(for name: FileBasedConfigurationKey) -> FileBasedConfigurationProperty? {
        if let value = keys[name.rawValue]{
            return .string(value)
        }else {
            return nil
        }
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
