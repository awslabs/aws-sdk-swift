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

class StaticAWSCredentialIdentityResolverTests: XCTestCase {
    func testGetCredentials() async throws {
        let subject = try StaticAWSCredentialIdentityResolver(.init(
            accessKey: "some_access_key",
            secret: "some_secret"
        ))
        let credentials = try await subject.getIdentity()
        
        XCTAssertEqual(credentials.accessKey, "some_access_key")
        XCTAssertEqual(credentials.secret, "some_secret")
    }
}
