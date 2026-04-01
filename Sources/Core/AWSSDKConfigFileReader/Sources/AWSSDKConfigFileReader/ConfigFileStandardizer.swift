//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

@_spi(FileBasedConfig) import AWSSDKCommon
import Foundation

class ConfigFileStandardizer {
    enum FileType { case config, credentials }

    private let rawFile: [String: [String: String]]
    private let fileType: FileType
    private var defaultProfileHasProfilePrefix = false

    init(_ rawFile: [String: [String: String]], _ fileType: FileType) {
        self.rawFile = rawFile
        self.fileType = fileType
    }

    func standardize() -> (profiles: [String: ConfigFileSection], ssoSessions: [String: ConfigFileSection], services: [String: ConfigFileSection]) {
        var profiles: [String: ConfigFileSection] = [:]
        var ssoSessions: [String: ConfigFileSection] = [:]
        var services: [String: ConfigFileSection] = [:]

        for (rawSectionName, rawProperties) in rawFile {
            let hasProfilePrefix = rawSectionName.hasPrefix("profile ") || rawSectionName.hasPrefix("profile\t")
            let hasSsoPrefix = rawSectionName.hasPrefix("sso-session ") || rawSectionName.hasPrefix("sso-session\t")
            let hasServicesPrefix = rawSectionName.hasPrefix("services ") ||
                rawSectionName.hasPrefix("services\t")

            var profileName: String? = nil
            var ssoSessionName: String? = nil
            var servicesName: String? = nil

            if fileType == .config {
                if hasProfilePrefix {
                    profileName = String(rawSectionName.dropFirst("profile".count)).trimmingCharacters(in: .whitespaces)
                } else if hasSsoPrefix {
                    ssoSessionName = String(rawSectionName.dropFirst("sso-session".count)).trimmingCharacters(in: .whitespaces)
                } else if hasServicesPrefix {
                    servicesName = String(rawSectionName.dropFirst("services".count)).trimmingCharacters(in: .whitespaces)
                } else if rawSectionName == "default" {
                    profileName = "default"
                } else {
                    // Ignore sections without a valid prefix in config files
                    continue
                }
            } else {
                // Credentials file: SSO sessions and services are not valid here
                if hasSsoPrefix || hasServicesPrefix {
                    continue
                }
                profileName = rawSectionName
            }

            // Validate identifier
            if let name = profileName, !isValidIdentifier(name) {
                continue
            }
            if let name = ssoSessionName, !isValidIdentifier(name) {
                continue
            }
            if let name = servicesName, !isValidIdentifier(name) {
                continue
            }

            // Handle [profile default] vs [default] precedence
            if fileType == .config, let name = profileName, name == "default" {
                let alreadySeen = profiles[name] != nil
                if alreadySeen {
                    if !hasProfilePrefix && defaultProfileHasProfilePrefix {
                        // [default] loses to already-seen [profile default]
                        continue
                    } else if hasProfilePrefix && !defaultProfileHasProfilePrefix {
                        // [profile default] wins — drop the earlier [default]
                        profiles.removeValue(forKey: name)
                    }
                }
                if hasProfilePrefix {
                    defaultProfileHasProfilePrefix = true
                }
            }

            if let name = profileName {
                if profiles[name] == nil {
                    profiles[name] = ConfigFileSection(name: name)
                }
                let standardized = standardizeProperties(rawProperties)
                for (k, v) in standardized.properties {
                    profiles[name]!.properties[k] = v
                }
                for (k, v) in standardized.subproperties {
                    profiles[name]!.subproperties[k] = v
                }
            } else if let name = ssoSessionName {
                if ssoSessions[name] == nil {
                    ssoSessions[name] = ConfigFileSection(name: name)
                }
                let standardized = standardizeProperties(rawProperties)
                for (k, v) in standardized.properties {
                    ssoSessions[name]!.properties[k] = v
                }
                for (k, v) in standardized.subproperties {
                    ssoSessions[name]!.subproperties[k] = v
                }
            } else if let name = servicesName {
                if services[name] == nil {
                    services[name] = ConfigFileSection(name: name)
                }
                let standardized = standardizeProperties(rawProperties)
                for (k, v) in standardized.properties {
                    services[name]!.properties[k] = v
                }
                for (k, v) in standardized.subproperties {
                    services[name]!.subproperties[k] = v
                }
            }
        }

        return (profiles: profiles, ssoSessions: ssoSessions, services: services)
    }

    // MARK: - Helpers

    /// Validates that a section or property name is alphanumeric with dashes/underscores
    private func isValidIdentifier(_ name: String) -> Bool {
        guard !name.isEmpty else { return false }
        let allowed = CharacterSet.alphanumerics.union(CharacterSet(charactersIn: "-_/.%@:+"))
        return name.unicodeScalars.allSatisfy { allowed.contains($0) }
    }

    /// Converts flat [String: String] properties into a ConfigFileSection's properties and subproperties.
    /// Multi-line values (containing \n) are treated as sub-property blocks:
    ///   "s3" -> "\nendpoint_url = https://...\nregion = us-east-1"
    ///   becomes subproperties["s3"] = ["endpoint_url": "https://...", "region": "us-east-1"]
    private func standardizeProperties(_ raw: [String: String]) -> ConfigFileSection {
        var section = ConfigFileSection(name: "")
        for (key, value) in raw {
            if !isValidIdentifier(key) { continue }
            if value.hasPrefix("\n") {
                // Parse sub-properties from multi-line value
                var subProps: [String: String] = [:]
                for subLine in value.split(separator: "\n", omittingEmptySubsequences: true) {
                    let subStr = String(subLine).trimmingCharacters(in: .whitespaces)
                    guard let eqIdx = subStr.firstIndex(of: "=") else { continue }
                    let subKey = String(subStr[..<eqIdx]).trimmingCharacters(in: .whitespaces)
                    let subVal = String(subStr[subStr.index(after: eqIdx)...]).trimmingCharacters(in: .whitespaces)
                    if isValidIdentifier(subKey) {
                        subProps[subKey] = subVal
                    }
                }
                section.subproperties[key] = subProps
            } else {
                section.properties[key] = value
            }
        }
        return section
    }
}
