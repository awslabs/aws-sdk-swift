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
    var newSection = false
    var sections: [String: ConfigFileSection] = [:]
    var currentSubSection: String?
    var currentProperty: String?
    var currentPropertyValue: String?
    var currentSubProperty: String?
    var currentLineNumber: Int = 0
    var currentFullSectionKey: String?
    var isCurrentSectionExplicit: Bool = false
    var state: ParserState? = nil
    var hasExplicitDefaultInConfig: Bool = false
    var currentSource: String?
    
    public init?(_ configFilePath: String?, _ credentialsFilePath: String?) async throws {
        let env = ProcessInfo.processInfo.environment
        self.configFilePath = env["AWS_CONFIG_FILE"] ?? configFilePath ?? "~/.aws/config"
        self.credentialsFilePath = env["AWS_SHARED_CREDENTIALS_FILE"] ?? credentialsFilePath ?? "~/.aws/credentials"
    }
    
    func extractFileContents(atPath path: String, fileDescription: String) -> String? {
        let expandedPath = (path as NSString).expandingTildeInPath
        
        guard FileManager.default.fileExists(atPath: expandedPath) else {
            print(" \(fileDescription) not found at \(expandedPath). Skipping.")
            return nil
        }
        
        guard let storedData = FileManager.default.contents(atPath: expandedPath) else {
            print("Warning: Could not open \(fileDescription) at \(expandedPath). Treating as empty file.")
            return nil
        }
        
        guard let decodedString = String(data: storedData, encoding: .utf8) else {
            print("Error: Could not decode \(fileDescription) as UTF-8. Treating as empty file.")
            return nil
        }
        
        print("Successfully read \(fileDescription) file at: \(path)")
        return decodedString
    }
        
    private func handleParseError(_ error: Error, line: String) {
        print("Local Error: '\(error.localizedDescription)'")
        print("The line that caused the error was: '\(line)' on line number: '\(currentLineNumber)'")
    }
    
    private enum lineTypeRegexPattern {
        
        static let sectionRegex: NSRegularExpression? = {
            // pattern matches: [ (optional type) (name) (optional comment) ] (optional comment)
            let pattern = #"^\[\s*(?:(?<type>[A-Za-z0-9_\-/.%@:+]+)\s+)?(?<name>[A-Za-z0-9_\-/.%@:+]+)\s*\]\s*(?:[#;].*)?$"#
            return try? NSRegularExpression(pattern: pattern)
        }()
    }
    
    static func parseSectionHeader(from line: String) -> (name: String, type: FileBasedConfigurationSectionType, isExplicit: Bool)? {
        guard let sectionRegex = lineTypeRegexPattern.sectionRegex else { return nil }
        
        let typeAndNameRange = NSRange(line.startIndex..., in: line)
        guard let sectionMatch = sectionRegex.firstMatch(in: line, range: typeAndNameRange) else {
            return nil
        }
        
        func capture(name: String) -> String? {
            let nsRange = sectionMatch.range(withName: name)
            guard nsRange.location != NSNotFound,
                  let swiftRange = Range(nsRange, in: line) else { return nil }
            return String(line[swiftRange])
        }
        
        let typeStr = capture(name: "type")
        let name = capture(name: "name") ?? ""
        let hasProfilePrefix = (typeStr == "profile")
        
        if name == "default" && typeStr == nil {
                return (name: "default", type: .profile, isExplicit: false)
        }
        
        let sectionType: FileBasedConfigurationSectionType = switch typeStr {
        case "profile":     .profile
        case "sso-session": .ssoSession
        case "services":    .services
        default:            .profile
        }
        
        return (name: name, type: sectionType, isExplicit: hasProfilePrefix)
    }
    
    private func handleNewSectionFound(name sectionName: String,
                                       type sectionType: FileBasedConfigurationSectionType,
                                       isExplicit: Bool,
                                       lineNumber: Int,
                                       source: String,
                                       targetDictionary: inout [String: ConfigFileSection]) -> Bool {
        
        let typePrefix: String = switch sectionType {
            case .profile: "profile"
            case .ssoSession: "sso-session"
            case .services: "services"
        }

        let unifiedKey = (sectionName == "default") ? "profile default" : "\(typePrefix) \(sectionName)"
        currentFullSectionKey = unifiedKey

        if source == "config" && sectionName == "default" {
            if isExplicit {
                if self.hasExplicitDefaultInConfig, let existing = targetDictionary[unifiedKey] {
                    self.currentSection = existing
                } else {
                    targetDictionary[unifiedKey] = ConfigFileSection(name: sectionName)
                    self.currentSection = targetDictionary[unifiedKey]
                }
                self.hasExplicitDefaultInConfig = true
            } else {
                if self.hasExplicitDefaultInConfig { return false }
                
                self.currentSection = targetDictionary[unifiedKey] ?? ConfigFileSection(name: sectionName)
                targetDictionary[unifiedKey] = self.currentSection
            }
        } else {
            if let existing = targetDictionary[unifiedKey] {
                self.currentSection = existing
            } else {
                let newSection = ConfigFileSection(name: sectionName)
                targetDictionary[unifiedKey] = newSection
                self.currentSection = newSection
            }
        }
        
        currentProperty = nil
        currentSubProperty = nil
        return true
    }
    
    private func strippedCommentsAndWhitespace(from rawString: String) -> String {
        var cleanString = rawString.trimmingCharacters(in: .whitespacesAndNewlines)
        let isValue = currentPropertyValue != nil || currentSubProperty != nil
        let isIndented = currentSubSection != nil && rawString.hasPrefix(" ")
        
        if !isValue && !isIndented {
            let safeCommentPattern = #"\s+[#;].*"#
            if let range = cleanString.range(of: safeCommentPattern, options: .regularExpression) {
                cleanString = String(cleanString[..<range.lowerBound])
            }
        }
        
        return cleanString.trimmingCharacters(in: .whitespaces)
    }
    
    // Simple check for indentation
    private func isIndented(line: String) -> Bool {
        return line.hasPrefix(" ") || line.hasPrefix("\t")
    }
    
    private func processProperty(_ rawString: String, into targetDictionary: inout [String: ConfigFileSection]) throws {
        
        let components = rawString.split(separator: "=", maxSplits: 1, omittingEmptySubsequences: false).map(String.init)
        let key = strippedCommentsAndWhitespace(from: components[0].lowercased())
        let value = components.count > 1 ? strippedCommentsAndWhitespace(from: components[1]) : ""
        
        guard !key.isEmpty else { throw ParseError("Property did not have a name") }
        
        if isIndented(line: rawString) {
            try !value.isEmpty
                ? handleSubProperty(key: key, value: value, lineNumber: currentLineNumber, targetDictionary: &targetDictionary)
                : handleSubProptertyKeyWithoutValue(key: key, lineNumber: currentLineNumber, targetDictionary: &targetDictionary)
        } else {
            guard key.rangeOfCharacter(from: .whitespaces) == nil else { return }
            try !value.isEmpty
                ? handleStandardProperty(key: key, value: value, lineNumber: currentLineNumber, targetDictionary: &targetDictionary)
                : handleStandardKeyWithoutValue(key: key, lineNumber: currentLineNumber, targetDictionary: &targetDictionary)
        }
    }
    
    private func handleStandardProperty(key: String, value: String, lineNumber: Int, targetDictionary: inout [String: ConfigFileSection]) throws {
        guard let fullKey = currentFullSectionKey else { throw ParseError("Expected a section definition") }
            
        currentProperty = key
        currentPropertyValue = value
        currentSection?.properties[key] = value
        targetDictionary[fullKey] = currentSection!
            
        print("Added new property '\(key)' = '\(value)' to section '\(fullKey)'")
        print("The current section contains '\(currentSection!)'")
        print("'\(fullKey)' will be the sections key tracked")
    }
    
    private func handleSubProperty(key: String, value: String, lineNumber: Int, targetDictionary: inout [String: ConfigFileSection]) throws {
        guard let fullKey = currentFullSectionKey,
                  let subName = currentSubSection,
                  let currentProp = currentProperty else {
                throw ParseError("Property did not have a name in sub-property")
            }

        currentSection?.properties[currentProp] = nil
        var section = currentSection!
        var subsectionData = section.subproperties[subName] ?? [:]

        if key.rangeOfCharacter(from: .whitespaces) == nil {
            subsectionData[key] = value
            print("Added sub-property '\(key)' to subsection '\(subName)'")
        }
        
        section.subproperties[subName] = subsectionData
        self.currentSection = section
        targetDictionary[fullKey] = section
            
        print("Added sub-property key and value '\(key)' = '\(value)' under subsection '\(subName)'")
        print("The current section contains '\(currentSection!)'")
    }
    
    private func handleStandardKeyWithoutValue(key: String, lineNumber: Int, targetDictionary: inout [String: ConfigFileSection]) throws {
        guard let fullKey = currentFullSectionKey else { throw ParseError("Expected a section definition") }
        
        currentSubSection = key
        currentProperty = key
        currentPropertyValue = ""
        currentSection?.properties[key] = ""
        targetDictionary[fullKey] = currentSection!
        
        print("Found new property '\(key)' with no value")
        print("Added property '\(key)' as a subsection to current section '\(fullKey)'")
        print("The current section contains '\(currentSection!)'")
    }
    
    private func handleSubProptertyKeyWithoutValue(key: String, lineNumber: Int, targetDictionary: inout [String: ConfigFileSection]) throws {
        guard let fullKey = currentFullSectionKey,
              let currentSubSectionName = currentSubSection,
              let currentProp = currentProperty else {
            throw ParseError("Property did not have a name in sub-property")
        }
        
        guard key.rangeOfCharacter(from: .whitespaces) == nil else { return }
        
        var section = currentSection!
        section.properties[currentProp] = nil
        var subpropertyKeysAndValues = section.subproperties[currentSubSectionName] ?? [:]
        subpropertyKeysAndValues[key] = ""
        section.subproperties[currentSubSectionName] = subpropertyKeysAndValues
        self.currentSection = section
        targetDictionary[fullKey] = section
        
        print("Added sub-property key: '\(key)' with no value under subsection '\(currentSubSectionName)'")
        print("The current section contains '\(currentSection!)'")
    }
    
    private func processContinuation(_ rawString: String, into targetDictionary: inout [String: ConfigFileSection]) throws {
        guard let currentPropKey = currentProperty, let currentVal = currentPropertyValue else {
            if isIndented(line: rawString) {
                throw ParseError("Expected a property definition, found indented continuation")
            } else {
                throw ParseError("Expected a property definition")
            }
        }
        
        guard !currentVal.isEmpty else {
            throw ParseError("Expected an '=' sign defining a property in sub-property")
        }
        
        try handleLineContinuation(forKey: currentPropKey, value: rawString, targetDictionary: &targetDictionary)
    }
    
    private func handleLineContinuation(forKey key: String, value: String, targetDictionary: inout [String: ConfigFileSection]) throws {
        guard let fullKey = currentFullSectionKey, var section = currentSection else {
            throw ParseError("No current section for continuation")
        }
        
        let lineContinuation = self.strippedCommentsAndWhitespace(from: value)
        if currentSubProperty != nil, let subSectionName = currentSubSection {
            var subProps = section.subproperties[subSectionName] ?? [:]
            let existingValue = subProps[key] ?? ""
            subProps[key] = existingValue.isEmpty ? lineContinuation : existingValue + "\n" + lineContinuation
            section.subproperties[subSectionName] = subProps
        } else {
            let existingValue = section.properties[key] ?? ""
            section.properties[key] = existingValue.isEmpty ? lineContinuation : existingValue + "\n" + lineContinuation
        }
        self.currentSection = section
        targetDictionary[fullKey] = section
        print("  Appended value '\(lineContinuation)' to key '\(key)' within section '\(fullKey)'")
    }
    
    private func mergeSectionProperties(configSection: inout ConfigFileSection, credentialSection: ConfigFileSection) {

        for (propKey, credValue) in credentialSection.properties {
            configSection.properties[propKey] = credValue
        }
        
        for (subPropKey, credSubProps) in credentialSection.subproperties {
            
            if var existingConfigSubProps = configSection.subproperties[subPropKey] {
                for (innerKey, innerValue) in credSubProps {
                    existingConfigSubProps[innerKey] = innerValue
                }
                configSection.subproperties[subPropKey] = existingConfigSubProps
            } else {
                configSection.subproperties[subPropKey] = credSubProps
            }
        }
    }
    
    func config() throws -> FileBasedConfigurationSectionProviding? {
        let configData = extractFileContents(atPath: configFilePath, fileDescription: "Config") ?? ""
        let credsData = extractFileContents(atPath: credentialsFilePath, fileDescription: "Creds")
        let sources: [(type: String, lines: [Substring])] = [
            (type: "config", lines: configData.split(whereSeparator: \.isNewline)),
            credsData.map { (type: "credentials", lines: $0.split(whereSeparator: \.isNewline)) }
            ].compactMap { $0 }
        var configSections = [String: ConfigFileSection]()
        var credentialSections = [String: ConfigFileSection]()
        
        print("\n[DEBUG] RAW CONFIG FILE CONTENTS:")
        print(configData.isEmpty ? "(Empty)" : configData)
            
        print("\n[DEBUG] RAW CREDS FILE CONTENTS:")
        print(credsData?.isEmpty == false ? credsData! : "(Empty or Missing)")
        
        print("\n[TEST DEBUG] Number of sources to process: \(sources.count)")
        
        for source in sources {
            print("Source Type: \(source.type), Line Count: \(source.lines.count)")
            var targetDict = (source.type == "config") ? configSections : credentialSections
            currentSource = source.type
            
            for (index, line) in source.lines.enumerated() {
                currentLineNumber = index + 1
                let lineString = String(line)
                
                do {
                    try process(line: lineString, into: &targetDict)
                } catch {
                    handleParseError(error, line: lineString)
                    throw error
                }
            }
            if source.type == "config" { configSections = targetDict }
            else { credentialSections = targetDict }
        }
        
        func applyPrecedence(_ dict: inout [String: ConfigFileSection]) {
            if dict["profile default"] != nil && dict["default"] != nil {
                dict.removeValue(forKey: "default")
            }
        }
                
        applyPrecedence(&configSections)
        applyPrecedence(&credentialSections)
        
        let finalSections = configSections.merging(credentialSections) { (configSec, credSec) in
            var updated = configSec
            mergeSectionProperties(configSection: &updated, credentialSection: credSec)
            return updated
        }

        var finalResult = finalSections
        if finalResult["profile default"] != nil && finalResult["default"] != nil {
            finalResult.removeValue(forKey: "default")
        }

        print("\n--- Results after the merge of sections ---")
        print(finalResult)
        
        return ConfigFile(sections: finalResult)
    }
    
    private func process(line: String, into dict: inout [String: ConfigFileSection]) throws {
        switch line.classification {
        case .blank, .comment:
            return
            
        case .section(let rawString, let header):
            newSection = true
            guard rawString.contains("]") else { throw ParseError("Section definition must end with ']'") }
                
            if header?.name == "INVALID_SECTION" {
                state = .ignore
                currentProperty = nil
                currentPropertyValue = nil
            } else {
                let active = handleNewSectionFound(
                    name: header!.name,
                    type: header!.type,
                    isExplicit: header!.isExplicit,
                    lineNumber: currentLineNumber,
                    source: currentSource!,
                    targetDictionary: &dict
                )
                
                if active {
                    state = .active(sectionName: header!.name)
                } else {
                    state = .ignore
                }
            }
            
        case .property(let rawString, _, _):
            guard let currentState = state else {
                throw ParseError("Expected a section definition")
            }
                    
            switch currentState {
            case .ignore, .invalid:
                return
            case .active(_):
                try processProperty(rawString, into: &dict)
            }
            
        case .continuation(let rawString, _):
            guard let currentState = state else {
                throw ParseError("Expected a section definition")
            }
                    
            if case .ignore = currentState { return }
                try processContinuation(rawString, into: &dict)
            
        case .unknown(_):
            throw ParseError("Unknown line")
        }
    }
}

