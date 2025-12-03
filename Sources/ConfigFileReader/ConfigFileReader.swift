//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//
import Foundation
@_spi(FileBasedConfig) import AWSSDKCommon

public class ConfigFileReader {
    public let configFilePath: String
    public let credentialsFilePath: String
    
    var currentSection: ConfigFileSection?
    var isCurrentSectionValid = false
    var newSection = false
    var sections: [String: ConfigFileSection] = [:]
    var currentSubSection: String?
    var currentProperty: String?
    var currentPropertyValue: String?
    var currentSubProperty: String?
    
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
    
    private func parseSectionHeader(from line: String) -> (name: String, type: String)? {
        let regexPattern = "\\[\\s*(?:(default)|(profile)\\s+(.+?)|(sso-session)\\s+(.+?)|(services)\\s+(.+?))\\s*\\]"
        let commentPattern = " *[#;]"
            
        guard line.range(of: regexPattern, options: .regularExpression) != nil else {
                return nil
            }
        var content = String(line).dropFirst().dropLast().trimmingCharacters(in: .whitespacesAndNewlines)
        
        if let commentRange = content.range(of:commentPattern, options: .regularExpression) {
            content = String(content[..<commentRange.lowerBound].trimmingCharacters(in: .whitespaces))
        }
        
        if content.hasSuffix("]"){
            content = String(content.dropLast())
        }

        if content == "default" {
            return (name: "default", type: "profile")
        } else if let spaceIndex = content.firstIndex(where: \.isWhitespace) {
            let type = String(content[..<spaceIndex])
            let name = String(content[content.index(after: spaceIndex)...])
            return (name: name.trimmingCharacters(in: .whitespaces), type: type)
        }
        if content.contains("profile") == false && content.contains("sso-session") == false && content.contains("services") == false {
                return (name: content, type: "profile") // Assume it's just a profile name if no type keyword found
            }
        return nil
    }
    
