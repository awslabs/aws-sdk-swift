//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//
        
public struct Ec2NarrowedResponse<T>: Decodable where T: Decodable {
    public let errors: Ec2NarrowedError<T>
    public let requestId: String

    enum CodingKeys: String, CodingKey {
        case errors = "Errors"
        case requestId = "RequestId"
    }
}
