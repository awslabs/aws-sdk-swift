//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

@_spi(Internal) public typealias FileBasedConfiguration = FileBasedConfigurationSectionProviding
@_spi(Internal) public typealias FileBasedConfigurationSection = FileBasedConfigurationPropertyProviding
@_spi(Internal) public typealias FileBasedConfigurationSubsection = FileBasedConfigurationValueProviding

@_spi(Internal)
public enum FileBasedConfigurationSectionType {
    case profile
    case ssoSession
}

@_spi(Internal)
public struct FileBasedConfigurationSources: Hashable {
    let configPath: String
    let credentialPath: String
}

@_spi(Internal)
public protocol FileBasedConfigurationProviding {
    func fileBasedConfiguration(configFilePath: String?, credentialsFilePath: String?) async throws
        -> FileBasedConfigurationSectionProviding?
}

@_spi(Internal)
public enum FileBasedConfigurationProperty {
    case string(String)
    case subsection(FileBasedConfigurationSubsection)
}

@_spi(Internal)
public protocol FileBasedConfigurationSectionProviding {
    func section(for name: String, type: FileBasedConfigurationSectionType) -> FileBasedConfigurationSection?
}

@_spi(Internal)
public extension FileBasedConfigurationSectionProviding {
    func section(for name: String) -> FileBasedConfigurationSection? {
        section(for: name, type: .profile)
    }
}

@_spi(Internal)
public protocol FileBasedConfigurationPropertyProviding {
    func property(for name: FileBasedConfigurationKey) -> FileBasedConfigurationProperty?
}

@_spi(Internal)
public protocol FileBasedConfigurationValueProviding {
    func value(for name: FileBasedConfigurationKey) -> String?
}

@_spi(Internal)
public extension FileBasedConfigurationPropertyProviding {
    func string(for name: FileBasedConfigurationKey) -> String? {
        guard let value = property(for: name) else { return nil }
        switch value {
        case let .string(string):
            return string
        case .subsection:
            return nil
        }
    }

    func subproperties(for name: FileBasedConfigurationKey) -> FileBasedConfigurationSubsection? {
        guard let value = property(for: name) else { return nil }
        switch value {
        case .string:
            return nil
        case let .subsection(subsection):
            return subsection
        }
    }
}
