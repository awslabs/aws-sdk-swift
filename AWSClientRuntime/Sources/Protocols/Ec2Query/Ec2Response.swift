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
        case requestID = "RequestID"
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.errors = try container.decode(Ec2Errors.self, forKey: .errors)
        
        // Attempt to decode the requestId with the key "RequestID"
        // if that is not present, then fallback to the key "RequestId"
        self.requestId = try container.decodeIfPresent(String.self, forKey: .requestID)
            ?? container.decode(String.self, forKey: .requestId)
    }
}