@_spi(FileBasedConfig)
public extension ConfigFileReader {
    static func makeAsync(configFilePath: String?, credentialsFilePath: String?) async throws -> FileBasedConfiguration? {
        try await ConfigFileReader(configFilePath, credentialsFilePath)?.config()
    }
}

extension String {
    var classification: lineType {
        let pattern = #"^\s*$"#
        let blankLine = try! NSRegularExpression(pattern: pattern)
        let range = NSRange(self.startIndex..., in: self)
        
        if self.isEmpty || blankLine.firstMatch(in: self, options: [], range: range) != nil {
            return .blank
        }
        
        if self.hasPrefix("#") || self.hasPrefix(";") {
            return .comment
        }
                
        if self.hasPrefix("[") {
            let invalidSec = "INVALID_SECTION"
            if let header = ConfigFileReader.parseSectionHeader(from: self) {
                print("'\(self)' is a valid section, it will be tracked as the current section")
                return .section(rawString: self, header: (name: header.name, type: header.type, isExplicit: header.isExplicit))
            } else {
                print("'\(invalidSec)' found, it's properties will be ignored")
                return .section(rawString: self, header: (name: invalidSec, type: .profile, isExplicit: false))
            }
        }
                
        if self.contains("=") {
            return .property(rawString: self, key: "", value: "")
        }
                        
        if self.hasPrefix(" ") || self.hasPrefix("\t") {
            return .continuation(rawString: self, value: self)
        }
        
        return .unknown(rawString: self)
    }
}

