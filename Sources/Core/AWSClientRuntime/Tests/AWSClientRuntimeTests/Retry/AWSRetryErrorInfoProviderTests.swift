//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import SmithyHTTPAPI
import Foundation
import XCTest
import ClientRuntime
import enum AwsCommonRuntimeKit.CommonRunTimeError
import struct AwsCommonRuntimeKit.CRTError
@testable import AWSClientRuntime

class AWSRetryErrorInfoProviderTests: XCTestCase {

    // MARK: - Code-based error classification

    func test_throttlingErrorCodes_returnsAThrottlingErrorWhenErrorCodeMatches() {
        let throttlingErrorCodes = [
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
        for code in throttlingErrorCodes {
            let error = TestServiceError(code: code)
            let errorInfo = AWSRetryErrorInfoProvider.errorInfo(for: error)
            XCTAssertEqual(errorInfo?.errorType, .throttling)
        }
    }

    func test_transientErrorCodes_returnsATransientErrorWhenErrorCodeMatches() {
        let transientErrorCodes = [
            "RequestTimeout",
            "InternalError",
            "RequestTimeoutException",
        ]
        for code in transientErrorCodes {
            let error = TestServiceError(code: code)
            let errorInfo = AWSRetryErrorInfoProvider.errorInfo(for: error)
            XCTAssertEqual(errorInfo?.errorType, .transient)
        }
    }

    func test_transientHTTPErrors_returnsTransientErrorWhenHTTPStatusCodeMatches() throws {
        let transientStatusCodes = [500, 502, 503, 504]
        for statusCode in transientStatusCodes {
            let error = try TestHTTPError(statusCode: statusCode)
            let errorInfo = AWSRetryErrorInfoProvider.errorInfo(for: error)
            XCTAssertEqual(errorInfo?.errorType, .transient)
        }
    }

    func test_modeledIDPCommunicationError_returnsTransientError() {
        let error = ModeledIDPCommunicationError()
        let errorInfo = AWSRetryErrorInfoProvider.errorInfo(for: error)
        XCTAssertEqual(errorInfo?.errorType, .transient)
    }

    func test_crtErrors_returnsTransientErrorsForCRTErrorCodes() {
        let transientCRTErrorCodes: [Int32] = [
            2058, // httpConnectionClosed
            2070, // httpServerClosed
        ]
        for crtErrorCode in transientCRTErrorCodes {
            let error = CommonRunTimeError.crtError(CRTError(code: crtErrorCode))
            let errorInfo = AWSRetryErrorInfoProvider.errorInfo(for: error)
            XCTAssertEqual(errorInfo?.errorType, .transient)
        }
    }

    // MARK: - isTimeout

    func test_isTimeout_setsIsTimeoutWhenHTTPStatusCodeIndicatesTimeout() throws {
        let timeoutStatusCodes = [408, 504]
        for statusCode in timeoutStatusCodes {
            let error = try TestHTTPError(statusCode: statusCode)
            let errorInfo = AWSRetryErrorInfoProvider.errorInfo(for: error)
            XCTAssertEqual(errorInfo?.isTimeout, true)
        }
    }

    // MARK: - SEP 2.1: x-amz-retry-after header

    func test_retryAfterHeader_parsedAsMilliseconds() throws {
        let error = try TestHTTPError(statusCode: 500, headers: ["x-amz-retry-after": "1500"])
        let errorInfo = AWSRetryErrorInfoProvider.errorInfo(for: error)
        XCTAssertEqual(errorInfo?.retryAfterHint, 1.5)
    }

    func test_retryAfterHeader_zeroFallsBackToExponentialBackoff() throws {
        let error = try TestHTTPError(statusCode: 500, headers: ["x-amz-retry-after": "0"])
        let errorInfo = AWSRetryErrorInfoProvider.errorInfo(for: error)
        XCTAssertEqual(errorInfo?.retryAfterHint, 0.0)
    }

    func test_retryAfterHeader_invalidValueIgnored() throws {
        let error = try TestHTTPError(statusCode: 500, headers: ["x-amz-retry-after": "invalid"])
        let errorInfo = AWSRetryErrorInfoProvider.errorInfo(for: error)
        XCTAssertNil(errorInfo?.retryAfterHint)
    }

    func test_retryAfterHeader_missingHeaderIgnored() throws {
        let error = try TestHTTPError(statusCode: 500)
        let errorInfo = AWSRetryErrorInfoProvider.errorInfo(for: error)
        XCTAssertNil(errorInfo?.retryAfterHint)
    }

    // MARK: - SEP 2.1: Service-aware error info provider

    func test_errorInfoProvider_dynamoDB_setsBackoffMultiplier() throws {
        let provider = AWSRetryErrorInfoProvider.errorInfoProvider(sdkID: "DynamoDB")
        let error = try TestHTTPError(statusCode: 500)
        let errorInfo = provider(error)
        XCTAssertEqual(errorInfo?.backoffMultiplier, 0.025)
    }

    func test_errorInfoProvider_dynamDBStreams_setsBackoffMultiplier() throws {
        let provider = AWSRetryErrorInfoProvider.errorInfoProvider(sdkID: "DynamoDB Streams")
        let error = try TestHTTPError(statusCode: 500)
        let errorInfo = provider(error)
        XCTAssertEqual(errorInfo?.backoffMultiplier, 0.025)
    }

    func test_errorInfoProvider_dynamoDB_throttling_noBackoffMultiplier() {
        let provider = AWSRetryErrorInfoProvider.errorInfoProvider(sdkID: "DynamoDB")
        let error = TestServiceError(code: "ThrottlingException")
        let errorInfo = provider(error)
        XCTAssertNil(errorInfo?.backoffMultiplier)
    }

    func test_errorInfoProvider_nonDynamoDB_noBackoffMultiplier() throws {
        let provider = AWSRetryErrorInfoProvider.errorInfoProvider(sdkID: "S3")
        let error = try TestHTTPError(statusCode: 500)
        let errorInfo = provider(error)
        XCTAssertNil(errorInfo?.backoffMultiplier)
    }
}

private struct TestServiceError: ServiceError, Error {
    var typeName: String?
    var message: String?

    init(code: String) {
        self.typeName = code
        self.message = "Message: \(code)"
    }
}

private struct TestHTTPError: HTTPError, Error {
    var httpResponse: HTTPResponse

    init(statusCode: Int, headers: [String: String] = [:]) throws {
        let status = try XCTUnwrap(HTTPStatusCode(rawValue: statusCode))
        let httpHeaders = Headers(Dictionary(uniqueKeysWithValues: headers.map { ($0.key, [$0.value]) }))
        self.httpResponse = HTTPResponse(headers: httpHeaders, statusCode: status)
    }
}

// Serves as stand-in for STS's modeled IDPCommunicationError, which is supposed to be treated as transient
// even though it's not modeled as retryable.
private struct ModeledIDPCommunicationError: ModeledError, Error {
    static var typeName: String { "IDPCommunicationError" }
    static var fault: ErrorFault { .server }
    static var isRetryable: Bool { false }
    static var isThrottling: Bool { false }
}
