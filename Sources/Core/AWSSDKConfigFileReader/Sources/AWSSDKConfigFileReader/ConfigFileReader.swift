//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import Foundation
@_spi(FileBasedConfig) import AWSSDKCommon
import os.log

// MARK: - Supporting Types and Enums

/// Represents the current state of the configuration file parser
enum ParserState {
    case active(sectionName: String)
    case ignore
    case invalid
}

/// Classifies different types of configuration file lines
enum lineType {
    case comment
    case section(rawString: String, header: (name: String, type: FileBasedConfigurationSectionType, isExplicit: Bool)?)
    case property(rawString: String, key: String, value: String?)
    case multiLine(rawString: String, value: String)
    case blank
    case unknown(rawString: String)
}

/// Constants for configuration file format patterns
struct FormatConstants {
    static let safeCommentPattern = #"\s+[#;].*"#
}

/// Represents a parsable configuration file with its type and content lines
struct ParsableFile {
    let type: String
    let lines: [Substring]
}

/// Custom error type for configuration file parsing errors
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

// MARK: - Main ConfigFileReader Class

public class ConfigFileReader {
    
    // MARK: - Properties
    
    // Immutable configuration paths
    public let configFilePath: String
    public let credentialsFilePath: String
    
    // Parser state
    private var sections: [String: ConfigFileSection] = [:]
    private var currentSection: ConfigFileSection?
    private var currentSectionType: FileBasedConfigurationSectionType = .profile
    private var propertyContext = PropertyContext()
    private var parserState: ParserState? = nil
    private var hasExplicitDefaultInConfig: Bool = false
    private var currentLineNumber: Int = 0
    
    // Logging
    private let logger = Logger(subsystem: "com.amazonaws.awssdk", category: "ConfigFileReader")
    private var currentFileName: String = ""
    
    // MARK: - Nested Types
    
    /// Consolidates property-related parsing state
    private struct PropertyContext {
        var name: String?
        var value: String?
        var subSectionName: String?
        
        mutating func reset() {
            name = nil
            value = nil
            subSectionName = nil
        }
        
        mutating func resetProperty() {
            name = nil
            value = nil
            // Don't reset subSectionName - it should persist for multiple sub-properties
        }
        
        mutating func resetSubSection() {
            subSectionName = nil
            resetProperty()
        }
        
        var isInSubSection: Bool { subSectionName != nil }
        var hasValue: Bool { value != nil && !value!.isEmpty }
        var hasName: Bool { name != nil }
    }
    
    /// Regular expression patterns for parsing section headers
    private enum lineTypeRegexPattern {
        static let sectionRegex: NSRegularExpression? = {
            // pattern matches: [ (optional type) (name) (optional comment) ] (optional comment)
            let pattern = #"^\[\s*(?:(?<type>[A-Za-z0-9_\-/.%@:+]+)\s+)?(?<name>[A-Za-z0-9_\-/.%@:+]+)\s*\]\s*(?:[#;].*)?$"#
            return try? NSRegularExpression(pattern: pattern)
        }()
    }
    
    // MARK: - Initialization
    
    public init?(_ configFilePath: String?, _ credentialsFilePath: String?) async throws {
        let env = ProcessInfo.processInfo.environment
        // "-missing" was added as file locations to ensure files are not accessed during testing.
        self.configFilePath = env["AWS_CONFIG_FILE"] ?? configFilePath ?? "~/.aws/config-missing"
        self.credentialsFilePath = env["AWS_SHARED_CREDENTIALS_FILE"] ?? credentialsFilePath ?? "~/.aws/credentials-missing"
    }
    
    // MARK: - Public Interface
    
