//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//
        
public struct Ec2Response: Decodable {
    public let errors: Ec2Errors
    public let requestId: String

    enum CodingKeys: String, CodingKey {
        case errors = "Errors"
        case requestId = "RequestId"
    }
}
