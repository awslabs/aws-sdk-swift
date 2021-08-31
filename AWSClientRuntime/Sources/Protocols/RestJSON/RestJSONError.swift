/*
 * Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
 * SPDX-License-Identifier: Apache-2.0.
 */

import Foundation
import ClientRuntime

/// A general Error Structure for Rest JSON protocol
public struct RestJSONError {
    public let errorType: String?
    public let errorMessage: String?

    // header identifying the error code
    let X_AMZN_ERROR_TYPE_HEADER_NAME = "X-Amzn-Errortype"

    // returned by RESTFUL services that do no send a payload (like in a HEAD request)
    let X_AMZN_ERROR_MESSAGE_HEADER_NAME = "x-amzn-error-message"
    
    // returned by some services like Cognito
    let X_AMZN_ERRORMESSAGE_HEADER_NAME = "x-amzn-ErrorMessage"

    // error message header returned by event stream errors
    let X_AMZN_EVENT_ERROR_MESSAGE_HEADER_NAME = ":error-message"

    public init(httpResponse: HttpResponse) throws {
        var message = httpResponse.headers.value(for: X_AMZN_ERROR_MESSAGE_HEADER_NAME)
        if message == nil {
            message = httpResponse.headers.value(for: X_AMZN_EVENT_ERROR_MESSAGE_HEADER_NAME)
        }
        
        if message == nil {
            message = httpResponse.headers.value(for: X_AMZN_ERRORMESSAGE_HEADER_NAME)
        }

        var type = httpResponse.headers.value(for: X_AMZN_ERROR_TYPE_HEADER_NAME)

        if case .stream(let reader) = httpResponse.body {
            let data = reader.toBytes().toData()
            let output: RestJSONErrorPayload = try JSONDecoder().decode(responseBody: data)
            if message == nil {
                message = output.resolvedErrorMessage
            }
            if type == nil {
                type = output.resolvedErrorType
            }
        }
        self.errorType = RestJSONError.sanitizeErrorType(type)
        self.errorMessage = message
    }

    /// Filter additional information from error name and sanitize it
    // swiftlint:disable line_length
    // Reference: https://awslabs.github.io/smithy/1.0/spec/aws/aws-restjson1-protocol.html#operation-error-serialization
    static func sanitizeErrorType(_ type: String?) -> String? {
        guard let errorType = type else {
            return type
        }
        return errorType.substringAfter("#").substringBefore(":").trim()
    }
}
