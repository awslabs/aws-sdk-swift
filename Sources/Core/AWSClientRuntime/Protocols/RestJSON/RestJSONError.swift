/*
 * Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
 * SPDX-License-Identifier: Apache-2.0.
 */

import Foundation
import ClientRuntime

import class SmithyJSON.Reader

/// A general Error Structure for Rest JSON protocol
//public struct RestJSONError {
//    public let errorType: String?
//    public let errorMessage: String?
//
//    // header identifying the error code
//    let X_AMZN_ERROR_TYPE_HEADER_NAME = "X-Amzn-Errortype"
//
//    // returned by RESTFUL services that do no send a payload (like in a HEAD request)
//    let X_AMZN_ERROR_MESSAGE_HEADER_NAME = "x-amzn-error-message"
//
//    // returned by some services like Cognito
//    let X_AMZN_ERRORMESSAGE_HEADER_NAME = "x-amzn-ErrorMessage"
//
//    // error message header returned by event stream errors
//    let X_AMZN_EVENT_ERROR_MESSAGE_HEADER_NAME = ":error-message"
//
//    public init(httpResponse: HttpResponse) async throws {
//        var message = httpResponse.headers.value(for: X_AMZN_ERROR_MESSAGE_HEADER_NAME)
//        if message == nil {
//            message = httpResponse.headers.value(for: X_AMZN_EVENT_ERROR_MESSAGE_HEADER_NAME)
//        }
//
//        if message == nil {
//            message = httpResponse.headers.value(for: X_AMZN_ERRORMESSAGE_HEADER_NAME)
//        }
//
//        var type = httpResponse.headers.value(for: X_AMZN_ERROR_TYPE_HEADER_NAME)
//
//        if let data = try await httpResponse.body.readData() {
//            let output: RestJSONErrorPayload = try JSONDecoder().decode(responseBody: data)
//            if message == nil {
//                message = output.resolvedErrorMessage
//            }
//            if type == nil {
//                type = output.resolvedErrorType
//            }
//        }
//        self.errorType = RestJSONError.sanitizeErrorType(type)
//        self.errorMessage = message
//    }
//}

public struct RestJSONError {
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
            throw RestJSONDecodeError.missingRequiredData
        }
        self.code = sanitizeErrorType(code)
        self.message = message
        self.requestID = requestID
    }

    public init(code: String, message: String?, requestID: String?) {
        self.code = code
        self.message = message
        self.requestID = requestID
    }
}

public enum RestJSONDecodeError: Error {
    case missingRequiredData
}

    /// Filter additional information from error name and sanitize it
    /// Reference: https://awslabs.github.io/smithy/1.0/spec/aws/aws-restjson1-protocol.html#operation-error-serialization
    private func sanitizeErrorType(_ type: String) -> String {
        return type.substringAfter("#").substringBefore(":").trim()
    }
