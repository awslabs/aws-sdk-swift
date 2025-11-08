//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import struct Smithy.AttributeKey
import class Smithy.Context
import struct SmithyIdentity.AWSCredentialIdentity

public extension Context {

    /// The AWS account ID associated with the selected auth scheme.
    ///
    /// Will be `nil` if an auth scheme has not yet been selected, an AWS credential identity was not resolved, or the identity did not resolve with an AWS account ID.
    var resolvedAccountID: String? {
        (selectedAuthScheme?.identity as? AWSCredentialIdentity)?.accountID
    }
}
