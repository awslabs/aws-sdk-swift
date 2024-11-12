//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import ClientRuntime
import Foundation
import AWSCLIUtils

public protocol Configurable {
    var bucket: String { get set }
    var region: String { get set }
    var distributionID: String? { get set }
}

public extension Configurable {

    mutating func setOptions() async throws {
        await SDKLoggingSystem().initialize(logLevel: .error)
        let env = ProcessInfo.processInfo.environment
        if bucket.isEmpty {
            bucket = env["AWS_SDK_SPR_BUCKET"] ?? ""
        }
        if region.isEmpty {
            region = env["AWS_SDK_SPR_REGION"] ?? "us-east-1"
        }
        distributionID = resolvedDistributionID(from: distributionID)
    }
}

func resolvedDistributionID(from distributionID: String?) -> String? {
    let env = ProcessInfo.processInfo.environment
    return distributionID ?? env["AWS_SDK_SPR_DISTRIBUTION_ID"]
}
