//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

public struct RestXMLErrorPayload: Decodable {
    public let errorCode: String
    enum CodingKeys: String, CodingKey {
        case errorCode = "Code"
    }
}
