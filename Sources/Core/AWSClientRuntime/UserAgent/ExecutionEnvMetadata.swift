//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import class Foundation.ProcessInfo

public struct ExecutionEnvMetadata {
    let name: String

    public init(name: String) {
        self.name = name
    }
}

extension ExecutionEnvMetadata: CustomStringConvertible {
    public var description: String {
        return "exec-env/\(name.sanitizedForUserAgentToken)"
    }

    public static func detectExecEnv() -> ExecutionEnvMetadata? {
        guard let execEnv = ProcessInfo.processInfo.environment["AWS_EXECUTION_ENV"], !execEnv.isEmpty else {
            return nil
        }
        return ExecutionEnvMetadata(name: execEnv)
    }
}
