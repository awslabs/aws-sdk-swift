//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import AwsCommonRuntimeKit

@_spi(Internal)
public typealias CRTFiledBasedConfigurationStore = FileBasedConfigurationStore<CRTFileBasedConfiguration>

@_spi(Internal)
public extension CRTFiledBasedConfigurationStore {
    init() throws {
        let cache = CRTFiledBasedConfigurationStore.Cache.init { sources in
            let task = Task {
                try CRTFileBasedConfiguration(
                    configFilePath: sources.configPath,
                    credentialsFilePath: sources.credentialPath
                )
            }

            return try await task.value
        }

        self.init(
            cache: cache,
            defaultConfigFilePath: try CRTFileBasedConfiguration.resolveConfigPath(sourceType: .config),
            defaultCredentialsFilePath: try CRTFileBasedConfiguration.resolveConfigPath(sourceType: .credentials)
        )
    }
}
