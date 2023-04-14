//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import AwsCommonRuntimeKit
import ClientRuntime

public typealias CRTCredentials = AwsCommonRuntimeKit.Credentials

public extension Credentials {
    /// Creates credentials from the provided `CRTCredentials`.
    ///
    /// Throws if it fails to get the access key or secret from the underlying `CRTCredentials`.
    init(crtCredentials: CRTCredentials) throws {
        guard let accessKey = crtCredentials.getAccessKey() else {
            throw ClientError.authError("Failed to get access key.")
        }

        guard let secret = crtCredentials.getSecret() else {
            throw ClientError.authError("Failed to get secret.")
        }

        self.init(
            accessKey: accessKey,
            secret: secret,
            expirationTimeout: crtCredentials.getExpiration(),
            sessionToken: crtCredentials.getSessionToken()
        )
    }
}

public extension CRTCredentials {
    /// Creates `CRTCredentials` from the provided credentials
    convenience init(credentials: Credentials) throws {
        try self.init(
            accessKey: credentials.accessKey,
            secret: credentials.secret,
            sessionToken: credentials.sessionToken,
            expiration: credentials.expirationTimeout
        )
    }
}
