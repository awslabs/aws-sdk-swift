//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import class SmithyXML.Reader

public struct RestXMLError {
    public let code: String
    public let message: String?
    public let requestID: String?

    public static func errorBodyReader(responseReader: Reader, noErrorWrapping: Bool) -> Reader {
        noErrorWrapping ? responseReader : responseReader["Error"]
    }

    public init(responseReader: Reader, noErrorWrapping: Bool) throws {
        let reader = Self.errorBodyReader(responseReader: responseReader, noErrorWrapping: noErrorWrapping)
        let code: String? = try reader["Code"].readIfPresent()
        let message: String? = try reader["Message"].readIfPresent()
        let requestID: String? = try responseReader["RequestId"].readIfPresent()
        guard let code else {
            throw RestXMLDecodeError.missingRequiredData
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

public enum RestXMLDecodeError: Error {
    case missingRequiredData
}
