//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

protocol PerformanceTest {
    var name: String { get }
    var description: String { get }
    var unit: Unit { get }
    var dimensions: [Dimension] { get }
    var test: () async throws -> Double { get }
}
