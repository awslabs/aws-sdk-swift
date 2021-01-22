/*
 * Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
 * SPDX-License-Identifier: Apache-2.0.
 */

/// A general payload structure for Rest-JSON protocol errors
public struct RestJSONErrorPayload: Decodable {
    /// Payload Members which might hold Error name
    let code: String?
    let __type: String?

    /// Payload Members which might hold Error message
    let message: String?
    let Message: String?
    let errorMessage: String?

    // https://sapp.amazon.com/seps/accepted/shared/sdk-unmarshal-errors/#rest-json
    /// Resolve and return the error name
    public var resolvedErrorType: String? {
        if code != nil {
            return code
        } else {
            return __type
        }
    }

    /// Resolve and return the error message
    public var resolvedErrorMessage: String? {
        if message != nil {
            return message
        } else if Message != nil {
            return Message
        } else {
            return errorMessage
        }
    }
}
