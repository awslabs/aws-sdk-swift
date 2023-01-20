//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import AwsCommonRuntimeKit
import Foundation

public struct AWSCredentials {
    let accessKey: String
    let secret: String
    let expirationTimeout: Date?
    let sessionToken: String?

    public init(
        accessKey: String,
        secret: String,
        expirationTimeout: Date? = nil,
        sessionToken: String? = nil
    ) {
        self.accessKey = accessKey
        self.secret = secret
        self.expirationTimeout = expirationTimeout
        self.sessionToken = sessionToken
    }
}

extension AWSCredentials {
    func toCRTType() throws -> Credentials {
        return try Credentials(
            accessKey: accessKey,
            secret: secret,
            sessionToken: sessionToken,
            expiration: expirationTimeout
        )
    }
}
