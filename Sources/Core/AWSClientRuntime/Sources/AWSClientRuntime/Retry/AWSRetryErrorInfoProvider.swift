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

    // "IDPCommunicationError" is retryable only for STS clients.
    private static let stsOnlyTransientErrorCodes = [
        "IDPCommunicationError",
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

    public static func errorInfoProvider(sdkID: String) -> (Error) -> RetryErrorInfo? {
        let isDynamoDB = sdkID == "DynamoDB" || sdkID == "DynamoDB Streams"
        let isSTS = sdkID == "STS"
        return { error in
            // Always runs; not gated.
            if isSTS, isSTSOnlyTransient(error) {
                return applyRetryAfterHeader(
                    info: RetryErrorInfo(errorType: .transient, retryAfterHint: nil, isTimeout: false),
                    error: error
                )
            }
            guard var info = errorInfo(for: error) else { return nil }
            if AWSRetryFeatures.isNewRetries2026Enabled,
               isDynamoDB, info.errorType != .throttling {
                info.backoffMultiplier = 0.025
            }
            return info
        }
    }

    private static func isSTSOnlyTransient(_ error: Error) -> Bool {
        if let serviceError = error as? ServiceError, let code = serviceError.typeName,
           stsOnlyTransientErrorCodes.contains(code) {
            return true
        }
        if let modeledError = error as? ModeledError,
           stsOnlyTransientErrorCodes.contains(type(of: modeledError).typeName) {
            return true
        }
        return false
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

        // If custom AWS error matching fails, use the default error info provider to finish matching.
        return DefaultRetryErrorInfoProvider.errorInfo(for: error)
    }

    /// Parses `x-amz-retry-after` header (milliseconds) and applies it as retryAfterHint.
    private static func applyRetryAfterHeader(info: RetryErrorInfo, error: Error) -> RetryErrorInfo {
        guard AWSRetryFeatures.isNewRetries2026Enabled else { return info }
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
