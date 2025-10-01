//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import struct Foundation.Date
import class Foundation.DateFormatter
import struct Foundation.Locale
import struct Foundation.TimeInterval
import struct Foundation.TimeZone
import protocol ClientRuntime.ServiceError
import class SmithyHTTPAPI.HTTPRequest
import class SmithyHTTPAPI.HTTPResponse
@_spi(SmithyTimestamps) import struct SmithyTimestamps.TimestampFormatter

public enum AWSClockSkewProvider {

    @Sendable
    public static func clockSkew(
        request: HTTPRequest,
        response: HTTPResponse,
        error: Error
    ) -> TimeInterval? {
        // Get the error code, which is a cue that clock skew is the cause of the error
        guard let code = (error as? ServiceError)?.errorCode else { return nil }

        // Check the error code to see if this error could be due to clock skew
        // If not, fail fast to prevent having to parse server datetime (slow)
        guard isDefiniteClockSkewError(code: code) || isProbableClockSkewError(code: code, request: request) else {
            return nil
        }

        // Get the datetime that the request was signed at.  If not available, clock skew can't be determined.
        guard let clientDate = clientDate(request: request) else { return nil }

        // Need a server Date (from the HTTP response headers) to calculate clock skew.
        // If not available, return no clock skew.
        guard let serverDate = serverDate(response: response) else { return nil }

        // Calculate & return clock skew if more than the threshold
        let threshold: TimeInterval = 60.0  // clock skew of less than 1 minute is discarded
        let clockSkew = serverDate.timeIntervalSince(clientDate)
        return abs(clockSkew) > threshold ? clockSkew : nil
    }

    private static func isDefiniteClockSkewError(code: String) -> Bool {
        definiteClockSkewErrorCodes.contains(code)
    }

    private static func isProbableClockSkewError(code: String, request: HTTPRequest) -> Bool {
        // Certain S3 HEAD methods will return generic HTTP 403 errors when the cause of the
        // failure is clock skew.  To accommodate, check clock skew when the method is HEAD
        probableClockSkewErrorCodes.contains(code) || request.method == .head
    }

    private static func clientDate(request: HTTPRequest) -> Date? {
        request.signedAt
    }

    private static func serverDate(response: HTTPResponse) -> Date? {
        guard let httpDateString = response.headers.value(for: "Date") else { return nil }
        return TimestampFormatter(format: .httpDate).date(from: httpDateString)
    }
}

// These error codes indicate that the cause of the failure was clock skew.
private let definiteClockSkewErrorCodes = Set([
    "RequestTimeTooSkewed",
    "RequestExpired",
    "RequestInTheFuture",
])

// These error codes indicate that a possible cause of the failure was clock skew.
// So, when these are received, check/set clock skew & retry to see if that helps.
private let probableClockSkewErrorCodes = Set([
    "InvalidSignatureException",
    "AuthFailure",
    "SignatureDoesNotMatch",
])
