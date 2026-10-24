//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

/// NonRecoverableCredentialError is a credential failure that retrying can't fix, for example an
/// expired SSO session. The cache raises it right away instead of backing off, then caches it for
/// 1 to 5 seconds.
public struct NonRecoverableCredentialError: Error {

    /// underlying is the error from the credential source, or nil if the message says it all.
    public let underlying: (any Error)?

    /// actionableMessage tells the customer what to do, for example "run `aws sso login`".
    public let actionableMessage: String

    init(underlying: (any Error)? = nil, actionableMessage: String) {
        self.underlying = underlying
        self.actionableMessage = actionableMessage
    }
}

extension NonRecoverableCredentialError: CustomStringConvertible {

    public var description: String {
        guard let underlying else { return actionableMessage }
        return "\(actionableMessage) Underlying error: \(underlying)"
    }
}