    /// Main configuration file parsing function
    /// Processes both config and credentials files, merges sections, and applies precedence rules
    /// 
    /// Processing Flow:
    /// 1. Extract file contents from config and credentials files
    /// 2. Split into lines and process each source separately
    /// 3. For each line: classify type → process type → handle specific case
    /// 4. Merge config and credentials sections (credentials override config)
    /// 5. Apply precedence rules (explicit [profile default] overrides [default])
    /// 
    /// Returns: FileBasedConfiguration with all parsed sections and properties
    func config() throws -> FileBasedConfigurationSectionProviding? {
        let configData = extractFileContents(atPath: configFilePath, fileDescription: "Config") ?? ""
        let credsData = extractFileContents(atPath: credentialsFilePath, fileDescription: "Creds")
        let sources: [(type: String, lines: [Substring])] = [
            (type: "config", lines: configData.split(whereSeparator: \.isNewline)),
            credsData.map { (type: "credentials", lines: $0.split(whereSeparator: \.isNewline)) }
            ].compactMap { $0 }
        var configSections = [String: ConfigFileSection]()
        var credentialSections = [String: ConfigFileSection]()
        
        func processSource(source: (type: String, lines: [Substring]), into sections: inout [String: ConfigFileSection]) throws {
            currentFileName = source.type == "config" ? "config file" : "credentials file"
            for (index, line) in source.lines.enumerated() {
                currentLineNumber = index + 1
                let lineString = String(line)
                do {
                    try processConfigurationLine(lineString, source: source.type, into: &sections)
                } catch {
                    handleParseError(error, line: lineString)
                    // Re-throw the error so tests that expect errors can catch them
                    throw error
                }
            }
        }

        for source in sources {
            do {
                if source.type == "config" {
                    try processSource(source: source, into: &configSections)
                } else {
                    try processSource(source: source, into: &credentialSections)
                }
            } catch {
                // Re-throw the error to maintain the original behavior for tests
                throw error
            }
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
        
        return ConfigFile(sections: finalResult)
    }
    
    // MARK: - File Operations
    
    func extractFileContents(atPath path: String, fileDescription: String) -> String? {
        let expandedPath = (path as NSString).expandingTildeInPath
        
        guard FileManager.default.fileExists(atPath: expandedPath) else {
            return nil
        }
        
        guard let storedData = FileManager.default.contents(atPath: expandedPath) else {
            logWarning("Could not read \(fileDescription.lowercased()) at \(expandedPath)")
            return nil
        }
        
        guard let decodedString = String(data: storedData, encoding: .utf8) else {
            logWarning("Could not decode \(fileDescription.lowercased()) as UTF-8 at \(expandedPath)")
            return nil
        }
        
        return decodedString
    }
    
    // MARK: - Logging Methods
    
    /// Logs warnings for AWS SDK specification compliance
    /// Uses structured logging with os.Logger, never logs property values or comments for security
    private func logWarning(_ message: String, line: Int? = nil) {
        let lineInfo = line.map { " (line \($0))" } ?? ""
        let fileInfo = currentFileName.isEmpty ? "" : " in \(currentFileName)"
        logger.warning("AWS Config Parser\(fileInfo)\(lineInfo): \(message)")
    }
    
    /// Logs parsing errors with context
    /// Uses structured logging with os.Logger, includes reference to AWS CLI documentation
    private func logError(_ message: String, line: Int? = nil) {
        let lineInfo = line.map { " (line \($0))" } ?? ""
        let fileInfo = currentFileName.isEmpty ? "" : " in \(currentFileName)"
        logger.error("AWS Config Parser\(fileInfo)\(lineInfo): \(message). See AWS CLI documentation for proper file format.")
    }
    
    private func handleParseError(_ error: Error, line: String) {
        logError("Parse error: \(error.localizedDescription)", line: currentLineNumber)
    }
    
    // MARK: - Line Processing Pipeline
    
    /// Main line processing dispatcher - classifies line type and routes to appropriate handler
    /// Determines the type of configuration line and delegates to specialized processors
    /// Examples:
    /// - "# This is a comment" → ignored (blank/comment lines)
    /// - "[profile dev]" → routes to processSectionLine()
    /// - "region = us-east-1" → routes to processPropertyLine()
    /// - "    continuation value" → routes to processMultiLine()
    private func processConfigurationLine(_ line: String, source: String, into dict: inout [String: ConfigFileSection]) throws {
        switch line.classification {
        case .blank, .comment:
            // Ignore blank lines and comments
            return
            
        case .section(let rawString, let header):
            try processSectionLine(rawString: rawString, header: header, source: source, into: &dict)
            
        case .property(let rawString, _, _):
            try processPropertyLine(rawString: rawString, into: &dict)
            
        case .multiLine(let rawString, _):
            try processMultiLine(rawString: rawString, into: &dict)
            
        case .unknown(_):
            throw ParseError("Unknown line")
        }
    }
    
    /// Processes section header lines like "[profile dev]", "[sso-session name]", "[default]"
    /// Validates section format, handles invalid sections, and manages parser state transitions
    private func processSectionLine(rawString: String, header: (name: String, type: FileBasedConfigurationSectionType, isExplicit: Bool)?, source: String, into dict: inout [String: ConfigFileSection]) throws {
        guard rawString.contains("]") else { 
            throw ParseError("Section definition must end with ']'") 
        }
            
        if header?.name == "INVALID_SECTION" {
            handleInvalidSection()
        } else {
            try handleValidSection(header: header!, source: source, into: &dict)
        }
    }
    
    /// Handles invalid section declarations and sets parser to ignore mode
    private func handleInvalidSection() {
        parserState = .ignore
        propertyContext.reset()
        // Case 1: Invalid profile declaration
        logWarning("Profile declaration is invalid and will be ignored", line: currentLineNumber)
    }
    
    /// Handles valid section declarations and manages parser state
    private func handleValidSection(header: (name: String, type: FileBasedConfigurationSectionType, isExplicit: Bool), source: String, into dict: inout [String: ConfigFileSection]) throws {
        let active = handleNewSectionFound(
            name: header.name,
            type: header.type,
            isExplicit: header.isExplicit,
            lineNumber: currentLineNumber,
            source: source,
            targetDictionary: &dict
        )
        
        if active {
            parserState = .active(sectionName: header.name)
        } else {
            parserState = .ignore
        }
    }
    
    /// Processes property lines like "region = us-east-1" or "s3 ="
    /// Validates parser state and delegates to property processing logic
    private func processPropertyLine(rawString: String, into dict: inout [String: ConfigFileSection]) throws {
        guard let currentState = parserState else {
            throw ParseError("Expected a section definition")
        }
                
        switch currentState {
        case .ignore, .invalid:
            return // Skip properties in ignored sections
        case .active(_):
            try processProperty(rawString, into: &dict)
        }
    }
    
    /// Processes multi-line continuation lines like "    additional text"
    /// Validates parser state and delegates to extension processing logic
    private func processMultiLine(rawString: String, into dict: inout [String: ConfigFileSection]) throws {
        guard let currentState = parserState else {
            throw ParseError("Expected a section definition")
        }
                
        if case .ignore = currentState { 
            return // Skip continuations in ignored sections
        }
        
        try processExtension(rawString, into: &dict)
    }
    
    // MARK: - Section Processing
    
    /// Handles creation and management of configuration file sections
    /// Creates new sections or reuses existing ones, manages section precedence
    /// Examples:
    /// - "[profile dev]" → creates/finds section named "dev" of type .profile
    /// - "[sso-session my-session]" → creates/finds section named "my-session" of type .ssoSession
    /// - "[default]" → creates/finds default profile section with special precedence rules
    private func handleNewSectionFound(name sectionName: String,
                                       type sectionType: FileBasedConfigurationSectionType,
                                       isExplicit: Bool,
                                       lineNumber: Int,
                                       source: String,
                                       targetDictionary: inout [String: ConfigFileSection]) -> Bool {
        
        let unifiedKey = fullSectionKey(for: sectionName, type: sectionType)

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
                if self.hasExplicitDefaultInConfig { 
                    // Case 6: [default] profile ignored because [profile default] exists
                    logWarning("Profile [default] ignored because [profile default] is already defined in the same file", line: lineNumber)
                    return false 
                }
                
                self.currentSection = targetDictionary[unifiedKey] ?? ConfigFileSection(name: sectionName)
                targetDictionary[unifiedKey] = self.currentSection
            }
        } else {
            if let existing = targetDictionary[unifiedKey] {
                self.currentSection = existing
            } else {
                let section = ConfigFileSection(name: sectionName)
                targetDictionary[unifiedKey] = section
                self.currentSection = section
            }
        }
        
