//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

/// Represents a single performance test result.
struct PerformanceTestResult: Codable {
    /// The name of the benchmark.
    /// Examples of acceptable values: `"crc32c.jdk.small"`, `"bundle.size"`
    let name: String

    /// A description of the benchmark.
    let description: String

    /// The unit of the measurements.
    let unit: String

    /// The date the test was completed in Unix epoch seconds.
    let date: Int

    /// The raw measurements taken for the test. Elements are IEEE 754 double-precision numbers.
    let measurements: [Double]

    /// Used to specify additional dimensions for publishing this metric. Optional.
    let dimensions: [Dimension]?

    /// Whether metrics for this result should be published to CloudWatch. Optional.
    ///
    /// By default, metrics will always be published unless this value is false.
    var publishToCloudWatch: Bool? = nil
}
