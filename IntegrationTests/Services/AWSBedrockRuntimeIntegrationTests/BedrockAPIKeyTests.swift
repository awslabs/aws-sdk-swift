//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import XCTest
import AWSIntegrationTestUtils
import AWSBedrockRuntime

final class BedrockAPIKeyIntegrationTests: XCTestCase {
    let region = "us-west-2"
    let envVarName = "AWS_BEARER_TOKEN_BEDROCK"
    let apiKeyDuration: TimeInterval = 600.0

    func test_apiKey_createsAPIKeyAndCallsWithIt() async throws {
        // Set a Bedrock API token into the environment.
        let generator = BedrockAPIKeyGenerator(region: region, duration: apiKeyDuration)
        let token = try await generator.generate()
        setenv(envVarName, token, 1)
        defer { unsetenv(envVarName) }

        // Make a BedrockRuntime client.  Add an interceptor that will fail the test
        // if the bearer token was not used.
        let config = try await BedrockRuntimeClient.Config(
            region: region,
            httpInterceptorProviders: [BearerTokenWasUsedInterceptorProvider()]
        )
        let client = BedrockRuntimeClient(config: config)

        // Perform the Bedrock operation.  Successful operation with no XCTFails
        // triggered in the `BearerTokenWasUsedInterceptor` passes the test.
        _ = try await client.listAsyncInvokes(input: ListAsyncInvokesInput())
    }
}