        currentSectionType = sectionType
        propertyContext.reset()
        return true
    }
    
    private func mergeSectionProperties(configSection: inout ConfigFileSection, credentialSection: ConfigFileSection) {

        for (propKey, credValue) in credentialSection.properties {
            if configSection.properties[propKey] != nil {
                // Case 4: Config property overridden by credentials
                logWarning("Property '\(propKey)' in config file overridden by credentials file")
            }
            configSection.properties[propKey] = credValue
        }
        
        for (subPropKey, credSubProps) in credentialSection.subproperties {
            
            if var existingConfigSubProps = configSection.subproperties[subPropKey] {
                for (innerKey, innerValue) in credSubProps {
                    if existingConfigSubProps[innerKey] != nil {
                        // Case 4: Config sub-property overridden by credentials
                        logWarning("Sub-property '\(innerKey)' in '\(subPropKey)' overridden by credentials file")
                    }
                    existingConfigSubProps[innerKey] = innerValue
                }
                configSection.subproperties[subPropKey] = existingConfigSubProps
            } else {
                configSection.subproperties[subPropKey] = credSubProps
            }
        }
    }
    
    // MARK: - Property Processing
    
    /// Property processing dispatcher - determines property type and routes to appropriate handler
    /// Handles property lines with or without values, indented or not
    /// Examples:
    /// - "region = us-east-1" → routes to handleStandardProperty()
    /// - "    key = value" → routes to handleSubProperty() 
    /// - "s3 =" → routes to handleStandardKeyWithoutValue()
    /// - "    endpoint_url =" → routes to handleSubProptertyKeyWithoutValue()
    private func processProperty(_ rawString: String, into targetDictionary: inout [String: ConfigFileSection]) throws {
        
        let components = rawString.split(separator: "=", maxSplits: 1, omittingEmptySubsequences: false).map(String.init)
        
        // Check if this line is indented (indicating a sub-property)
        let lineIsIndented = isIndented(line: rawString)
        
        // Always strip comments from keys
        let key = stripCommentsAndWhitespace(from: components[0].lowercased())
        
        // Check if the original line had content after the = sign
        let hasValuePart = components.count > 1
        let originalValuePart = hasValuePart ? components[1] : ""
        let cleanedValue = hasValuePart ? stripCommentsAndWhitespace(from: originalValuePart) : ""
        
        guard !key.isEmpty else { throw ParseError("Property did not have a name") }
        
        if lineIsIndented {
            // For indented sub-properties, use the context-aware comment stripping
            // This preserves comments in sub-property values as expected by tests
            let contextAwareValue = hasValuePart ? strippedCommentsAndWhitespace(from: originalValuePart) : ""
            
            try !contextAwareValue.isEmpty
                ? handleSubProperty(key: key, value: contextAwareValue, lineNumber: currentLineNumber, targetDictionary: &targetDictionary)
                : handleSubProptertyKeyWithoutValue(key: key, lineNumber: currentLineNumber, targetDictionary: &targetDictionary)
        } else {
            guard key.rangeOfCharacter(from: .whitespaces) == nil else { 
                // Case 2: Property with invalid characters
                logWarning("Property '\(key)' contains invalid characters and will be ignored", line: currentLineNumber)
                return 
            }
            
            if hasValuePart {
                // Line has "key = something" (even if something becomes empty after comment stripping)
                // This should always create a property, not a subsection
                try handleStandardProperty(key: key, value: cleanedValue, lineNumber: currentLineNumber, targetDictionary: &targetDictionary)
            } else {
                // Line has just "key" with no = sign - create subsection
                try handleStandardKeyWithoutValue(key: key, lineNumber: currentLineNumber, targetDictionary: &targetDictionary)
            }
        }
    }
    
    /// Handles standard (non-indented) properties with values
    /// Creates or updates properties in the current section
    /// Example: "region = us-east-1" → sets section.properties["region"] = "us-east-1"
    private func handleStandardProperty(key: String, value: String, lineNumber: Int, targetDictionary: inout [String: ConfigFileSection]) throws {
        guard let section = currentSection else { 
            throw ParseError("Expected a section definition") 
        }
        
        let fullKey = fullSectionKey(for: section.name, type: currentSectionType)
        
        // Check for duplicate properties (Case 3)
        if let existingValue = currentSection?.properties[key], existingValue != value {
            logWarning("Property '\(key)' redefined in profile, using latest value", line: lineNumber)
        }
        
        // Only reset subsection context if this is a different property
        if propertyContext.name != key {
            propertyContext.resetSubSection()
        }
        
        propertyContext.name = key
        propertyContext.value = value
        currentSection?.properties[key] = value
        targetDictionary[fullKey] = currentSection!
    }
    
    /// Handles standard properties without values (creates subsection placeholder)
    /// Sets up a property as a subsection container for future indented properties
    /// Example: "s3 =" → creates subsection named "s3" for future sub-properties
    private func handleStandardKeyWithoutValue(key: String, lineNumber: Int, targetDictionary: inout [String: ConfigFileSection]) throws {
        guard let section = currentSection else { 
            throw ParseError("Expected a section definition") 
        }
        
        let fullKey = fullSectionKey(for: section.name, type: currentSectionType)
        
        // Reset any previous subsection context and set up new one
        propertyContext.resetSubSection()
        propertyContext.subSectionName = key
        propertyContext.name = key
        propertyContext.value = ""
        
        // Initialize empty subsection if it doesn't exist
        var updatedSection = section
        if updatedSection.subproperties[key] == nil {
            updatedSection.subproperties[key] = [:]
        }
        self.currentSection = updatedSection
        targetDictionary[fullKey] = updatedSection
    }
    
    // MARK: - Sub-Property Processing
    
    /// Handles indented sub-properties with values (nested under a parent property)
    /// Creates or updates sub-properties within a subsection
    /// Example: "    endpoint_url = https://s3.amazonaws.com" → sets subsection["endpoint_url"] = "https://s3.amazonaws.com"
    private func handleSubProperty(key: String, value: String, lineNumber: Int, targetDictionary: inout [String: ConfigFileSection]) throws {
        guard let section = currentSection else {
            throw ParseError("Expected a section definition")
        }

        // If we don't have a subsection name, try to establish one from the current property
        let subName: String
        if let existingSubName = propertyContext.subSectionName {
            subName = existingSubName
        } else if let currentProp = propertyContext.name {
            // Convert the current property to a subsection
            subName = currentProp
            propertyContext.subSectionName = currentProp
            
            // Remove the property and initialize as subsection
            var updatedSection = section
            updatedSection.properties.removeValue(forKey: currentProp)
            if updatedSection.subproperties[currentProp] == nil {
                updatedSection.subproperties[currentProp] = [:]
            }
            self.currentSection = updatedSection
            
            // Persist the subsection conversion immediately
            let fullKey = fullSectionKey(for: updatedSection.name, type: currentSectionType)
            targetDictionary[fullKey] = updatedSection
        } else {
            // If no subsection is established, we can't handle sub-properties
            throw ParseError("Indented property found without a parent property section")
        }

        // Check for invalid characters in sub-property key (Case 2) - after subsection is established
        if key.rangeOfCharacter(from: .whitespaces) != nil {
            logWarning("Sub-property '\(key)' contains invalid characters and will be ignored", line: lineNumber)
            return // Safe to return now - subsection conversion is already persisted
        }

        let fullKey = fullSectionKey(for: section.name, type: currentSectionType)
        var updatedSection = currentSection!
        var subsectionData = updatedSection.subproperties[subName] ?? [:]
        
        // Check for duplicate sub-properties (Case 3)
        if let existingValue = subsectionData[key], existingValue != value {
            logWarning("Sub-property '\(key)' redefined in subsection '\(subName)', using latest value", line: lineNumber)
        }
        
        subsectionData[key] = value
        updatedSection.subproperties[subName] = subsectionData
        self.currentSection = updatedSection
        targetDictionary[fullKey] = updatedSection
    }
    
    /// Handles indented sub-properties without values
    /// Creates empty sub-property entries within a subsection
    /// Ensures subsection conversion is persisted even when invalid sub-properties are ignored
    /// Example: "    retry_mode =" → sets subsection["retry_mode"] = ""
    private func handleSubProptertyKeyWithoutValue(key: String, lineNumber: Int, targetDictionary: inout [String: ConfigFileSection]) throws {
        guard let section = currentSection else {
            throw ParseError("Expected a section definition")
        }

        // If we don't have a subsection name, try to establish one from the current property
        let currentSubSectionName: String
        if let existingSubName = propertyContext.subSectionName {
            currentSubSectionName = existingSubName
        } else if let currentProp = propertyContext.name {
            // Convert the current property to a subsection
            currentSubSectionName = currentProp
            propertyContext.subSectionName = currentProp
            
            // Remove the property and initialize as subsection
            var updatedSection = section
            updatedSection.properties.removeValue(forKey: currentProp)
            if updatedSection.subproperties[currentProp] == nil {
                updatedSection.subproperties[currentProp] = [:]
            }
            self.currentSection = updatedSection
            
            // Persist the subsection conversion immediately
            let fullKey = fullSectionKey(for: updatedSection.name, type: currentSectionType)
            targetDictionary[fullKey] = updatedSection
        } else {
            throw ParseError("Property did not have a name in sub-property")
        }
        
        // Check for invalid characters in sub-property key (Case 2) - after subsection is established
        // CRITICAL: This check happens AFTER subsection conversion is persisted above
        // This ensures that even if the sub-property is ignored due to invalid characters,
        // the parent property is still converted to an empty subsection as expected
        if key.rangeOfCharacter(from: .whitespaces) != nil {
            logWarning("Sub-property '\(key)' contains invalid characters and will be ignored", line: lineNumber)
            return // Safe to return now - subsection conversion is already persisted
        }
        
        let fullKey = fullSectionKey(for: section.name, type: currentSectionType)
        
        var updatedSection = currentSection!
        var subpropertyKeysAndValues = updatedSection.subproperties[currentSubSectionName] ?? [:]
        subpropertyKeysAndValues[key] = ""
        updatedSection.subproperties[currentSubSectionName] = subpropertyKeysAndValues
        self.currentSection = updatedSection
        targetDictionary[fullKey] = updatedSection
    }
    
    // MARK: - Multi-line Processing
    
    /// Multi-line extension processing dispatcher - handles continuation of property values
    /// Handles indented lines that extend the previous property's value
    /// Examples:
    /// - "    additional text" → extends previous property value
    /// - "	more content" → extends previous property value (tab-indented)
    private func processExtension(_ rawString: String, into targetDictionary: inout [String: ConfigFileSection]) throws {
        guard let currentPropKey = propertyContext.name, propertyContext.hasValue else {
            if isIndented(line: rawString) {
                throw ParseError("Expected a property definition, found indented continuation")
            } else {
                throw ParseError("Expected a property definition")
            }
        }
        
        guard propertyContext.hasValue else {
            throw ParseError("Expected an '=' sign defining a property in sub-property")
        }
        
        try handleLineExtension(forKey: currentPropKey, value: rawString, targetDictionary: &targetDictionary)
    }
    
    /// Handles multi-line property value extensions
    /// Appends continuation text to existing property values with newline separation
    /// Examples:
    /// - Property "description = First line" + "    Second line" → "First line\nSecond line"
    /// - Sub-property extension works similarly within subsections
    private func handleLineExtension(forKey key: String, value: String, targetDictionary: inout [String: ConfigFileSection]) throws {
        guard let section = currentSection else {
            throw ParseError("No current section for continuation")
        }
        
        let fullKey = fullSectionKey(for: section.name, type: currentSectionType)
        let lineExtension = self.strippedCommentsAndWhitespace(from: value)
        
        var updatedSection = section
        if propertyContext.isInSubSection, let subSectionName = propertyContext.subSectionName {
            var subProps = updatedSection.subproperties[subSectionName] ?? [:]
            let existingValue = subProps[key] ?? ""
            subProps[key] = existingValue.isEmpty ? lineExtension : existingValue + "\n" + lineExtension
            updatedSection.subproperties[subSectionName] = subProps
        } else {
            let existingValue = updatedSection.properties[key] ?? ""
            updatedSection.properties[key] = existingValue.isEmpty ? lineExtension : existingValue + "\n" + lineExtension
        }
        self.currentSection = updatedSection
        targetDictionary[fullKey] = updatedSection
    }
    
    // MARK: - Utility Methods
    
    /// Computes the full section key from current section and type
    private func fullSectionKey(for sectionName: String, type: FileBasedConfigurationSectionType) -> String {
        let typePrefix: String = switch type {
            case .profile: "profile"
            case .ssoSession: "sso-session"
            case .services: "services"
        }
        return (sectionName == "default") ? "profile default" : "\(typePrefix) \(sectionName)"
    }
    
    /// Simple check for indentation
    private func isIndented(line: String) -> Bool {
        return line.hasPrefix(" ") || line.hasPrefix("\t")
    }
    
    /// Strips comments and whitespace with context-aware logic
    /// Used for continuation lines where we need to preserve comments in indented content
    private func strippedCommentsAndWhitespace(from rawString: String) -> String {
        var cleanString = rawString.trimmingCharacters(in: .whitespacesAndNewlines)
        let isIndented = rawString.hasPrefix(" ") || rawString.hasPrefix("\t")
        
        // Strip comments from non-indented lines (section headers, property definitions)
        // Don't strip from indented lines (could be part of multi-line values)
        if !isIndented {
            let pattern = FormatConstants.safeCommentPattern
            if let range = cleanString.range(of: pattern, options: .regularExpression) {
                cleanString = String(cleanString[..<range.lowerBound])
            }
        }
        
        return cleanString.trimmingCharacters(in: .whitespaces)
    }
    
    /// Strips comments and whitespace - always strips comments from property components
    private func stripCommentsAndWhitespace(from rawString: String) -> String {
        var cleanString = rawString.trimmingCharacters(in: .whitespacesAndNewlines)
        
        // Always strip comments from property keys and values
        let pattern = FormatConstants.safeCommentPattern
        if let range = cleanString.range(of: pattern, options: .regularExpression) {
            cleanString = String(cleanString[..<range.lowerBound])
        }
        
        return cleanString.trimmingCharacters(in: .whitespaces)
    }
    
    // MARK: - Static Methods
    
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
}

