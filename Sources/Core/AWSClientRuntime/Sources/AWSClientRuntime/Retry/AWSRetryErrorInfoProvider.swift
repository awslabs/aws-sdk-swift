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
import struct SmithyRetriesAPI.RetryStrategyOptions

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

    // HTTP status codes that should be treated as throttling when the error is not a modeled error.
    private static let throttlingStatusCodes = [429]

    /// Returns an error info provider that uses Retry Behavior 2.1.
    ///
    /// This assumes a non-legacy retry mode.  Use `errorInfoProvider(sdkID:retryStrategyOptions:)`
    /// to follow the client's retry strategy options.
    public static func errorInfoProvider(sdkID: String) -> (Error) -> RetryErrorInfo? {
        errorInfoProvider(sdkID: sdkID, useNewRetries: true)
    }

    /// Returns an error info provider that follows the passed retry strategy options.
    ///
    /// When `retryStrategyOptions.useNewRetries2026` is `false` (the `legacy` retry mode), the
    /// `x-amz-retry-after` header is ignored and no DynamoDB backoff multiplier is set.
    public static func errorInfoProvider(
        sdkID: String,
        retryStrategyOptions: RetryStrategyOptions
    ) -> (Error) -> RetryErrorInfo? {
        errorInfoProvider(sdkID: sdkID, useNewRetries: retryStrategyOptions.useNewRetries2026)
    }

    private static func errorInfoProvider(sdkID: String, useNewRetries: Bool) -> (Error) -> RetryErrorInfo? {
        let isDynamoDB = sdkID == "DynamoDB" || sdkID == "DynamoDB Streams"
        let isSTS = sdkID == "STS"
        return { error in
            if isSTS, isSTSOnlyTransient(error) {
                return applyRetryAfterHeader(
                    info: RetryErrorInfo(errorType: .transient, retryAfterHint: nil, isTimeout: false),
                    error: error,
                    useNewRetries: useNewRetries
                )
            }
            guard var info = errorInfo(for: error, useNewRetries: useNewRetries) else { return nil }
            if useNewRetries, isDynamoDB, info.errorType != .throttling {
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

    /// Returns retry info for the error using Retry Behavior 2.1.
    ///
    /// This assumes a non-legacy retry mode.
    public static func errorInfo(for error: Error) -> RetryErrorInfo? {
        errorInfo(for: error, useNewRetries: true)
    }

    private static func errorInfo(for error: Error, useNewRetries: Bool) -> RetryErrorInfo? {

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
                    error: error,
                    useNewRetries: useNewRetries
                )
            }
        }

        if let serviceError = error as? ServiceError, let code = serviceError.typeName {
            // Handle the throttling error codes as errors of retry type "throttling".
            if throttlingErrorCodes.contains(code) {
                return applyRetryAfterHeader(
                    info: RetryErrorInfo(errorType: .throttling, retryAfterHint: nil, isTimeout: false),
                    error: error,
                    useNewRetries: useNewRetries
                )
            }
            // Handle the transient error codes as errors of retry type "transient".
            if transientErrorCodes.contains(code) {
                return applyRetryAfterHeader(
                    info: RetryErrorInfo(errorType: .transient, retryAfterHint: nil, isTimeout: isTimeout),
                    error: error,
                    useNewRetries: useNewRetries
                )
            }
        }

        if let httpError = error as? HTTPError {
            // Handle the transient and timeout HTTP status codes as errors of retry type "transient".
            if (transientStatusCodes + timeoutStatusCodes).contains(httpError.httpResponse.statusCode.rawValue) {
                return applyRetryAfterHeader(
                    info: RetryErrorInfo(errorType: .transient, retryAfterHint: nil, isTimeout: isTimeout),
                    error: error,
                    useNewRetries: useNewRetries
                )
            }
            // Handle a 429 that is not a modeled error as an error of retry type "throttling".
            // A modeled error is left to the default error info provider, so its modeled retryability wins.
            // The `legacy` retry mode does not retry a 429 that is not a modeled error.
            if !(error is ModeledError),
               throttlingStatusCodes.contains(httpError.httpResponse.statusCode.rawValue) {
                guard useNewRetries else { return nil }
                return applyRetryAfterHeader(
                    info: RetryErrorInfo(errorType: .throttling, retryAfterHint: nil, isTimeout: false),
                    error: error,
                    useNewRetries: useNewRetries
                )
            }
        }

        // If custom AWS error matching fails, use the default error info provider to finish matching.
        guard let info = DefaultRetryErrorInfoProvider.errorInfo(for: error) else { return nil }
        return applyRetryAfterHeader(info: info, error: error, useNewRetries: useNewRetries)
    }

    /// Parses `x-amz-retry-after` header (milliseconds) and applies it as retryAfterHint.
    /// The header is ignored when `useNewRetries` is `false`.
    private static func applyRetryAfterHeader(
        info: RetryErrorInfo,
        error: Error,
        useNewRetries: Bool
    ) -> RetryErrorInfo {
        guard useNewRetries else { return info }
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
