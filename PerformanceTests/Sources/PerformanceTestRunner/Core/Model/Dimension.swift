//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

struct Dimension: Codable {
    let name: String  // The name of the dimension. MUST comply with CloudWatch constraints on dimension name.
    let value: String // The value of the dimension. MUST comply with CloudWatch constraints on dimension value.
}