// MARK: - Extensions

@_spi(FileBasedConfig)
public extension ConfigFileReader {
    static func makeAsync(configFilePath: String?, credentialsFilePath: String?) async throws -> FileBasedConfiguration? {
        try await ConfigFileReader(configFilePath, credentialsFilePath)?.config()
    }
}

extension String {
    /// Classifies a configuration file line into its appropriate type
    /// 
    /// Line Type Examples:
    /// - .blank: "", "   ", "\t"
    /// - .comment: "# This is a comment", "; Also a comment"
    /// - .section: "[profile dev]", "[sso-session name]", "[default]"
    /// - .property: "region = us-east-1", "key=value", "empty_key="
    /// - .multiLine: "    continuation text", "\tmore text"
    /// - .unknown: any line that doesn't match above patterns
    var classification: lineType {
        let pattern = #"^\s*$"#
        let blankLine = try! NSRegularExpression(pattern: pattern)
        let range = NSRange(self.startIndex..., in: self)
        
        if self.isEmpty || blankLine.firstMatch(in: self, options: [], range: range) != nil {
            return .blank
        }
        
        // Check for comments (including those with leading whitespace)
        let trimmedLine = self.trimmingCharacters(in: .whitespacesAndNewlines)
        if trimmedLine.hasPrefix("#") || trimmedLine.hasPrefix(";") {
            return .comment
        }
                
        if self.hasPrefix("[") {
            let invalidSec = "INVALID_SECTION"
            if let header = ConfigFileReader.parseSectionHeader(from: self) {
                return .section(rawString: self, header: (name: header.name, type: header.type, isExplicit: header.isExplicit))
            } else {
                return .section(rawString: self, header: (name: invalidSec, type: .profile, isExplicit: false))
            }
        }
                
        if self.contains("=") {
            return .property(rawString: self, key: "", value: "")
        }
                        
        if self.hasPrefix(" ") || self.hasPrefix("\t") {
            return .multiLine(rawString: self, value: self)
        }
        
        return .unknown(rawString: self)
    }
}

// MARK: - Configuration Data Structures

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

        // First try the exact type match
        if let section = sections[fullKey] {
            return section
        }
        
        // If no exact match and we're looking for a profile, try other section types
        // This allows the default section(for: name) method to find any section type
        if type == .profile {
            // Try sso-session
            if let ssoSection = sections["sso-session \(name)"] {
                return ssoSection
            }
            // Try services
            if let servicesSection = sections["services \(name)"] {
                return servicesSection
            }
        }
        
        return nil
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