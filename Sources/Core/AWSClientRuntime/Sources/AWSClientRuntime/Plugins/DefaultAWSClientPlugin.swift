//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import protocol ClientRuntime.DefaultClientConfiguration
import protocol ClientRuntime.Plugin

public class DefaultAWSClientPlugin<Config: DefaultClientConfiguration & AWSDefaultClientConfiguration & AWSRegionClientConfiguration>: Plugin {
    private var clientName: String

    public init(clientName: String) {
        self.clientName = clientName
    }

    public func configureClient(clientConfiguration: inout Config) async throws {
        clientConfiguration.retryStrategyOptions = try AWSClientConfigDefaultsProvider.retryStrategyOptions(
            clientConfiguration.awsRetryMode,
            clientConfiguration.maxAttempts
        )
        clientConfiguration.awsCredentialIdentityResolver = try AWSClientConfigDefaultsProvider.awsCredentialIdentityResolver()
    }
}
