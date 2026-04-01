//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import Foundation

class ConfigFileParser {
    private var sections: [String: [String: String]] = [:]
    private var currentSection: String?
    private var currentProperty: String?

    func parse(_ content: String) throws -> [String: [String: String]] {
        for line in content.split(whereSeparator: \.isNewline) {
            let lineString = String(line)
            switch lineString.classification {
            case .blank, .comment:    continue
            case .section(let raw, _): try readSectionLine(raw)
            case .property(let raw, _, _): try readPropertyLine(raw)
            case .multiLine(let raw, _): try readContinuationLine(raw)
            case .unknown:
                guard currentSection != nil else { throw ParserError.noSectionDefined }
                    throw ParserError.missingEqualsSign
            }
        }
        return sections
    }
    
    enum ParserError: Error, LocalizedError {
        case noSectionDefined
        case noPropertyDefined
        case emptyPropertyKey
        case missingEqualsSign
        case missingEqualsSignInSubProperty
        case sectionMissingClosingBracket
        case emptySubPropertyKey

        var errorDescription: String? {
            switch self {
            case .noSectionDefined: return "Expected a section definition"
            case .noPropertyDefined: return "Expected a property definition, found continuation"
            case .emptyPropertyKey: return "Property did not have a name"
            case .missingEqualsSign: return "Expected an '=' sign defining a property"
            case .missingEqualsSignInSubProperty: return "Expected an '=' sign defining a property in sub-property"
            case .sectionMissingClosingBracket: return "Section definition must end with ']'"
            case .emptySubPropertyKey: return "Property did not have a name in sub-property"
            }
        }
    }


    private func readSectionLine(_ line: String) throws {
        // Strip trailing comments (section headers allow # or ; without space)
        var clean = line
        if let range = clean.range(of: #"\s*[#;].*$"#, options: .regularExpression) {
            clean = String(clean[..<range.lowerBound])
        }
        clean = clean.trimmingCharacters(in: .whitespaces)
        guard clean.hasSuffix("]") else {throw ParserError.sectionMissingClosingBracket}
        // Remove brackets
        let inner = String(clean.dropFirst().dropLast()).trimmingCharacters(in: .whitespaces)
        currentSection = inner
        currentProperty = nil
        if sections[inner] == nil { sections[inner] = [:] }
    }

    private func readPropertyLine(_ line: String) throws {
        guard let section = currentSection else { throw ParserError.noSectionDefined }
        // Property comments require whitespace before # or ;
        var clean = line
        for pattern in [" #", " ;", "\t#", "\t;"] {
            if let idx = clean.range(of: pattern) {
                clean = String(clean[..<idx.lowerBound])
            }
        }
        clean = clean.trimmingCharacters(in: .whitespaces)
        guard let eqIdx = clean.firstIndex(of: "=") else { throw ParserError.missingEqualsSign }
        let key = String(clean[..<eqIdx]).trimmingCharacters(in: .whitespaces).lowercased()
        guard !key.isEmpty else { throw ParserError.emptyPropertyKey }
        
        let value = String(clean[clean.index(after: eqIdx)...]).trimmingCharacters(in: .whitespaces)
        currentProperty = key
        sections[section]?[key] = value
    }

    private func readContinuationLine(_ line: String) throws {
        guard currentSection != nil else {throw ParserError.noSectionDefined}
        guard let prop = currentProperty else { throw ParserError.noPropertyDefined }
        // No comment stripping on continuation lines — they're part of the value
        let trimmed = line.trimmingCharacters(in: .whitespaces)
        let existing = sections[currentSection!]?[prop] ?? ""
        
        if existing.isEmpty || existing.hasPrefix("\n") {
            // This is a sub-property line — validate it has a non-empty key
            guard trimmed.contains("=") else { throw ParserError.missingEqualsSignInSubProperty }
            let eqIdx = trimmed.firstIndex(of: "=")!
            let subKey = String(trimmed[..<eqIdx]).trimmingCharacters(in: .whitespaces)
            guard !subKey.isEmpty else { throw ParserError.emptySubPropertyKey }  // new case needed
            sections[currentSection!]?[prop] = existing + "\n" + trimmed
            return
        }
        
        // If the parent property has no value (subsection placeholder),
        // continuation lines must be "key = value" sub-properties
        if existing.isEmpty && !trimmed.contains("=") {
            throw ParserError.missingEqualsSignInSubProperty
        }
        sections[currentSection!]?[prop] = existing.isEmpty ? "\n" + trimmed : existing + "\n" + trimmed
    }
}