    private func handleNewSectionFound(name sectionName: String, lineNumber: Int) -> Bool {
        if sectionName != currentSection?.name {
            let section = ConfigFileSection(name: sectionName)
            sections[sectionName] = section
            currentSection = section
            print("Found new section named: '\(sectionName)' on line number: '\(lineNumber)'")
            currentProperty = nil
            currentSubProperty = nil
            isCurrentSectionValid = true
            return true // Signal to continue processing this line's content if needed (though sections usually end the line's work)
        } else {
            print("Found duplicate section matching current section on line number: '\(lineNumber)' current section will remain unchanged: '\(sectionName)' ")
            isCurrentSectionValid = true
            currentProperty = nil
            currentSubProperty = nil
            // If a duplicate is found, we want the loop to immediately move to the next line.
            return false
        }
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
        
        let definedSection = try! NSRegularExpression(pattern: "\\[\\s*(?:default|profile\\s+(.+?)|sso-session\\s+(.+?)|services\\s+(.+?))\\s*\\]", options: .caseInsensitive) // Regex pattern to match any line containing "profile", "default", "sso-services", and "services"        
        for line in arrayData{
            var currentLineNumber: Int = 0
            currentLineNumber += 1
            let blankLine = try! NSRegularExpression(pattern: "^\\s*$", options: [])
            guard !line.isEmpty && !line.hasPrefix("#") && !line.hasPrefix(";") && blankLine.firstMatch(in: String(line), options: [], range: NSRange(line.startIndex..., in: line)) == nil else{
                continue
            }
            if line.contains("["){
                newSection = true
            }
            switch line{
            case _ where definedSection.firstMatch(in: String(line), options: [], range: NSRange(line.startIndex..., in: line)) != nil:
                if let sectionHeader = parseSectionHeader(from: String(line)) {
                    if !handleNewSectionFound(name: sectionHeader.name, lineNumber: currentLineNumber) {
                    continue
                    }
                }
                continue
            case _ where line.contains("="):
                do {
//                    guard currentSection != nil, isCurrentSectionValid else {
//                            if currentSection == nil {
//                                throw MyError("Expected a section definition")
//                            } else{
//                                print("Skipping line because previous section was invalid: \(line)")
//                                break
//                            }
//                        }
                    if !isCurrentSectionValid, newSection {
                        print("Skipping line because previous section was invalid: \(line)")
                        break
                    }
                    guard currentSection != nil else {
                        throw MyError("Expected a section definition")
                    }
                    //Identify properties under section
                    let components = line.split(separator: "=", maxSplits: 1).map(String.init)
                    let equalsIndex = line.firstIndex(of: "=")!
                    let keyRange = line.startIndex..<equalsIndex
                    let valueRange = line.index(after: equalsIndex)..<line.endIndex
                    if components.count == 1{
                        let commentPattern = " +[#;]"
                        var propertyName: String!
                        let key = line[keyRange]
                        if !line.hasPrefix(" ") && !line.hasPrefix("\t"){
                            guard !key.isEmpty else {
                                throw MyError("Property did not have a name")
                            }
                            propertyName = String(key.trimmingCharacters(in: .whitespaces))
                            // Check for and remove the first comment character found
                            if let commentRange = propertyName.range(of:commentPattern, options: .regularExpression) {
                                propertyName = String(propertyName[..<commentRange.lowerBound].trimmingCharacters(in: .whitespaces))
                            }
                            currentProperty = propertyName
                            currentPropertyValue = nil
                            currentSection?.properties[propertyName] = ""
                            sections[currentSection!.name] = currentSection
                            let subSectionName = String(propertyName)
                            let subSection = ConfigFileSection(name: subSectionName)
                            sections[subSectionName] = subSection
                            currentSubSection = subSectionName
                            print("Found new property key with no value: '\(subSectionName)' on line number: '\(currentLineNumber)', added to section: '\(currentSection!.name)' as a new subsection")
                        } else if line.hasPrefix(" ") || line.hasPrefix("\t") {
                            let subKey = key
                            guard !subKey.isEmpty else {
                                throw MyError("Property did not have a name")
                            }
                            propertyName = String(subKey.trimmingCharacters(in: .whitespaces))
                            // Check for and remove the first comment character found
                            if let commentRange = propertyName.range(of:commentPattern, options: .regularExpression) {
                                propertyName = String(propertyName[..<commentRange.lowerBound].trimmingCharacters(in: .whitespaces))
                            }
                            currentSection?.properties[currentProperty!] = nil
                            currentSubProperty = propertyName //Start of a sub-property
                            var subprops = currentSection?.subproperties ?? [String: [String: String]]()
                            var subKeyValues = subprops[currentSubProperty!] ?? [String: String]()
                            subKeyValues[propertyName] = "" // Add the blank value
                            subprops[currentProperty!] = subKeyValues
                            currentSection?.subproperties = subprops
                            sections[currentSection!.name] = currentSection
                            print("Found new sub-property key with no value: '\(currentSubProperty!)' on line number: '\(currentLineNumber)', added to section: '\(currentSection!.name)'")
                        } else{
                            throw MyError("Property did not have a name")
                        }
                        print("  The current section contains '\(currentSection!)'")
                    } else if components.count == 2{
                        // This handles properties key-value pairs within a section
                        let key = String(line[keyRange].trimmingCharacters(in: .whitespaces).lowercased())
                        var value = String(line[valueRange].trimmingCharacters(in: .whitespaces))
                        let commentPattern = " +[#;]"
                        if !line.hasPrefix(" ") && !line.hasPrefix("\t"){
                            if let commentRange = value.range(of:commentPattern, options: .regularExpression) {
                                value = String(value[..<commentRange.lowerBound].trimmingCharacters(in: .whitespaces))
                            }
                            // key-value pair aren't indented
                            currentSubSection = nil // End of subsection if no indent
                            currentProperty = key
                            currentPropertyValue = value
                            currentSubProperty = value
                            currentSection?.properties[key] = value
                            sections[currentSection!.name] = currentSection
                            print("  Added new property key and value '\(key)' = '\(value)' to section '\(currentSection!.name)'")
                            print("  The current section contains '\(currentSection!)'")
                        } else{
                            // key-value pair are indented
                            guard let currentSectionName = currentSection?.name,
                                  let currentSubSectionName = currentSubSection,
                                  !key.isEmpty else {
                                throw MyError("Property did not have a name in sub-property")
                            }
                            currentSection?.properties[currentProperty!] = nil
                            var subproperties = currentSection?.subproperties
                            var subpropertyKeysAndValues = subproperties![currentSubSectionName] ?? [String: String]()
                            subpropertyKeysAndValues[key] = value
                            subproperties![currentSubSectionName] = subpropertyKeysAndValues
                            currentSection?.subproperties = subproperties!
                            sections[currentSectionName] = currentSection
                            print("  Added sub-property key and value '\(key)' = '\(value)' under subsection '\(currentSubSectionName)' in section: \(currentSection!.name)")
                            print("  The current section contains '\(currentSection!)'")
                        }
                    }
            } catch let error as MyError {
                print("Local Error: '\(error.localizedDescription)', in Property Case")
                print("The line that caused the error was: '\(line)' on line number: '\(currentLineNumber)'")
                currentSection = nil
                isCurrentSectionValid = false
                throw error
            }
                continue
            case _ where !line.contains("=") && !line.hasPrefix("["):
                do {
                    guard currentSection != nil else{
                        throw MyError("Expected a section definition")
                    }
                    if !isCurrentSectionValid {
                            print("Skipping line because previous section was invalid")
                            continue // Skip this line and move to the next iteration
                        }
                    if currentProperty != nil && currentPropertyValue != nil {
                        guard let currentKeyPropertyName = currentSection?.properties.keys.first else {
                            throw MyError("Property key did not have a name")
                        }
                        let components = String(line.trimmingCharacters(in: .whitespacesAndNewlines))
                        let value = components
                        if currentSection?.properties[currentKeyPropertyName] != nil {
                            currentSection?.properties[currentKeyPropertyName]?.append("\n" + value)
                            sections[currentSection!.name] = currentSection
                        } else {
                            currentSection?.properties[currentKeyPropertyName] = value
                            sections[currentSection!.name] = currentSection
                        }
                        print("  Added new value '\(value)' to key '\(currentKeyPropertyName)' within section '\(currentSection!.name)'")
                        print("  The current section contains '\(currentSection!)")
                    } else if currentProperty == nil {
                        if !line.hasPrefix(" ") && !line.hasPrefix("\t"){
                            throw MyError("Expected a property definition")
                        }else {
                            throw MyError("Expected a property definition, found continuation")
                        }
                    } else if currentPropertyValue == nil {
                        throw MyError("Expected an '=' sign defining a property in sub-property")
                    }
                } catch let error as MyError {
                    print("Local Error: '\(error.localizedDescription)', in Property Continuation Case ")
                    print("The line that caused the error was: '\(line)' on line number: '\(currentLineNumber)'")
                    throw error
                }
            default:
                print("Unrecognized line: \"\(line)\" on line number: '\(currentLineNumber)'")
                do{
                    if line.hasPrefix("["){
                        guard line.hasSuffix("]") else{
                            throw MyError("Section definition must end with ']'")
                        }
                        break
                    } else if line.contains("="){
                        guard currentSection != nil, isCurrentSectionValid else{
                            throw MyError("Expected a section definition")
                        }
                    }
                } catch let error as MyError{
                    print("Default Local Error: '\(error.localizedDescription)")
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
        case .ssoSession:
            sectionName = name
        case .services:
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
    var subproperties: [String: String]

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
