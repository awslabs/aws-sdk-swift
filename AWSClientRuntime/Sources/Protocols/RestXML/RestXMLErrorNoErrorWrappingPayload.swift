//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

public struct RestXMLErrorNoErrorWrappingPayload: Decodable {
    public let errorCode: String
    public let requestId: String
    public let message: String?
    enum CodingKeys: String, CodingKey {
        case errorCode = "Code"
        case requestId = "RequestId"
        case message = "Message"
    }
}
