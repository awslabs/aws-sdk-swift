//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import AWSSTS
import ClientRuntime
import Foundation
import SmithySwiftNIO

struct AWSSTSGetCallerIdentity: PerformanceTest {
    let name = "sts.getcalleridentity.latency"

    let description = "The total time between initiating a GetCallerIdentity and reading the last byte of the object."

    let unit = Unit.milliseconds

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

struct AWSSTSGetCallerIdentityNIO: PerformanceTest {
    let name = "sts.getcalleridentity.nio.latency"

    let description = "The total time between initiating a GetCallerIdentity and reading the last byte of the object using NIO HTTP Client."

    let unit = Unit.milliseconds

    let dimensions = [
        Dimension(name: "OS", value: OperatingSystem.current.rawValue),
    ]

    let test = getCallerIdentityNIO

    static func getCallerIdentityNIO() async throws -> Double {
        let start = Date()
        let nioClient = SmithySwiftNIO.SwiftNIOHTTPClient(httpClientConfiguration: ClientRuntime.HttpClientConfiguration())
        let config = try await STSClient.STSClientConfiguration(region: "us-west-2", httpClientEngine: nioClient)
        let client = STSClient(config: config)
        _ = try await client.getCallerIdentity(input: .init())
        return Date().timeIntervalSince(start) * 1000 // Convert seconds to milliseconds
    }
}
