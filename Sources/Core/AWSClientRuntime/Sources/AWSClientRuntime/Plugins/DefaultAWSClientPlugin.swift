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

    public func configureClient(clientConfiguration: Config) async throws -> Config {
        var copy = clientConfiguration
        copy.retryStrategyOptions = try AWSClientConfigDefaultsProvider.retryStrategyOptions(
            copy.awsRetryMode,
            copy.maxAttempts
        )
        copy.awsCredentialIdentityResolver = try AWSClientConfigDefaultsProvider.awsCredentialIdentityResolver()
        return copy
    }
}
