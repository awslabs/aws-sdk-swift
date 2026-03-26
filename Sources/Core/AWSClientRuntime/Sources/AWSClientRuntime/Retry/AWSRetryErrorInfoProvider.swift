//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import enum AwsCommonRuntimeKit.CommonRunTimeError
import enum ClientRuntime.DefaultRetryErrorInfoProvider
import protocol ClientRuntime.HTTPError
import protocol ClientRuntime.ModeledError
import protocol ClientRuntime.ServiceError
import struct Foundation.TimeInterval
import struct SmithyRetriesAPI.RetryErrorInfo
import protocol SmithyRetriesAPI.RetryErrorInfoProvider

public enum AWSRetryErrorInfoProvider: RetryErrorInfoProvider {

    // Error codes that the Retry Behavior 2.0 specification say should be treated as throttling errors.
    private static let throttlingErrorCodes = [
        "Throttling",
        "ThrottlingException",
        "ThrottledException",
        "RequestThrottledException",
        "TooManyRequestsException",
        "ProvisionedThroughputExceededException",
        "TransactionInProgressException",
        "RequestLimitExceeded",
        "BandwidthLimitExceeded",
        "LimitExceededException",
        "RequestThrottled",
        "SlowDown",
        "PriorRequestNotComplete",
        "EC2ThrottledException",
    ]

    // Error codes that the Retry Behavior 2.0 specification say should be treated as transient errors.
    private static let transientErrorCodes = [
        "RequestTimeout",
        "InternalError",
        "RequestTimeoutException",
    ]

    // CRT error codes that should be treated as transient errors.
    private static let transientCRTErrorCodes: [Int32] = [
        2058, // httpConnectionClosed
        2070, // httpServerClosed
        2087, // AWS_ERROR_HTTP_STREAM_MANAGER_CONNECTION_ACQUIRE_FAILURE
    ]

    // HTTP status codes that the Retry Behavior 2.0 specification say should be treated as transient errors.
    private static let transientStatusCodes = [500, 502, 503, 504]

    // HTTP status codes should be treated as timeouts.
    private static let timeoutStatusCodes = [408, 504]

    /// Returns an error info provider closure that is aware of the service name.
    /// For DynamoDB/DynamoDB Streams, sets `backoffMultiplier = 0.025` for non-throttling errors.
    public static func errorInfoProvider(sdkID: String) -> (Error) -> RetryErrorInfo? {
        let isDynamoDB = sdkID == "DynamoDB" || sdkID == "DynamoDB Streams"
        return { error in
            guard var info = errorInfo(for: error) else { return nil }
            if isDynamoDB && info.errorType != .throttling {
                info.backoffMultiplier = 0.025
            }
            return info
        }
    }

    public static func errorInfo(for error: Error) -> RetryErrorInfo? {

        // Determine based on properties if this error is a timeout error.
        var isTimeout = false

        // Error can be a timeout error based on HTTP code
        if let httpError = error as? HTTPError,
           timeoutStatusCodes.contains(httpError.httpResponse.statusCode.rawValue) {
            isTimeout = true
        }

        // Handle certain CRT errors as transient errors
        if case CommonRunTimeError.crtError(let crtError) = error {
            if transientCRTErrorCodes.contains(crtError.code) {
                return applyRetryAfterHeader(
                    info: RetryErrorInfo(errorType: .transient, retryAfterHint: nil, isTimeout: isTimeout),
                    error: error
                )
            }
        }

        if let serviceError = error as? ServiceError, let code = serviceError.typeName {
            // Handle the throttling error codes as errors of retry type "throttling".
            if throttlingErrorCodes.contains(code) {
                return applyRetryAfterHeader(
                    info: RetryErrorInfo(errorType: .throttling, retryAfterHint: nil, isTimeout: false),
                    error: error
                )
            }
            // Handle the transient error codes as errors of retry type "transient".
            if transientErrorCodes.contains(code) {
                return applyRetryAfterHeader(
                    info: RetryErrorInfo(errorType: .transient, retryAfterHint: nil, isTimeout: isTimeout),
                    error: error
                )
            }
        }

        if let httpError = error as? HTTPError {
            // Handle the transient and timeout HTTP status codes as errors of retry type "transient".
            if (transientStatusCodes + timeoutStatusCodes).contains(httpError.httpResponse.statusCode.rawValue) {
                return applyRetryAfterHeader(
                    info: RetryErrorInfo(errorType: .transient, retryAfterHint: nil, isTimeout: isTimeout),
                    error: error
                )
            }
        }

        if let modeledError = error as? ModeledError, type(of: modeledError).typeName == "IDPCommunicationError" {
            return applyRetryAfterHeader(
                info: RetryErrorInfo(errorType: .transient, retryAfterHint: nil, isTimeout: isTimeout),
                error: error
            )
        }

        // If custom AWS error matching fails, use the default error info provider to finish matching.
        return DefaultRetryErrorInfoProvider.errorInfo(for: error)
    }

    /// Parses `x-amz-retry-after` header (milliseconds) and sets retryAfterHint.
    /// The strategy will apply min/max bounds (t_i minimum, 5+t_i maximum).
    /// Invalid values are ignored and fall back to exponential backoff.
    private static func applyRetryAfterHeader(info: RetryErrorInfo, error: Error) -> RetryErrorInfo {
        guard let httpError = error as? HTTPError,
              let headerValue = httpError.httpResponse.headers.value(for: "x-amz-retry-after"),
              let millis = Int(headerValue), millis >= 0 else {
            return info
        }
        let seconds = TimeInterval(millis) / 1000.0
        return RetryErrorInfo(
            errorType: info.errorType,
            retryAfterHint: seconds,
            isTimeout: info.isTimeout,
            backoffMultiplier: info.backoffMultiplier
        )
    }
}
