//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import struct Foundation.TimeInterval
import typealias ClientRuntime.ClockSkewProvider
import protocol ClientRuntime.ServiceError
import class SmithyHTTPAPI.HTTPRequest
import class SmithyHTTPAPI.HTTPResponse
@_spi(SmithyTimestamps) import struct SmithyTimestamps.TimestampFormatter

public enum AWSClockSkewProvider {
    private static var absoluteThreshold: TimeInterval = 300.0  // clock skew of < 5 minutes is not compensated
    private static var changeThreshold: TimeInterval = 60.0  // changes to clock skew of < 1 minute are ignored

    public static func provider() -> ClockSkewProvider<HTTPRequest, HTTPResponse> {
        return clockSkew(request:response:error:previous:)
    }

    @Sendable
    private static func clockSkew(
        request: HTTPRequest,
        response: HTTPResponse,
        error: Error,
        previous: TimeInterval?
    ) -> TimeInterval? {
        // Check if this error could be the result of clock skew.
        // If not, leave the current clock skew value unchanged.
        guard isAClockSkewError(request: request, error: error) else { return previous }

        // Get the new clock skew value based on server & client times.
        let new = newClockSkew(request: request, response: response, error: error)

        if let new, let previous {
            // Update clock skew if it's changed by at least the change threshold
            // Updating clock skew for insignificant changes in value will result
            // in retry when not likely to succeed
            return abs(new - previous) > changeThreshold ? new : previous
        } else {
            // If previous was nil but new is non-nil, return new.
            // If previous was non-nil but new is nil, return nil.
            // If previous and new are both nil, return nil.
            return new
        }
    }

    private static func isAClockSkewError(request: HTTPRequest, error: Error) -> Bool {
        // Get the error code, which is a cue that clock skew is the cause of the error
        guard let code = (error as? ServiceError)?.errorCode else { return false }

        // Check the error code to see if this error could be due to clock skew
        // If not, fail fast to prevent having to parse server datetime (slow)
        return isDefiniteClockSkewError(code: code) || isProbableClockSkewError(code: code, request: request)
    }

    private static func isDefiniteClockSkewError(code: String) -> Bool {
        definiteClockSkewErrorCodes.contains(code)
    }

    private static func isProbableClockSkewError(code: String, request: HTTPRequest) -> Bool {
        // Certain S3 HEAD methods will return generic HTTP 403 errors when the cause of the
        // failure is clock skew.  To accommodate, check clock skew when the method is HEAD
        probableClockSkewErrorCodes.contains(code) || request.method == .head
    }

    private static func newClockSkew(
        request: HTTPRequest,
        response: HTTPResponse,
        error: Error
    ) -> TimeInterval? {
        // Get the datetime that the request was signed at.
        // If not available, clock skew can't be determined.
        // This should always be set when signing with sigv4 & sigv4a.
        guard let clientDate = request.signedAt else { return nil }

        // Need a server Date (from the HTTP response headers) to calculate clock skew.
        // If not available, return no clock skew.
        // This header should always be included on AWS service responses.
        guard let httpDateString = response.headers.value(for: "Date") else { return nil }
        guard let serverDate = TimestampFormatter(format: .httpDate).date(from: httpDateString) else { return nil }

        // Calculate & return clock skew if more than the threshold, else return nil.
        let clockSkew = serverDate.timeIntervalSince(clientDate)
        return abs(clockSkew) > absoluteThreshold ? clockSkew : nil
    }
}

// These error codes indicate that the cause of the failure was clock skew.
private let definiteClockSkewErrorCodes: Set = [
    "RequestTimeTooSkewed",
    "RequestExpired",
    "RequestInTheFuture",
]

// These error codes indicate that a possible cause of the failure was clock skew.
// So, when these are received, check/set clock skew & retry to see if that helps.
private let probableClockSkewErrorCodes: Set = [
    "InvalidSignatureException",
    "AuthFailure",
    "SignatureDoesNotMatch",
]
