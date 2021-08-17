//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//
import class Foundation.ProcessInfo

struct EnvironmentRegionProvider: RegionProvider {
    private let AWS_ENVIRON_REGION = "AWS_REGION"
    private let env: Environment
    
    init(env: Environment = ProcessEnvironment()) {
        self.env = env
    }
    
    func resolveRegion() -> String? {
        return env.environmentVariable(key: AWS_ENVIRON_REGION)
    }
}

struct ProcessEnvironment: Environment {
    func environmentVariable(key: String) -> String? {
        return ProcessInfo.processInfo.environment[key]
    }
}

protocol Environment {
    func environmentVariable(key: String) -> String?
}
