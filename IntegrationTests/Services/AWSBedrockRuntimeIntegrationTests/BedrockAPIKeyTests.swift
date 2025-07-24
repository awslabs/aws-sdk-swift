//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import XCTest
import AWSBedrockRuntime

final class BedrockAPIKeyIntegrationTests: XCTestCase {
    let region = "us-west-2"
    let envVarName = "AWS_BEARER_TOKEN_BEDROCK"

    func test_apiKey_createsAPIKeyAndCallsWithIt() async throws {
        let generator = BedrockAPIKeyGenerator(region: region, duration: 600.0)
        let token = try await generator.generate()
        setenv(envVarName, token, 1)
        defer { unsetenv(envVarName) }
        let config = try await BedrockRuntimeClient.Config(region: region)
        let client = BedrockRuntimeClient(config: config)
        let input = ListAsyncInvokesInput()
        let output = try await client.listAsyncInvokes(input: input)
    }
}
