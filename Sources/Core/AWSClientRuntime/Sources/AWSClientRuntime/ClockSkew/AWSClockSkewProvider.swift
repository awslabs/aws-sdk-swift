//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import struct Foundation.Date
import struct Foundation.TimeInterval
import class SmithyHTTPAPI.HTTPRequest
import class SmithyHTTPAPI.HTTPResponse
@_spi(SmithyTimestamps) import struct SmithyTimestamps.TimestampFormatter

public enum AWSClockSkewProvider {

    // Any clock skew less than this threshold will not be compensated.
    private static var clockSkewThreshold: TimeInterval { 300.0 }  // five minutes

    @Sendable
    public static func clockSkew(
        request: HTTPRequest,
        response: HTTPResponse,
        error: Error, now: Date
    ) -> TimeInterval? {
        // Need a server Date and an error code to calculate clock skew.
        // If either of these aren't available, return no clock skew.
        guard let httpDateString = response.headers.value(for: "Date") else { return nil }
        guard let serverDate = httpDate(httpDateString: httpDateString) else { return nil }
        guard let code = (error as? AWSServiceError)?.errorCode else { return nil }

        if definiteClockSkewError(code: code) || probableClockSkewError(code: code, request: request) {
            let clockSkew = serverDate.timeIntervalSince(now)
            if abs(clockSkew) > clockSkewThreshold {
                return clockSkew
            }
        }
        return nil
    }

    private static func definiteClockSkewError(code: String) -> Bool {
        definiteClockSkewErrorCodes.contains(code)
    }

    private static func probableClockSkewError(code: String, request: HTTPRequest) -> Bool {
        probableClockSkewErrorCodes.contains(code) // && request.method == .head
    }

    private static func httpDate(httpDateString: String) -> Date? {
        TimestampFormatter(format: .httpDate).date(from: httpDateString)
    }
}

// These error codes indicate it's likely that the cause of the failure was clock skew.
private let definiteClockSkewErrorCodes = Set([
    "RequestTimeTooSkewed",
    "RequestExpired",
    "RequestInTheFuture",
])

// Some S3 HEAD operations will return these codes instead of the definite codes when the
// operation fails due to clock skew.
private let probableClockSkewErrorCodes = Set([
    "InvalidSignatureException",
    "AuthFailure",
    "SignatureDoesNotMatch",
])
