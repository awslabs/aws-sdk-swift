//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import class Smithy.Context
import struct Smithy.AttributeKey
import struct SmithyIdentity.AWSCredentialIdentity

public extension Context {

    /// The AWS account ID associated with the selected auth scheme.
    ///
    /// Will be `nil` if an auth scheme has not yet been selected, an AWS credential identity was not resolved, or the identity did not resolve with an AWS account ID.
    var s3ExpressIdentity: S3ExpressIdentity? {
        get { get(key: s3ExpressIdentityKey) }
        set { set(key: s3ExpressIdentityKey, value: newValue) }
    }
}

private let s3ExpressIdentityKey: AttributeKey<S3ExpressIdentity> = .init(name: "S3ExpressIdentity")
