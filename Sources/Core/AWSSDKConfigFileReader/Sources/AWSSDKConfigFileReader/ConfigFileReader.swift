//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import Foundation
@_spi(FileBasedConfig) import AWSSDKCommon
#if canImport(os)
import os.log
#endif

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
    
    // Logging
    #if canImport(os) && os(macOS)
    @available(macOS 11.0, *)
    private lazy var logger = Logger(subsystem: "com.amazonaws.awssdk", category: "ConfigFileReader")
    #endif
    private let logSubsystem = "com.amazonaws.awssdk.ConfigFileReader"
    private var currentFileName: String = ""
    
    // MARK: - Nested Types
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

        let configRaw = try ConfigFileParser().parse(configData)
        let credsRaw = try credsData.map { try ConfigFileParser().parse($0) } ?? [:]

        let (configProfiles, configSsoSessions, configServices) = ConfigFileStandardizer(configRaw, .config).standardize()
        let (credsProfiles, _, _) = ConfigFileStandardizer(credsRaw, .credentials).standardize()

        // Credentials override config for profiles
        var finalProfiles = configProfiles
        for (key, credSec) in credsProfiles {
            if var existing = finalProfiles[key] {
                mergeSectionProperties(configSection: &existing, credentialSection: credSec)
                finalProfiles[key] = existing
            } else {
                finalProfiles[key] = credSec
            }
        }

        // Merge all section types into one flat dictionary using full keys
        var allSections: [String: ConfigFileSection] = [:]
        for (name, section) in finalProfiles {
            let key = name == "default" ? "profile default" : "profile \(name)"
            allSections[key] = section
        }
        for (name, section) in configSsoSessions {
            allSections["sso-session \(name)"] = section
        }
        for (name, section) in configServices {
            allSections["services \(name)"] = section
        }

        return ConfigFile(sections: allSections)
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
    /// Uses os.Logger on macOS 11+ for structured logging, falls back to NSLog for older versions
    /// Never logs property values or comments for security
    private func logWarning(_ message: String, line: Int? = nil) {
        let lineInfo = line.map { " (line \($0))" } ?? ""
        let fileInfo = currentFileName.isEmpty ? "" : " in \(currentFileName)"
        
        #if canImport(os) && os(macOS)
        if #available(macOS 11.0, *) {
            logger.warning("AWS Config Parser\(fileInfo)\(lineInfo): \(message)")
            return
        }
        #endif
        
        // Fallback for older macOS versions
        NSLog("[%@] WARNING: AWS Config Parser%@%@: %@", logSubsystem, fileInfo, lineInfo, message)
    }
    
    /// Logs parsing errors with context
    /// Uses os.Logger on macOS 11+ for structured logging, falls back to NSLog for older versions
    /// Includes reference to AWS CLI documentation
    private func logError(_ message: String, line: Int? = nil) {
        let lineInfo = line.map { " (line \($0))" } ?? ""
        let fileInfo = currentFileName.isEmpty ? "" : " in \(currentFileName)"
        
        #if canImport(os) && os(macOS)
        if #available(macOS 11.0, *) {
            logger.error("AWS Config Parser\(fileInfo)\(lineInfo): \(message). See AWS CLI documentation for proper file format.")
            return
        }
        #endif
        
        // Fallback for older macOS versions
        NSLog("[%@] ERROR: AWS Config Parser%@%@: %@. See AWS CLI documentation for proper file format.", logSubsystem, fileInfo, lineInfo, message)
    }
    
    private func handleParseError(_ error: Error, line: String) {
        logError("Parse error: \(error.localizedDescription)")
    }
    
    // MARK: - Section Processing
    
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
                
        if self.hasPrefix(" ") || self.hasPrefix("\t") {
            return .multiLine(rawString: self, value: self)
        }

        if self.contains("=") {
            return .property(rawString: self, key: "", value: "")
        }
        
        return .unknown(rawString: self)
    }
}
