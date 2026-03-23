//
//  ConfigFileModels.swift
//  aws-sdk-swift
//
//

@_spi(FileBasedConfig) import AWSSDKCommon
import Foundation

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
