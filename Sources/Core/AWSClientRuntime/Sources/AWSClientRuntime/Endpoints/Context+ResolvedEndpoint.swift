//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import struct Smithy.Attributes
import struct Smithy.AttributeKey
import class Smithy.Context
import struct SmithyHTTPAPI.Endpoint

public extension Context {

    var resolvedEndpoint: Endpoint? {
        get { get(key: resolvedEndpointKey) }
        set { set(key: resolvedEndpointKey, value: newValue) }
    }
}

private let resolvedEndpointKey = AttributeKey<Endpoint>(name: "ResolvedEndpoint")
