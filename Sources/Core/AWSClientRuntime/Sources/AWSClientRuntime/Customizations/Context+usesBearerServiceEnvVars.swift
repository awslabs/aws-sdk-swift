//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import struct Smithy.AttributeKey
import class Smithy.Context

extension Context {

    var usesBearerServiceEnvVars: Bool {
        get { get(key: usesBearerServiceEnvVarsKey) ?? false }
        set { set(key: usesBearerServiceEnvVarsKey, value: newValue) }
    }
}

private var usesBearerServiceEnvVarsKey = AttributeKey<Bool>(name: "usesBearerServiceEnvVarsKey")
