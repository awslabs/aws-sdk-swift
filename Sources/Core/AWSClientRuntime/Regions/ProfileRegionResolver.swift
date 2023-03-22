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
    let store: FileBasedConfiguration.Store
    let sources: FileBasedConfiguration.Sources
    let profileName: String

    init(
        sources: FileBasedConfiguration.Sources,
        profileName: String,
        store: FileBasedConfiguration.Store
    ) {
        self.logger = SwiftLogger(label: "ProfileRegionResolver")
        self.sources = sources
        self.profileName = profileName
        self.store = store
    }

    public func resolveRegion() async throws -> String? {
        guard let configuration = try await store.configuration(for: sources) else {
            logger.debug("No configuration files found at \(sources.configPath) or \(sources.credentialPath)")
            return nil
        }
        
        guard let profile = configuration.section(for: profileName) else {
            logger.debug("Profile with name: \(profileName) doesn not exist in configuration files at \(sources.configPath) or \(sources.credentialPath)")
            return nil
        }
        
        return profile.value(for: .region)
    }
}
