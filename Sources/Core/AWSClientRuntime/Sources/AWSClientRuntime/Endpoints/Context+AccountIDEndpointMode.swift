//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import struct Smithy.Attributes
import struct Smithy.AttributeKey
import class Smithy.Context
import class Smithy.ContextBuilder

public extension Context {

    var accountIDEndpointMode: AccountIDEndpointMode? {
        get { get(key: accountIDEndpointModeKey) }
        set { set(key: accountIDEndpointModeKey, value: newValue) }
    }
}

public extension ContextBuilder {

    @discardableResult
    func withAccountIDEndpointMode(value: AccountIDEndpointMode?) -> Self {
        attributes.set(key: accountIDEndpointModeKey, value: value)
        return self
    }
}

private let accountIDEndpointModeKey = AttributeKey<AccountIDEndpointMode>(name: "AccountIDEndpointMode")
