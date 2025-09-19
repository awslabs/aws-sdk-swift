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
        
        var currentSection: ConfigFileSection = ConfigFileSection(name: "default")
        var sections = ["default": currentSection]
        var currentSubsectionName: String? // Keep track of current subsection name
        let profileSection = try! NSRegularExpression(pattern: "\\[(?:default|profile\\s(.+?))\\]", options: .caseInsensitive) // Regex pattern to match any line containing "profile"
        
        for line in arrayConfigData{
            switch line{
                // Use a 'where' clause with regex matching
            case _ where profileSection.firstMatch(in: String(line), options: [], range: NSRange(line.startIndex..., in: line)) != nil:
                // Extract the profile name using another regex or string manipulation
                if let range = line.range(of: "\\[profile\\s(.+?)\\]", options: .regularExpression),
                   let profileNameRange = line.range(of: "\\s(.+?)\\]", options: .regularExpression, range: range.lowerBound..<range.upperBound) {
                    let sectionName = String(line[profileNameRange].dropFirst().dropLast()) // Remove space and ']'
                    let section = ConfigFileSection(name: sectionName)
                    sections[sectionName] = section
                    currentSection = section
                    print("Found new profile: \(sectionName)") // For demonstration
                } else{
                    let sectionName = "default"
                    let section = ConfigFileSection(name: sectionName)
                    sections[sectionName] = section
                    currentSection = section
                }
            case _ where line.contains("="):
                //Identify properties under section
                let sectionHeader = currentSection
                let components = line.split(separator: "=", maxSplits: 1).map(String.init)
                if components.count == 1{
                    let subSectionName = String(components[0].trimmingCharacters(in: .whitespaces))
                    let subSection = ConfigFileSection(name: subSectionName)
                    sections[subSectionName] = subSection
                    currentSubsectionName = subSectionName
                    print("Found new subsection: \(subSection.name), added under section: \(currentSection.name)") // For demonstration
                } else if components.count == 2{
                    // This handles properties key-value pairs within a section
                    let key = components[0].trimmingCharacters(in: .whitespaces)
                    let value = components[1].trimmingCharacters(in: .whitespaces)
                    if !line.hasPrefix(" ") && !line.hasPrefix("\t"){
                        // key-value pair aren't indented
                        currentSubsectionName = nil  // subsection has ended if there's no indent
                        currentSection.properties[key] = value
                        sections[currentSection.name] = currentSection
                        print("  Added key and value '\(key)' = '\(value)' to section '\(String(describing: sectionHeader))'")
                    } else {
                        // key-value pair are indented
                        var subproperties = currentSection.subproperties
                        var subpropertyKeysAndValues = subproperties[currentSubsectionName!] ?? [String: String]()
                        subpropertyKeysAndValues[key] = value
                        subproperties[currentSubsectionName!] = subpropertyKeysAndValues
                        currentSection.subproperties = subproperties
                        sections[currentSection.name] = currentSection
                        print("  Added sub-property key and value '\(key)' = '\(value)' to subsection '\(String(describing: currentSubsectionName))' Current section: \(String(describing: currentSection))")
                    }
                }
            default:
                print("No profile found, values will be placed in [default] section")
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
    var subproperties: [String: [String: String]] = [:]
    var properties: [String: String] = [:]
    
    func property(for name: FileBasedConfigurationKey) -> FileBasedConfigurationProperty? {
        if let value = properties[name.rawValue]{
            return .string(value)
        } else if let subproperties = subproperties[name.rawValue] {
            return .subsection(Subsection(subproperties: subproperties))
        }
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

struct Subsection: FileBasedConfigurationSubsection {
    let subproperties: [String: String]

    func value(for name: AWSSDKCommon.FileBasedConfigurationKey) -> String? {
        subproperties[name.rawValue]
    }
}
