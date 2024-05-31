//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import class Smithy.Context
import class Smithy.ContextBuilder
import struct Smithy.AttributeKey

public let flowTypeKey = AttributeKey<FlowType>(name: "FlowType")

extension Context {

    public func getFlowType() -> FlowType {
        return attributes.get(key: flowTypeKey) ?? .NORMAL
    }
}

extension ContextBuilder {

    @discardableResult
    public func withFlowType(value: FlowType) -> Self {
        self.attributes.set(key: flowTypeKey, value: value)
        return self
    }
}
