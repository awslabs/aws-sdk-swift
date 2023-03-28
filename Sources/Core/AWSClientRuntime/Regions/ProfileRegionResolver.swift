//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//
import AwsCommonRuntimeKit
import ClientRuntime

public struct ProfileRegionProvider: RegionProvider {
    let logger: SwiftLogger
    let fileBasedConfigurationProvider: FileBasedConfigurationProviding
    let profileName: String
    let configFilePath: String?
    let credentialsFilePath: String?

    init(
        fileBasedConfigurationProvider: FileBasedConfigurationProviding,
        profileName: String,
        configFilePath: String? = nil,
        credentialsFilePath: String? = nil
    ) {
        self.logger = SwiftLogger(label: "ProfileRegionResolver")
        self.fileBasedConfigurationProvider = fileBasedConfigurationProvider
        self.profileName = profileName
        self.configFilePath = configFilePath
        self.credentialsFilePath = credentialsFilePath
    }

    public func resolveRegion() async throws -> String? {
        guard let configuration = try await fileBasedConfigurationProvider.fileBasedConfiguration(
            configFilePath: configFilePath,
            credentialsFilePath: credentialsFilePath
        ) else {
            logger.debug("Failed to resolve region from configuration file. No configuration file found.")
            return nil
        }
        
        guard let profile = configuration.section(for: profileName) else {
            logger.debug("Failed to resolve region from configuration file. No profile with name: \(profileName)")
            return nil
        }
        
        return profile.string(for: .region)
    }
}
