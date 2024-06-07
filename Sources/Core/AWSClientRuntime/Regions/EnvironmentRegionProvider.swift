//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//
import class Foundation.ProcessInfo
import struct AWSSDKCommon.ProcessEnvironment
import protocol AWSSDKCommon.Environment


public struct EnvironmentRegionProvider: RegionProvider {
    private let AWS_ENVIRON_REGION = "AWS_REGION"
    private let env: Environment

    public init(env: Environment = ProcessEnvironment()) {
        self.env = env
    }

    public func getRegion() throws -> String? {
        return env.environmentVariable(key: AWS_ENVIRON_REGION)
    }
}
