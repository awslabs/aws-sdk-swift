//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import ClientRuntime

public class DefaultAWSClientPlugin: Plugin {
    private var clientName: String
    private var sdkID: String?

    public init(clientName: String, sdkID: String? = nil) {
        self.clientName = clientName
        self.sdkID = sdkID
    }

    public func configureClient<Config: ClientConfiguration>(clientConfiguration: inout Config) async throws {
        guard var config = clientConfiguration as? (DefaultClientConfiguration
            & AWSDefaultClientConfiguration
            & AWSRegionClientConfiguration) else { return }
        config.retryStrategyOptions = try AWSClientConfigDefaultsProvider.retryStrategyOptions(
            config.awsRetryMode,
            config.maxAttempts,
            sdkID: sdkID
        )

        guard let modifiedConfig = config as? Config else { return }
        clientConfiguration = modifiedConfig
    }
}
