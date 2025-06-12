//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import struct Smithy.AttributeKey

public enum InternalClientKeys {
    /// The STS client to be used in credential resolution.
    public static let internalSTSClientKey = AttributeKey<any IdentityProvidingSTSClient>(
        name: "IdentityProvidingSTSClient"
    )
}
