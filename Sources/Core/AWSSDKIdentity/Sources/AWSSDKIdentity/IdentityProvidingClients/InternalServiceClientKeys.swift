//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import struct Smithy.AttributeKey

public enum InternalServiceClientKeys {
    public static let internalSTSClient = AttributeKey<any IdentityProvidingSTSClient>(name: "IdentityProvidingSTSClient")
}
