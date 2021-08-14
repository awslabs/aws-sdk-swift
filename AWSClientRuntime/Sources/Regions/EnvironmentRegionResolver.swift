//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//
import class Foundation.ProcessInfo
struct EnvironmentRegionResolver: RegionResolver {
    private let AWS_ENVIRON_REGION = "AWS_REGION"
    func resolveRegion() -> String? {
        if let value = ProcessInfo.processInfo.environment[AWS_ENVIRON_REGION] {
            return value
        }
        return nil
    }
}
