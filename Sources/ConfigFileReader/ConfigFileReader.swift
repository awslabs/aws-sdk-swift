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
    
    func readAndDecodeFile(atPath path: String, fileDescription: String) -> String? {
        // 1. Check if the path is empty
        guard !path.isEmpty else {
            print("\(fileDescription) file path is empty.")
            return nil
        }
        
        // 2. Read the file contents
        guard let storedData = FileManager.default.contents(atPath: path) else {
            print("Could not open \(fileDescription) file at: \(path)")
            return nil
        }
        
        // 3. Decode the data into a String
        guard let decodedString = String(data: storedData, encoding: .utf8) else {
            print("Could not decode \(fileDescription) file.")
            return nil
        }
        
        print("Successfully read \(fileDescription) file at: \(path)")
        return decodedString
    }
    
    func config() throws -> FileBasedConfigurationSectionProviding? {
        
        // Use the helper function for the config file (which is mandatory)
        guard let stringConfigData = readAndDecodeFile(atPath: configFilePath, fileDescription: "Configuration") else {
            return nil // Stop if the main config file fails
        }

        // Use the helper function for the credentials file (handle it optionally, if it fails, stringCredentialsData is nil)
        let stringCredentialsData = readAndDecodeFile(atPath: credentialsFilePath, fileDescription: "Credentials")
        
        print("Successfully read configuration file at: \(configFilePath)")
        print("Successfully read credentials file at: \(credentialsFilePath)")
        
        print("Configuration File contents:", stringConfigData.split(whereSeparator: \.isNewline))
        print("Credential File contents:", stringCredentialsData?.split(whereSeparator: \.isNewline) as Any)
        
        let arrayData: [Substring]
        if stringCredentialsData == nil {
           arrayData = stringConfigData.split(whereSeparator: \.isNewline)
        } else {
           arrayData = stringConfigData.split(whereSeparator: \.isNewline) + stringCredentialsData!.split(whereSeparator: \.isNewline)
        }
        
        var currentLineNumber: Int = 0
        var currentSection: ConfigFileSection?
        var sections: [String: ConfigFileSection] = [:]
        var currentProperty: String?
        var currentSubProperty: String?
        let profileSection = try! NSRegularExpression(pattern: "\\[\\s*(?:default|profile\\s+(.+?))\\s*\\]", options: .caseInsensitive) // Regex pattern to match any line containing "profile" or "default"
        let sessionSection = try! NSRegularExpression(pattern: "\\[\\s*sso-session\\s+(.+?)\\s*\\]", options: .caseInsensitive) // Regex pattern for "sso-session"
        let servicesSection = try! NSRegularExpression(pattern: "\\[\\s*services\\s+(.+?)\\s*\\]", options: .caseInsensitive) // Regex pattern for "services"
        
        for line in arrayData{
            currentLineNumber += 1
            let blankLine = " "
            if line.isEmpty || line.hasPrefix("#") || line.hasPrefix(";") || line == blankLine{
                continue
            }
            switch line{
            case _ where profileSection.firstMatch(in: String(line), options: [], range: NSRange(line.startIndex..., in: line)) != nil:
                // Extract the profile name using another regex or string manipulation
                if let range = line.range(of: "\\[\\s*(?:default|profile\\s+(.+?))\\s*\\]", options: .regularExpression),
                   let NameRange = line.range(of: "\\s+(.+?)\\s*\\]", options: .regularExpression, range: range.lowerBound..<range.upperBound) {
                    var sectionName = ""
                    let profileName = String(line[NameRange].dropFirst().dropLast().trimmingCharacters(in: .whitespaces)) // Remove space and ']'
                    if let range = profileName.range(of: "profile "){
                        sectionName = String(profileName[range.upperBound...])
                    } else{
                        sectionName = profileName
                    }
                    if sectionName != currentSection?.name {
                        let section = ConfigFileSection(name: sectionName)
                        sections[sectionName] = section
                        currentSection = section
                        print("Found new profile named: '\(sectionName)' on line number: '\(currentLineNumber)'") // For demonstration
                    } else {
                        print("Found dulpicate section matching current profile on line number: '\(currentLineNumber)' current profile will remain unchanged: '\(sectionName)' ")
                        currentProperty = nil
                        currentSubProperty = nil
                        continue
                    }
                } else if line.contains("[default]"){
                    let sectionName = "default"
                    if sectionName != currentSection?.name {
                        let section = ConfigFileSection(name: sectionName)
                        sections[sectionName] = section
                        currentSection = section
                        print("A user profile was not configured, the \(sectionName) will be used")
                    } else {
                        print("Found dulpicate section matching current profile on line number: '\(currentLineNumber)' current profile will remain unchanged: '\(sectionName)' ")
                        currentProperty = nil
                        currentSubProperty = nil
                        continue
                }
            }
            case _ where sessionSection.firstMatch(in: String(line), options: [], range: NSRange(line.startIndex..., in: line)) != nil:
                if let range = line.range(of: "\\[\\s*sso-session\\s+(.+?)\\s*\\]", options: .regularExpression),
                   let NameRange = line.range(of: "\\s+(.+?)\\s*\\]", options: .regularExpression, range: range.lowerBound..<range.upperBound) {
                    var sectionName = ""
                    let sessionName = String(line[NameRange].dropFirst().dropLast().trimmingCharacters(in: .whitespaces))
                    if let range = sessionName.range(of: "sso-session "){
                        sectionName = String(sessionName[range.upperBound...])
                    } else{
                        sectionName = sessionName
                    }
                    if sectionName != currentSection?.name {
                        let section = ConfigFileSection(name: sectionName)
                        sections[sectionName] = section
                        currentSection = section
                        print("Found new session named: '\(sectionName)' on line number: '\(currentLineNumber)'")
                    } else {
                        print("Found dulpicate section matching current session on line number: '\(currentLineNumber)' current session will remain unchanged: '\(sectionName)' ")
                        currentProperty = nil
                        currentSubProperty = nil
                        continue
                    }
                }
            case _ where servicesSection.firstMatch(in: String(line), options: [], range: NSRange(line.startIndex..., in: line)) != nil:
                if let range = line.range(of: "\\[\\s*services\\s+(.+?)\\s*\\]", options: .regularExpression),
                   let NameRange = line.range(of: "\\s+(.+?)\\s*\\]", options: .regularExpression, range: range.lowerBound..<range.upperBound) {
                    var sectionName = ""
                    let serviceName = String(line[NameRange].dropFirst().dropLast().trimmingCharacters(in: .whitespaces))
                    if let range = serviceName.range(of: "services "){
                        sectionName = String(serviceName[range.upperBound...])
                    } else{
                        sectionName = serviceName
                    }
                    if sectionName != currentSection?.name {
                        let section = ConfigFileSection(name: sectionName)
                        sections[sectionName] = section
                        currentSection = section
                        print("Found new service named: '\(sectionName)' on line number: '\(currentLineNumber)'")
                    } else {
                        print("Found dulpicate section matching current service on line number: '\(currentLineNumber)' current service will remain unchanged: '\(sectionName)' ")
                        currentProperty = nil
                        currentSubProperty = nil
                        continue
                    }
                }
            case _ where line.contains("="):
                do {
                if currentSection != nil {
                    //Identify properties under section
                    let sectionHeader = currentSection?.name
                    var subproperties = currentSection?.subproperties ?? [String: [String: String]]()
                    let components = line.split(separator: "=", maxSplits: 1).map(String.init)
                    if components.count == 1{
                        let commentPattern = " +[#;]"
                        var propertyName: String!
                        let key = components[0]
                        if !line.hasPrefix(" ") && !line.hasPrefix("\t"){
                            propertyName = String(key.trimmingCharacters(in: .whitespaces))
                            // Check for and remove the first comment character found
                            if let commentRange = propertyName.range(of:commentPattern, options: .regularExpression) {
                                propertyName = String(propertyName[..<commentRange.lowerBound].trimmingCharacters(in: .whitespaces))
                            }
                            currentProperty = propertyName
                            currentSection?.properties[propertyName] = ""
                            sections[currentSection!.name] = currentSection
                            print("Found new property key with no value: '\(currentProperty!)' on line number: '\(currentLineNumber)', added to section: '\(currentSection!.name)'")
                        } else if line.hasPrefix(" ") || line.hasPrefix("\t") {
                            let subKey = key
                            propertyName = String(subKey.trimmingCharacters(in: .whitespaces))
                            // Check for and remove the first comment character found
                            if let commentRange = propertyName.range(of:commentPattern, options: .regularExpression) {
                                propertyName = String(propertyName[..<commentRange.lowerBound].trimmingCharacters(in: .whitespaces))
                            }
                            currentSubProperty = propertyName //Start of a property
                            var subprops = currentSection?.subproperties ?? [String: [String: String]]()
                            var subKeyValues = subprops[currentProperty!] ?? [String: String]()
                            subKeyValues[propertyName] = "" // Add the blank value
                            subprops[currentProperty!] = subKeyValues
                            currentSection?.subproperties = subprops
                            sections[currentSection!.name] = currentSection
                            print("Found new sub-property key with no value: '\(currentSubProperty!)' on line number: '\(currentLineNumber)', added to section: '\(currentSection!.name)'")
                        } else {
                            throw MyError("Property did not have a name")
                        }
                        print("  The current section contains '\(currentSection!)'")
                    } else if components.count == 2{
                        // This handles properties key-value pairs within a section
                        let key = components[0].trimmingCharacters(in: .whitespaces).lowercased()
                        var value = components[1].trimmingCharacters(in: .whitespaces)
                        let commentPattern = " +[#;]"
                        if !line.hasPrefix(" ") && !line.hasPrefix("\t"){
                            if let commentRange = value.range(of:commentPattern, options: .regularExpression) {
                                value = String(value[..<commentRange.lowerBound].trimmingCharacters(in: .whitespaces))
                            }
                            // key-value pair aren't indented
                            currentProperty = key
                            currentSection?.properties[key] = value
                            sections[currentSection!.name] = currentSection
                            print("  Added new property key and value '\(key)' = '\(value)' to section '\(sectionHeader!)'")
                            print("  The current section contains '\(currentSection!)'")
                        } else{
                            // key-value pair are indented
                            guard let currentSectionName = currentSection?.name,
                                  let currentPropertyName = currentProperty,
                                  !currentPropertyName.isEmpty else {
                                throw MyError("Property did not have a name in sub-property")
                            }
                            
                            var subpropertyKeysAndValues = subproperties[currentPropertyName] ?? [String: String]()
                            subpropertyKeysAndValues[key] = value
                            subproperties[currentPropertyName] = subpropertyKeysAndValues
                            currentSection?.subproperties = subproperties
                            sections[currentSectionName] = currentSection
//                            var subproperties = currentSection?.subproperties
//                            var subpropertyKeysAndValues = subproperties?[currentProperty!] ?? [String: String]()
//                            if subpropertyKeysAndValues[key] != nil {
//                                subpropertyKeysAndValues[key] = value
//                                subproperties?[currentProperty!] = subpropertyKeysAndValues
//                                currentSection?.subproperties = subproperties!
//                                sections[currentSection!.name] = currentSection
                            print("  Added sub-property key and value '\(key)' = '\(value)' under property '\(currentProperty!)' in section: \(currentSection!.name)")
                            print("  The current section contains '\(currentSection!)'")
//                            } else {
//                                let errorMessage = "Property did not have a name in sub-property"
//                                throw errorMessage
//                            }
                        }
                    }
                } else{
                    throw MyError("Expected a section definition")
                }
            } catch let error as MyError {
                print("Local Error in Property Case on line number: '\(currentLineNumber)'")
                throw error.localizedDescription
            }
            case _ where !line.contains("="):
                if line.isEmpty || line == blankLine {
                    continue
                }
                do {
                    if line.hasPrefix("[") && line.hasSuffix("]"){
                        continue
                    } else if !line.hasSuffix("]"){
                        throw MyError("Section definition must end with ']'")
                    }
                    if currentProperty != nil {
                        
                        guard let currentKeyPropertyName = currentSection?.properties.keys.first else {
                            throw MyError("Property key did not have a name")
                        }
                        let components = String(line)
                        let value = components.trimmingCharacters(in: .whitespaces)

                        if currentSection?.properties[currentKeyPropertyName] != nil {
                            currentSection?.properties[currentKeyPropertyName]?.append("\n" + value)
                            sections[currentSection!.name] = currentSection
                        } else {
                            currentSection?.properties[currentKeyPropertyName] = value
                            sections[currentSection!.name] = currentSection
                        }
                        print("  Added new value '\(value)' to key '\(currentKeyPropertyName)' within section '\(currentSection!.name)'")
                        print("  The current section contains '\(currentSection!)")
                    } else {
                        if !line.hasPrefix(" ") && !line.hasPrefix("\t"){
                            throw MyError("Expected a property definition")
                        }else {
                            throw MyError("Expected a property definition, found continuation")
                        }
                    }
                } catch let error as MyError {
                    print("Local Error in Property Continuation Case on line number: '\(currentLineNumber)'")
                    throw error.localizedDescription
                }
            default:
                print("Unrecognized line: \"\(line)\" on line number: '\(currentLineNumber)'")

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
    var localizedDescription: String { self }
}

struct Subsection: FileBasedConfigurationSubsection {
    let subproperties: [String: String]

    func value(for name: AWSSDKCommon.FileBasedConfigurationKey) -> String? {
        subproperties[name.rawValue]
    }
}

struct MyError: Error {
    let localizedDescription: String

    init(_ msg: String) {
        self.localizedDescription = msg
    }
}
