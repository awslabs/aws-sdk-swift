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

class CustomCredentialsProviderTests: XCTestCase {
    func testGetCredentials() async throws {
        let mockProvider = MockCredentialsProvider()
        let subject = try CustomCredentialsProvider(mockProvider)
        let credentials = try await subject.getCredentials()
        
        XCTAssertEqual(credentials.accessKey, "some_access_key")
        XCTAssertEqual(credentials.secret, "some_secret")
    }
}
