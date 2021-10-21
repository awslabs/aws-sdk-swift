//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//
import class Foundation.ProcessInfo
import AwsCommonRuntimeKit

public struct EnvironmentRegionProvider: RegionProvider {
    private let AWS_ENVIRON_REGION = "AWS_REGION"
    private let env: Environment
    
    public init(env: Environment = ProcessEnvironment()) {
        self.env = env
    }
    
    public func resolveRegion() -> Future<String?> {
        let future = Future<String?>()
        future.fulfill(env.environmentVariable(key: AWS_ENVIRON_REGION))
        return future
    }
}

public struct ProcessEnvironment: Environment {
    public init() {}
    
    public func environmentVariable(key: String) -> String? {
        return ProcessInfo.processInfo.environment[key]
    }
}
