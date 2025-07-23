//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import struct Smithy.AttributeKey
import class Smithy.Context

extension Context {
    
    /// This property is set to `true` when a service-specific API key / bearer token has been resolved from
    /// an environment variable.  Used to generate appropriate business metrics for that feature.
    var usesBearerServiceEnvVars: Bool {
        get { get(key: usesBearerServiceEnvVarsKey) ?? false }
        set { set(key: usesBearerServiceEnvVarsKey, value: newValue) }
    }
}

private var usesBearerServiceEnvVarsKey = AttributeKey<Bool>(name: "usesBearerServiceEnvVarsKey")
