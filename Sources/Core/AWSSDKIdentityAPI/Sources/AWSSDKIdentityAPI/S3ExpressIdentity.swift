//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import protocol SmithyIdentityAPI.Identity
import struct Foundation.Date
import struct Smithy.Attributes

public struct S3ExpressIdentity: Identity {
    public var accessKeyID: String
    public var secretAccessKey: String
    public var sessionToken: String
    public var expiration: Date?
    public let properties: Attributes

    public init(
        accessKeyID: String,
        secretAccessKey: String,
        sessionToken: String,
        expiration: Date?,
        properties: Attributes = Attributes()
    ) {
        self.accessKeyID = accessKeyID
        self.secretAccessKey = secretAccessKey
        self.sessionToken = sessionToken
        self.expiration = expiration
        self.properties = properties
    }
}
