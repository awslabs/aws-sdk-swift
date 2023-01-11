//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//
        
public struct Ec2Errors: Decodable {
    public let error: Ec2Error

    enum CodingKeys: String, CodingKey {
        case error = "Error"
    }
}
