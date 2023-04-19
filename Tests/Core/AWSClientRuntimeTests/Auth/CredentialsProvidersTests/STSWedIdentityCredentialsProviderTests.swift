//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import ClientRuntime
import Foundation
import XCTest

@_spi(FileBasedConfig) @testable import AWSClientRuntime

class STSWebIdentityCredentialsProviderTests: XCTestCase {
    func testInit() async {
        // For now we'll lean on CRT to test the implementation of this provider
        // so just assert that we created the provider without crashing.
        // Note: The underlying CRT provider throws an error if the role is invalid,
        // so we'll assert that is the case here since mocking out a valid STS Web Identity is out scope for now.
        // TODO: Add an integration test for this provider
        do {
            _ = try await STSWebIdentityCredentialsProvider()
            XCTFail("The above should throw an error.")
        } catch {
            
        }
    }
}
