//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

struct PerformanceTestResult: Codable {
    let name: String
    let description: String
    let unit: String
    let date: Int
    let measurements: [Double]
    let dimensions: [Dimension]?
}
