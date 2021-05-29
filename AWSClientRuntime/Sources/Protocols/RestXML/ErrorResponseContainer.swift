//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

public struct ErrorResponseContainer<T>: Decodable where T: Decodable {
    public let error: T
    public let requestId: String
    public let message: String
    enum CodingKeys: String, CodingKey {
        case error = "Error"
        case requestId = "RequestId"
        case message = "Message"
    }
}
