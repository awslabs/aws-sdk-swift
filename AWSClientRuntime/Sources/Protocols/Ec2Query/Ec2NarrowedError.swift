//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//
        
public struct Ec2NarrowedError<T>: Decodable where T: Decodable {
    public let error: T

    enum CodingKeys: String, CodingKey {
        case error = "Error"
    }
}
