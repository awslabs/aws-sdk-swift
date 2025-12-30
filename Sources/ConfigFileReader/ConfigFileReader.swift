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
    
    private func parseSectionHeader(from line: String) -> (name: String, type: FileBasedConfigurationSectionType)? {
        let commentPattern = " *[#;].*$"
        let definedSection = try! NSRegularExpression(pattern: "^\\[\\s*(.+?)\\s*\\]", options: .caseInsensitive) // Regex pattern to match any potential line containing a section definition
        
        guard let match = definedSection.firstMatch(in: line, options: [], range: NSRange(line.startIndex..., in: line)) else {
            return nil
        }
        
        // Extract the content inside the brackets
        let contentRange = Range(match.range(at: 1), in: line)!
        var content = String(line[contentRange]).trimmingCharacters(in: .whitespaces)
        
        // separate the content from the comments
        if let commentRange = content.range(of:commentPattern, options: .regularExpression) {
            content = String(content[..<commentRange.lowerBound].trimmingCharacters(in: .whitespaces))
        }

        if content == "default" {
            return (name: "default", type: .profile)
        } else if let spaceIndex = content.firstIndex(where: \.isWhitespace) {
            let type = String(content[..<spaceIndex])
            let name = String(content[content.index(after: spaceIndex)...].trimmingCharacters(in: .whitespaces))
            
            guard name.rangeOfCharacter(from: .whitespaces) == nil else {
                // If there's whitespace in the name, this header is invalid, so return nil
                return nil
            }
            
            switch type {
                case "profile":
                return (name: name, type: .profile)
                case "sso-session":
                    return (name: name, type: .ssoSession)
                case "services":
                    return (name: name, type: .services)
                default:
                    return (name: content, type: .profile)
            }
        }
        return (name: content.trimmingCharacters(in: .whitespaces), type: .profile)
    }
    
    private func handleNewSectionFound(name sectionName: String, type sectionType: FileBasedConfigurationSectionType, lineNumber: Int, targetDictionary: inout [String: ConfigFileSection]) -> Bool {
        let typePrefix: String
            switch sectionType {
            case .profile:
                typePrefix = "profile"
            case .ssoSession:
                typePrefix = "sso-sessions"
            case .services:
                typePrefix = "services"
            }
        
        let fullSectionKey = "\(typePrefix) \(sectionName)"
        if targetDictionary[fullSectionKey] == nil {
            let section = ConfigFileSection(name: sectionName)
            targetDictionary[fullSectionKey] = section
            currentSection = section
            targetDictionary[sectionName] = currentSection
            print("Found new section typed: '\(sectionType)', named: '\(sectionName)' on line number: '\(lineNumber)'")
            print("The current section that will be tracked is: '\(currentSection!)'")
            currentProperty = nil
            currentSubProperty = nil
            isCurrentSectionValid = true
            return true
        } else {
            print("Found duplicate section matching current section on line number: '\(lineNumber)' current section typed: '\(sectionType)', named: '\(sectionName)' will remain unchanged")
            isCurrentSectionValid = true
            currentProperty = nil
            currentSubProperty = nil
            return false
        }
    }
    
    // Extension to strip comments and trim whitespace from raw strings
    private func cleanedValue(from rawString: String) -> String {
        let commentPattern = " +[#;]" // Regex to match comments to end of line
        if currentSubSection != nil && rawString.hasPrefix(" ") {
            let cleanString = rawString.trimmingCharacters(in: .whitespacesAndNewlines)
            return cleanString
        } else if currentPropertyValue != nil || currentSubProperty != nil {
            let cleanString = rawString.trimmingCharacters(in: .whitespacesAndNewlines)
            return cleanString
        } else {
            var cleanString = rawString.trimmingCharacters(in: .whitespacesAndNewlines)
            if let commentRange = cleanString.range(of: commentPattern, options: .regularExpression) {
                cleanString = String(cleanString[..<commentRange.lowerBound].trimmingCharacters(in: .whitespaces))
            }
            return cleanString
        }
    }
    
    // Simple check for indentation
    private func isIndented(line: String) -> Bool {
        return line.hasPrefix(" ") || line.hasPrefix("\t")
    }
    
    private func handleStandardProperty(key: String, value: String, lineNumber: Int, targetDictionary: inout [String: ConfigFileSection]) throws {
        
            guard let sectionName = currentSection?.name else { throw MyError("Expected a section definition") }
        
            currentProperty = key
            currentPropertyValue = value
            currentSection?.properties[key] = value
            targetDictionary[sectionName] = currentSection
            
            print("  Added new property '\(key)' = '\(value)' to section '\(sectionName)'")
            print("  The current section contains '\(currentSection!)'")
        }
        
        private func handleSubProperty(key: String, value: String, lineNumber: Int, targetDictionary: inout [String: ConfigFileSection]) throws {
            
            guard let sectionName = currentSection?.name,
                  let currentSubSectionName = currentSubSection,
                  let currentProp = currentProperty else {
                throw MyError("Property did not have a name in sub-property")
            }

            if key.rangeOfCharacter(from: .whitespaces) == nil {
                // The logic for subproperties isolated in this function
                currentSection?.properties[currentProp] = nil // Clear standard property if it has subprops
                var subproperties = currentSection?.subproperties ?? [String: [String: String]]()
                var subpropertyKeysAndValues = subproperties[currentSubSectionName] ?? [String: String]()
                subpropertyKeysAndValues[key] = value
                subproperties[currentSubSectionName] = subpropertyKeysAndValues
                currentSection?.subproperties = subproperties
                targetDictionary[sectionName] = currentSection
            } else {
                currentSection?.properties[currentProp] = nil // Clear standard property if it has subprops
                var subproperties = currentSection?.subproperties ?? [String: [String: String]]()
                let subpropertyKeysAndValues = subproperties[currentSubSectionName] ?? [:]
                subproperties[currentSubSectionName] = subpropertyKeysAndValues
                currentSection?.subproperties = subproperties
                targetDictionary[sectionName] = currentSection
            }
            print("  Added sub-property key and value '\(key)' = '\(value)' under subsection '\(currentSubSectionName)'")
            print("  The current section contains '\(currentSection!)'")
        }
        
        private func handleStandardKeyWithoutValue(key: String, lineNumber: Int, targetDictionary: inout [String: ConfigFileSection]) throws {
            guard let sectionName = currentSection?.name else { throw MyError("Expected a section definition") }
            
            currentSubSection = key
            currentProperty = key
            currentPropertyValue = ""
            currentSection?.properties[key] = ""
            targetDictionary[sectionName] = currentSection
            
            print("  Added new property '\(key)' with no value to section '\(sectionName)'")
            print("  Added property '\(key)' as a subsection to current section")
            print("  The current section contains '\(currentSection!)'")
        }
    
        private func handleSubProptertyKeyWithoutValue(key: String, lineNumber: Int, targetDictionary: inout [String: ConfigFileSection]) throws {
            guard key.rangeOfCharacter(from: .whitespaces) == nil else {
                    print("Warning: Silently ignoring subproperty key '\(key)' on line \(lineNumber) because it contains whitespace.")
                    return // Exit the function silently
                }
            
            guard let sectionName = currentSection?.name,
                  let currentSubSectionName = currentSubSection,
                  let currentProp = currentProperty else {
                throw MyError("Property did not have a name in sub-property")
            }

            currentSection?.properties[currentProp] = nil // Clear standard property if it has subprops
            var subproperties = currentSection?.subproperties ?? [String: [String: String]]()
            var subpropertyKeysAndValues = subproperties[currentSubSectionName] ?? [String: String]()
            subpropertyKeysAndValues[key] = ""
            subproperties[currentSubSectionName] = subpropertyKeysAndValues
            currentSection?.subproperties = subproperties
            targetDictionary[sectionName] = currentSection
            
            print("  Added sub-property key: '\(key)' with no value under subsection '\(currentSubSectionName)'")
            print("  The current section contains '\(currentSection!)'")
        }
    
    private func handleLineContinuation(forKey key: String, value: String, targetDictionary: inout [String: ConfigFileSection]) throws {
        guard let sectionName = currentSection?.name else { throw MyError("No current section for continuation") }

        let cleanedValue = self.cleanedValue(from: value)
        if currentSubProperty != nil, let subSectionName = currentSubSection {
            var subprops = currentSection?.subproperties ?? [:]
            var subKeyValues = subprops[subSectionName] ?? [:]
            
            if let existingValue = subKeyValues[key] {
                subKeyValues[key] = existingValue + "\n" + cleanedValue
            } else {
                subKeyValues[key] = cleanedValue
            }
            subprops[subSectionName] = subKeyValues
            currentSection?.subproperties = subprops
        } else {
            if let existingValue = currentSection?.properties[key] {
                currentSection?.properties[key] = existingValue + "\n" + cleanedValue
            } else {
                currentSection?.properties[key] = cleanedValue
            }
        }
        targetDictionary[sectionName] = currentSection
        print("  Appended value '\(cleanedValue)' to key '\(key)' within section '\(sectionName)'")
    }
    
    private func mergeSectionProperties(configSection: inout ConfigFileSection, credentialSection: ConfigFileSection) {
        
        // --- 1. Merge top-level properties ---
        for (propKey, credValue) in credentialSection.properties {
            // If the property exists in config, it's overwritten by cred value.
            // If it doesn't exist in config, it's added.
            configSection.properties[propKey] = credValue
        }
        
        // --- 2. Merge subproperties (nested dictionaries) ---
        for (subPropKey, credSubProps) in credentialSection.subproperties {
            
            if var existingConfigSubProps = configSection.subproperties[subPropKey] {
                // If the subproperty already exists in the config file, we iterate
                // through the credential's inner keys and merge them in.
                for (innerKey, innerValue) in credSubProps {
                    existingConfigSubProps[innerKey] = innerValue // Credentials take precedence
                }
                configSection.subproperties[subPropKey] = existingConfigSubProps
                
            } else {
                // If the whole subproperty group doesn't exist in config, just add the credential version
                configSection.subproperties[subPropKey] = credSubProps
            }
        }
    }


    func config() throws -> FileBasedConfigurationSectionProviding? {
        
        // Use the helper function for the config file (which is mandatory)
        let stringConfigData = readAndDecodeFile(atPath: configFilePath, fileDescription: "Configuration") ?? ""
        
        // Use the helper function for the credentials file (handle it optionally, if it fails, stringCredentialsData is nil)
        let stringCredentialsData = readAndDecodeFile(atPath: credentialsFilePath, fileDescription: "Credentials")
        
        let configLines = stringConfigData.split(whereSeparator: \.isNewline)
        let credentialsLines = stringCredentialsData?.split(whereSeparator: \.isNewline)
        
        var sources: [ParsableFile] = [ParsableFile(type: "config", lines: configLines)]
            if let creds = credentialsLines {
                sources.append(ParsableFile(type: "credentials", lines: creds))
            }

        // Initialize separate temporary dictionaries for each file type
        var configSections = [String: ConfigFileSection]()
        var credentialSections = [String: ConfigFileSection]()
        for source in sources {
            print("\n--- Starting processing for \(source.type) file ---")
            
            if source.type == "config" {
                print("Configuration File contents:", stringConfigData.split(whereSeparator: \.isNewline))
            } else {
                print("Credential File contents:", stringCredentialsData?.split(whereSeparator: \.isNewline) as Any)
            }
            // Initialize a temp dictionary for the inner loop
            var tempDictionary: [String: ConfigFileSection]!
                    if source.type == "config" {
                        tempDictionary = configSections
                    } else {
                        tempDictionary = credentialSections
                    }
            
            for line in source.lines{
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
                case _ where line.contains("[") && line.contains("]"):
                        if let sectionHeader = parseSectionHeader(from: String(line)) {
                            if !handleNewSectionFound(name: sectionHeader.name, type: sectionHeader.type, lineNumber: currentLineNumber, targetDictionary: &tempDictionary) {
                                continue
                            }
                        }
                case _ where line.contains("="):
                    do {
                        if !isCurrentSectionValid, newSection {
                            print("Skipping line because previous section was invalid: \(line)")
                            break
                        }
                        guard currentSection != nil else {
                            throw MyError("Expected a section definition")
                        }
                        
                        let components = line.split(separator: "=", maxSplits: 1)
                        let equalsIndex = line.firstIndex(of: "=")!
                        let keyRange = line.startIndex..<equalsIndex
                        let valueRange = line.index(after: equalsIndex)..<line.endIndex
                        let key = cleanedValue(from: String(line[keyRange].lowercased()))
                        let value = cleanedValue(from: String(line[valueRange]))
                        
                        guard !key.isEmpty else {
                            throw MyError("Property did not have a name")
                            }
                        
                        guard components.count == 2 else {
                            // This path handles keys with no values (e.g., just `key=`)
                            if isIndented(line: String(line)) {
                                try handleSubProptertyKeyWithoutValue(key: key, lineNumber: currentLineNumber, targetDictionary: &tempDictionary)
                                } else {
                                    try handleStandardKeyWithoutValue(key: key, lineNumber: currentLineNumber, targetDictionary: &tempDictionary)
                                        }
                            continue
                            }

                        if isIndented(line: String(line)) {
                            try handleSubProperty(key: key, value: value, lineNumber: currentLineNumber, targetDictionary: &tempDictionary)
                            } else {
                                guard key.rangeOfCharacter(from: .whitespaces) == nil else { break }
                                try handleStandardProperty(key: key, value: value, lineNumber: currentLineNumber, targetDictionary: &tempDictionary)
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
                        let lineString = String(line)
                                
                        guard currentSection != nil else {
                            throw MyError("Expected a section definition but found a value continuation on line: \(currentLineNumber)")
                        }
                                
                        guard isCurrentSectionValid else {
                            print("Skipping line because previous section was invalid: \(lineString)")
                            continue
                        }
                        guard let currentPropKey = currentProperty else {
                            // This happens if the continuation line is the very first line after a section header
                            if isIndented(line: lineString) {
                                throw MyError("Expected a property definition, found indented continuation on line: \(currentLineNumber)")
                            } else {
                                throw MyError("Expected a property definition on line: \(currentLineNumber)")
                                }
                            }
                        guard currentPropertyValue != "" else {
                            throw MyError("Expected an '=' sign defining a property in sub-property on line: \(currentLineNumber)")
                        }
                        try handleLineContinuation(forKey: currentPropKey, value: lineString, targetDictionary: &tempDictionary)
                        
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
            if source.type == "config" {
                configSections = tempDictionary
            } else {
                credentialSections = tempDictionary
            }
        }
        // Merge the final results after both loops complete
        var mergedSections = configSections
        for (fullSectionKey, credSection) in credentialSections {
            // Credentials override config settings
            if var configSectionToUpdate = mergedSections[fullSectionKey] {
                // A matching section was found in both files. We must deep merge the properties.
                mergeSectionProperties(configSection: &configSectionToUpdate, credentialSection: credSection)
                mergedSections[fullSectionKey] = configSectionToUpdate // Save the updated section back
            }
            else {
                // No matching section found in config; just add the credential section entirely.
                mergedSections[fullSectionKey] = credSection
            }
        }
        print("\n---Results after the merge of sections--- \n\(mergedSections)\n")
        return ConfigFile(sections: mergedSections)
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

struct ParsableFile {
        let type: String
        let lines: [Substring]
    }
