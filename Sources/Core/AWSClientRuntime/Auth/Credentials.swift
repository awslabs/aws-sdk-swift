//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import Foundation

public typealias AWSCredentials = Credentials

/// A type representing credentials for authenticating with an AWS service
/// 
/// For more information see [AWS security credentials](https://docs.aws.amazon.com/general/latest/gr/aws-security-credentials.html#AccessKeys)
public struct Credentials {
    let accessKey: String
    let secret: String
    let expirationTimeout: Date?
    let sessionToken: String?

    /// Creates credentials with the specified keys and optionally an expiration and session token.
    ///
    /// - Parameters:
    ///   - accessKey: The access key
    ///   - secret: The secret for the provided access key
    ///   - expirationTimeout: The date when the credentials will expire and no longer be valid. If value is `nil` then the credentials never expire. Defaults to `nil`
    ///   - sessionToken: A session token for this session. Defaults to `nil`
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
