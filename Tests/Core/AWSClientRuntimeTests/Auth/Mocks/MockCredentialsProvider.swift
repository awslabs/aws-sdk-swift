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
    let _getCredentials: () async throws -> Credentials
    init(_ _getCredentials: @escaping () async throws -> Credentials) {
        self._getCredentials = _getCredentials
    }
    init() {
        self._getCredentials = {
            Credentials(
                accessKey: "some_access_key",
                secret: "some_secret"
            )
        }
    }
    func getCredentials() async throws -> Credentials {
        try await _getCredentials()
    }
}