struct ConfigFile: FileBasedConfiguration {
    let sections: [String: ConfigFileSection]

    func section(for name: String, type: FileBasedConfigurationSectionType) -> (any FileBasedConfigurationSection)? {
        let typePrefix: String
        switch type {
        case .profile:
            typePrefix = "profile"
        case .ssoSession:
            typePrefix = "sso-session"
        case .services:
            typePrefix = "services"
        }

        let fullKey: String
        if name == "default" {
            if let explicit = sections["profile default"] { return explicit }
            fullKey = "default"
        } else {
            fullKey = "\(typePrefix) \(name)"
        }

        return sections[fullKey]
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

struct Subsection: FileBasedConfigurationSubsection {
    var subproperties: [String: String]

    func value(for name: AWSSDKCommon.FileBasedConfigurationKey) -> String? {
        subproperties[name.rawValue]
    }
}

struct ParseError: Error, LocalizedError {
    let message: String
    let line: Int?

    init(_ msg: String, line: Int? = nil) {
        self.message = msg
        self.line = line
    }
    
    var errorDescription: String? {
        if let line = line {
            return "Line \(line): \(message)"
        }
        return message
    }
}

struct ParsableFile {
        let type: String
        let lines: [Substring]
}
enum lineType {
    case comment
    case section(rawString: String, header: (name: String, type: FileBasedConfigurationSectionType, isExplicit: Bool)?)
    case property(rawString: String, key: String, value: String?)
    case continuation(rawString: String, value: String)
    case blank
    case unknown(rawString: String)
}

enum ParserState {
    case active(sectionName: String)
    case ignore
    case invalid
}
