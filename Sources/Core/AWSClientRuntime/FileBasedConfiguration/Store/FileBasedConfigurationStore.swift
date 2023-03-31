//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import Foundation

@_spi(Internal)
public struct FileBasedConfigurationStore<T: FileBasedConfiguration> {
    typealias Cache = FunctionCache<FileBasedConfigurationSources, T>
    private let cache: Cache
    
    public let defaultConfigFilePath: String
    
    public let defaultCredentialsFilePath: String
    
    init(
        cache: Cache,
        defaultConfigFilePath: String,
        defaultCredentialsFilePath: String
    ) {
        self.cache = cache
        self.defaultConfigFilePath = defaultConfigFilePath
        self.defaultCredentialsFilePath = defaultCredentialsFilePath
    }
    
    public func _fileBasedConfiguration(
        configFilePath: String? = nil,
        credentialsFilePath: String? = nil
    ) async throws -> T {
        let sources = FileBasedConfigurationSources(
            configPath: configFilePath ?? defaultConfigFilePath,
            credentialPath: credentialsFilePath ?? defaultCredentialsFilePath
        )
        return try await cache.output(for: sources)
    }
}

@_spi(Internal)
extension FileBasedConfigurationStore: FileBasedConfigurationProviding {
    public func fileBasedConfiguration(configFilePath: String?, credentialsFilePath: String?) async throws -> FileBasedConfiguration? {
        try await _fileBasedConfiguration(configFilePath: configFilePath, credentialsFilePath: credentialsFilePath)
    }
}
