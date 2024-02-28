//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import Foundation
import protocol ClientRuntime.Identity

/// A type representing AWS credentials for authenticating with an AWS service
///
/// For more information see [AWS security credentials](https://docs.aws.amazon.com/general/latest/gr/aws-security-credentials.html#AccessKeys)
public struct AWSCredentialIdentity: Identity {
    let accessKey: String
    let secret: String
    let sessionToken: String?
    public let expiration: Date?

    /// Creates AWS credentials with the specified keys and optionally an expiration and session token.
    ///
    /// - Parameters:
    ///   - accessKey: The access key
    ///   - secret: The secret for the provided access key
    ///   - expiration: The date when the credentials will expire and no longer be valid. If value is `nil` then the credentials never expire. Defaults to `nil`
    ///   - sessionToken: A session token for this session. Defaults to `nil`
    public init(
        accessKey: String,
        secret: String,
        expiration: Date? = nil,
        sessionToken: String? = nil
    ) {
        self.accessKey = accessKey
        self.secret = secret
        self.expiration = expiration
        self.sessionToken = sessionToken
    }
}
