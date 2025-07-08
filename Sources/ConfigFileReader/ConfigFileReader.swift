//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

@_spi(FileBasedConfig) import AWSSDKCommon

public struct ConfigFileReader {
    public let configFilePath: String
    public let credentialsFilePath: String

    public init?(_ configFilePath: String?, _ credentialsFilePath: String?) async throws {

        // You will likely have to modify this code.
        self.configFilePath = configFilePath ?? ""
        self.credentialsFilePath = credentialsFilePath ?? ""
    }

    func config() -> FileBasedConfigurationSectionProviding? {
        // Replace this function body with code that works.
        return nil
    }
}

@_spi(FileBasedConfig)
public extension ConfigFileReader {

    static func makeAsync(configFilePath: String?, credentialsFilePath: String?) async throws -> FileBasedConfiguration? {
        try await ConfigFileReader(configFilePath, credentialsFilePath)?.config()
    }
}

struct ConfigFile: FileBasedConfiguration {

    func section(for name: String, type: FileBasedConfigurationSectionType) -> (any FileBasedConfigurationSection)? {
        // Replace this function body with code that works.
        return nil
    }
}

struct ConfigFileSection: FileBasedConfigurationSection {

    func property(for name: FileBasedConfigurationKey) -> FileBasedConfigurationProperty? {
        // Replace this function body with code that works.
        return nil
    }
}
