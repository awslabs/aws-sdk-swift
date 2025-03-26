//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import AWSSTS
import Foundation

struct AWSSTSGetCallerIdentity: PerformanceTest {
    let name = "sts.getcalleridentity.latency"

    let description = "The total time between initiating a GetCallerIdentity and reading the last byte of the object."

    let unit = "Milliseconds"

    let dimensions = [
        Dimension(name: "OS", value: OperatingSystem.current.rawValue),
    ]

    let test = getCallerIdentity

    static func getCallerIdentity() async throws -> Double {
        let start = Date()
        let client = try await STSClient()
        _ = try await client.getCallerIdentity(input: .init())
        return Date().timeIntervalSince(start) * 1000  // Convert seconds to milliseconds
    }
}
