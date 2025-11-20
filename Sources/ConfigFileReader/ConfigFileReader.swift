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
        var isCurrentSectionValid = false
        var sections: [String: ConfigFileSection] = [:]
        var currentProperty: String?
        var currentSubProperty: String?
        let definedSection = try! NSRegularExpression(pattern: "\\[\\s*(?:default|profile\\s+(.+?)|sso-session\\s+(.+?)|services\\s+(.+?))\\s*\\]", options: .caseInsensitive) // Regex pattern to match any line containing "profile", "default", "sso-services", and "services"
        
        for line in arrayData{
            currentLineNumber += 1
            let blankLine = "\t"
            guard !line.isEmpty && !line.hasPrefix("#") && !line.hasPrefix(";") && line != blankLine else{
                continue
            }
            switch line{
            case _ where definedSection.firstMatch(in: String(line), options: [], range: NSRange(line.startIndex..., in: line)) != nil:
                isCurrentSectionValid = true
                // Extract the profile name using another regex or string manipulation
                if let range = line.range(of: "\\[\\s*(?:default|profile\\s+(.+?)|sso-session\\s+(.+?)|services\\s+(.+?))\\s*\\]", options: .regularExpression),
                   let NameRange = line.range(of: "\\s+(.+?)\\s*\\]", options: .regularExpression, range: range.lowerBound..<range.upperBound) {
                    var sectionName = ""
                    let definedName = String(line[NameRange].dropFirst().dropLast().trimmingCharacters(in: .whitespaces)) // Remove space and ']'
                    if let newRange = definedName.range(of: "profile|sso-session|services\\s+(.+?)"){
                        sectionName = String(definedName[newRange.upperBound...])
                    } else{
                        sectionName = definedName
                    }
                    if sectionName != currentSection?.name {
                        let section = ConfigFileSection(name: sectionName)
                        sections[sectionName] = section
                        currentSection = section
                        print("Found new section named: '\(sectionName)' on line number: '\(currentLineNumber)'") // For demonstration
                        print("  The current section contains '\(currentSection!)'")
                        isCurrentSectionValid = true
                    } else {
                        print("Found dulpicate section matching current section on line number: '\(currentLineNumber)' current section will remain unchanged: '\(sectionName)' ")
                        currentProperty = nil
                        currentSubProperty = nil
                        isCurrentSectionValid = true
                        continue
                    }
                } else if line.contains("[default]"){
                    let sectionName = "default"
                    if sectionName != currentSection?.name {
                        let section = ConfigFileSection(name: sectionName)
                        sections[sectionName] = section
                        currentSection = section
                        print("A user profile was not configured, the \(sectionName) will be used")
                        print("  The current section contains '\(currentSection!)'")
                        isCurrentSectionValid = true
                    } else {
                        print("Found dulpicate section matching current section on line number: '\(currentLineNumber)' current section will remain unchanged: '\(sectionName)' ")
                        currentProperty = nil
                        currentSubProperty = nil
                        isCurrentSectionValid = true
                        continue
                    }
                } else {
                    print("Found invalid section: '\(line)' on line number: '\(currentLineNumber)'")
                    isCurrentSectionValid = false
                }
            case _ where line.contains("="):
                if !isCurrentSectionValid {
                        print("Skipping line because previous section was invalid")
                        continue // Skip this line and move to the next iteration
                    }
                do {
                guard currentSection != nil else{
                    throw MyError("Expected a section definition")
                }
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
                            print("  Added sub-property key and value '\(key)' = '\(value)' under property '\(currentProperty!)' in section: \(currentSection!.name)")
                            print("  The current section contains '\(currentSection!)'")
                        }
                    }
            } catch let error as MyError {
                print("Local Error in Property Case")
                print("The line that caused the error was: '\(line)' on line number: '\(currentLineNumber)'")
                throw error.localizedDescription
            }
            case _ where !line.contains("=") && line.hasPrefix("\t") && line != blankLine:
                if !isCurrentSectionValid {
                        print("Skipping line because previous section was invalid")
                        continue // Skip this line and move to the next iteration
                    }
                do {
                    guard currentSection != nil else{
                        throw MyError("Expected a section definition")
                    }
                    if currentProperty != nil {
                        guard let currentKeyPropertyName = currentSection?.properties.keys.first else {
                            throw MyError("Property key did not have a name")
                        }
                        let components = String(line)
                        let value = components.dropFirst().dropLast().trimmingCharacters(in: .whitespacesAndNewlines)
                        guard !value.isEmpty && !value.contains(" ") && value != blankLine  else{
                            continue
                        }

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
                    print("Local Error in Property Continuation Case ")
                    print("The line that caused the error was: '\(line)' on line number: '\(currentLineNumber)'")
                    throw error.localizedDescription
                }
            default:
                print("Unrecognized line: \"\(line)\" on line number: '\(currentLineNumber)'")
                do{
                    if line.hasPrefix("["){
                        guard line.hasSuffix("]") else{
                            print("Local Error in Section Definition")
                            throw MyError("Section definition must end with ']'")
                        }
                        break
                    }
                } catch let error as MyError{
                    print("The line that caused the error was: '\(line)' on line number: '\(currentLineNumber)'")
                    throw error
                }
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
