//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import class Foundation.ProcessInfo

public struct ProcessEnvironment: Environment {
    public init() {}

    public func environmentVariable(key: String) -> String? {
        return ProcessInfo.processInfo.environment[key]
    }
}
