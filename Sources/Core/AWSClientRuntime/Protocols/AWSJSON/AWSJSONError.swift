//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import class SmithyJSON.Reader

public struct AWSJSONError {
    public let code: String
    public let message: String?
    public let requestID: String?

    public static func errorBodyReader(responseReader: Reader, noErrorWrapping: Bool) -> Reader {
        noErrorWrapping ? responseReader : responseReader["Error"]
    }

    public init(responseReader: Reader, noErrorWrapping: Bool) throws {
        let reader = Self.errorBodyReader(responseReader: responseReader, noErrorWrapping: noErrorWrapping)
        let code: String? = try reader["code"].readIfPresent() ?? reader["__type"].readIfPresent()
        let message: String? = try reader["Message"].readIfPresent()
        let requestID: String? = try responseReader["RequestId"].readIfPresent()
        guard let code else {
            throw AWSJSONDecodeError.missingRequiredData
        }
        self.code = code
        self.message = message
        self.requestID = requestID
    }

    public init(code: String, message: String?, requestID: String?) {
        self.code = code
        self.message = message
        self.requestID = requestID
    }
}

public enum AWSJSONDecodeError: Error {
    case missingRequiredData
}
