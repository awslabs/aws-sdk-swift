//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//
import class Foundation.ProcessInfo
        
public struct ExecutionEnvMetadata {
    let  name: String
    
    public init(name: String) {
        self.name = name
    }
}

extension ExecutionEnvMetadata: CustomStringConvertible {
    public var description: String {
        return "exec-env/\(name.encodeUaToken())"
    }
    
    static func detectExecEnv() -> ExecutionEnvMetadata? {
        guard let _ = ProcessInfo.processInfo.environment["AWS_LAMBDA_FUNCTION_NAME"] else {
            return nil
        }
        return ExecutionEnvMetadata(name: "lambda")
    }
}
