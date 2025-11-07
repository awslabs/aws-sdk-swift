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

    /// The S3Express identity that was resolved for this request, if any.
    ///
    /// Will be set at the time of signing if the auth scheme resolved to `aws.auth#sigv4-s3express`, will be `nil` otherwise.
    var s3ExpressIdentity: S3ExpressIdentity? {
        get { get(key: s3ExpressIdentityKey) }
        set { set(key: s3ExpressIdentityKey, value: newValue) }
    }
}

private let s3ExpressIdentityKey: AttributeKey<S3ExpressIdentity> = .init(name: "S3ExpressIdentity")
