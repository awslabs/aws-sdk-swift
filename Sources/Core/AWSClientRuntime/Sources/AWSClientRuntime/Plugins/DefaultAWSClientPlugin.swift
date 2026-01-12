//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import ClientRuntime

public class DefaultAWSClientPlugin: Plugin {
    private var clientName: String

    public init(clientName: String) {
        self.clientName = clientName
    }

    public func configureClient(clientConfiguration: inout ClientConfiguration) async throws {
        if var config = clientConfiguration as? (DefaultClientConfiguration
            & AWSDefaultClientConfiguration
            & AWSRegionClientConfiguration) {
            config.retryStrategyOptions = try AWSClientConfigDefaultsProvider.retryStrategyOptions(
                config.awsRetryMode,
                config.maxAttempts
            )
            clientConfiguration = config as! ClientConfiguration
        }
    }
}
