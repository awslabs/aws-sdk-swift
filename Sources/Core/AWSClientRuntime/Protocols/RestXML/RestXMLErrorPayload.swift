//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

public struct RestXMLErrorPayload: Decodable {
    public let errorCode: String
    public let message: String?
    enum CodingKeys: String, CodingKey {
        case errorCode = "Code"
        case message = "Message"
    }
}
