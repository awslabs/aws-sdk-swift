//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import Smithy
import SmithyIdentityAPI
import SmithyIdentity
import ClientRuntime
import Foundation
import XCTest

@_spi(FileBasedConfig) @testable import AWSClientRuntime

struct MockAWSCredentialIdentityResolver: AWSCredentialIdentityResolver {
    let _getIdentity: () async throws -> AWSCredentialIdentity
    init(_ _getIdentity: @escaping () async throws -> AWSCredentialIdentity) {
        self._getIdentity = _getIdentity
    }
    init() {
        self._getIdentity = {
            AWSCredentialIdentity(
                accessKey: "some_access_key",
                secret: "some_secret"
            )
        }
    }
    func getIdentity(identityProperties: Attributes?) async throws -> AWSCredentialIdentity {
        try await _getIdentity()
    }
}
