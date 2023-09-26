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

struct MockCredentialsProvider: CredentialsProviding {
    let _getIdentity: () async throws -> Credentials
    init(_ _getIdentity: @escaping () async throws -> Credentials) {
        self._getIdentity = _getIdentity
    }
    init() {
        self._getIdentity = {
            Credentials(
                accessKey: "some_access_key",
                secret: "some_secret"
            )
        }
    }
    func getIdentity(identityProperties: Attributes?) async throws -> Credentials {
        try await _getIdentity()
    }
}
