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
    
    func config() throws -> FileBasedConfigurationSectionProviding? {
    
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
        
        let arrayConfigData = stringConfigData.split(whereSeparator: \.isNewline)
        
        var currentSection: ConfigFileSection?
        var sections: [String: ConfigFileSection] = [:]
        var currentSubsectionName: String? // Keep track of current subsection name
        let profileSection = try! NSRegularExpression(pattern: "\\[(?:default|profile\\s(.+?))\\]", options: .caseInsensitive) // Regex pattern to match any line containing "profile" or "default"
        let sessionSection = try! NSRegularExpression(pattern: "\\[sso-session\\s(.+?)\\]", options: .caseInsensitive) // Regex pattern for "sso-session"
        let servicesSection = try! NSRegularExpression(pattern: "\\[services\\s(.+?)\\]", options: .caseInsensitive) // Regex pattern for "services"
        
        for line in arrayConfigData{
            if line.isEmpty || line.hasPrefix("#") || line.hasPrefix(";") {
                continue
            } else if line.contains("profile"){
                guard line.hasPrefix("[") && line.hasSuffix("]") else{
                        throw ParsingError.incompleteProfile(line: String(line))
                }
            }
            switch line{
            case _ where profileSection.firstMatch(in: String(line), options: [], range: NSRange(line.startIndex..., in: line)) != nil:
                // Extract the profile name using another regex or string manipulation
                if let range = line.range(of: "\\[profile\\s(.+?)\\]", options: .regularExpression),
                   let NameRange = line.range(of: "\\s(.+?)\\]", options: .regularExpression, range: range.lowerBound..<range.upperBound) {
                    let sectionName = String(line[NameRange].dropFirst().dropLast().trimmingCharacters(in: .whitespaces)) // Remove space and ']'
                    let section = ConfigFileSection(name: sectionName)
                    sections[sectionName] = section
                    currentSection = section
                    print("Found new profile: \(sectionName)") // For demonstration
                } else if line.contains("[default]"){
                    let sectionName = "default"
                    let section = ConfigFileSection(name: sectionName)
                    sections[sectionName] = section
                    currentSection = section
                    print("A user profile was not configured, the \(sectionName) will be used")
                }
            case _ where sessionSection.firstMatch(in: String(line), options: [], range: NSRange(line.startIndex..., in: line)) != nil:
                if let range = line.range(of: "\\[sso-session\\s(.+?)\\]", options: .regularExpression),
                   let NameRange = line.range(of: "\\s(.+?)\\]", options: .regularExpression, range: range.lowerBound..<range.upperBound) {
                    let sectionName = String(line[NameRange].dropFirst().dropLast().trimmingCharacters(in: .whitespaces))
                    let section = ConfigFileSection(name: sectionName)
                    sections[sectionName] = section
                    currentSection = section
                    print("Found new session: \(sectionName)")
                }
            case _ where servicesSection.firstMatch(in: String(line), options: [], range: NSRange(line.startIndex..., in: line)) != nil:
                if let range = line.range(of: "\\[services\\s(.+?)\\]", options: .regularExpression),
                   let NameRange = line.range(of: "\\s(.+?)\\]", options: .regularExpression, range: range.lowerBound..<range.upperBound) {
                    let sectionName = String(line[NameRange].dropFirst().dropLast().trimmingCharacters(in: .whitespaces))
                    let section = ConfigFileSection(name: sectionName)
                    sections[sectionName] = section
                    currentSection = section
                    print("Found new service: \(sectionName)")
                }
            case _ where line.contains("="):
                if currentSection != nil {
                    //Identify properties under section
                    let sectionHeader = currentSection?.name
                    let components = line.split(separator: "=", maxSplits: 1).map(String.init)
                    if components.count == 1{
                        guard !line.hasPrefix(" ") else {
                            throw "Property did not have a name"
                        }
                        let subSectionName = String(components[0].trimmingCharacters(in: .whitespaces))
                        let subSection = ConfigFileSection(name: subSectionName)
                        sections[subSectionName] = subSection
                        currentSubsectionName = subSectionName
                        print("Found new subsection: \(subSection.name), added under section: \(String(describing: currentSection?.name))")
                    } else if components.count == 2{
                        // This handles properties key-value pairs within a section
                        let key = components[0].trimmingCharacters(in: .whitespaces).lowercased()
                        let value = components[1].trimmingCharacters(in: .whitespaces)
                        if !line.hasPrefix(" ") && !line.hasPrefix("\t"){
                            // key-value pair aren't indented
                            currentSubsectionName = nil  // subsection has ended if there's no indent
                            currentSection?.properties[key] = value
                            sections[currentSection!.name] = currentSection
                            print("  Added key and value '\(key)' = '\(value)' to section '\(String(describing: sectionHeader))'")
                            print("  The current section contains '\(String(describing: currentSection))'")
                        } else{
                            // key-value pair are indented
                            var subproperties = currentSection?.subproperties
                            var subpropertyKeysAndValues = subproperties?[currentSubsectionName!] ?? [String: String]()
                            subpropertyKeysAndValues[key] = value
                            subproperties?[currentSubsectionName!] = subpropertyKeysAndValues
                            currentSection?.subproperties = subproperties!
                            sections[currentSection!.name] = currentSection
                            print("  Added sub-property key and value '\(key)' = '\(value)' to subsection '\(String(describing: currentSubsectionName))' Current section: \(String(describing: currentSection?.name))")
                            print("  The current section contains '\(String(describing: currentSection))'")
                        }
                    }
                } else{
                    throw "Expected a section definition"
                }
            case _ where !line.contains("="):
//                guard line.contains("profile") || line.contains("default") else {
//                    throw "Expected a section definition"
//                }
                guard let currentKeyPropertyName = currentSection?.properties.keys.first else {
                    throw "Property key did not have a name"
                }
                let components = String(line)
                let value = components.trimmingCharacters(in: .whitespaces)
//                let updatedKey = currentSection.properties.updateValue(value, forKey: currentKeyPropertyName)!
                if currentSection?.properties[currentKeyPropertyName] != nil {
                    currentSection?.properties[currentKeyPropertyName]?.append("\n" + value)
                } else {
                    currentSection?.properties[currentKeyPropertyName] = value
                }
                print("  Added new value '\(value)' to key '\(String(describing: currentKeyPropertyName))' within section '\(String(describing: currentSection?.name))'")
                print("  The current section contains '\(String(describing: currentSection))")
                break
            default:
                print("Unrecognized line: \"\(line)\"")
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
