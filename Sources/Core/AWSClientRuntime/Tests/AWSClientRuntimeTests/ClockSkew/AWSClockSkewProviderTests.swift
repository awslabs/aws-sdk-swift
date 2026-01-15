//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import AWSClientRuntime
import XCTest
import Smithy
import ClientRuntime
import SmithyHTTPAPI
@_spi(SmithyTimestamps) import SmithyTimestamps

class AWSClockSkewProviderTests: XCTestCase {

    // MARK: - nil previous clock skew

    func test_clockSkewError_returnsNilWhenClientAndServerTimeAreTheSame() {
        let previousClockSkew: TimeInterval? = nil
        let client = "Sun, 02 Jan 2000 20:34:56.000 GMT"
        let server = "Sun, 02 Jan 2000 20:34:56.000 GMT"
        let clientDate = TimestampFormatter(format: .httpDate).date(from: client)!
        let request = HTTPRequestBuilder().withMethod(.get).withSignedAt(clientDate).build()
        let response = HTTPResponse(headers: Headers(["Date": server]), body: ByteStream.noStream, statusCode: .badRequest)
        let error = ClockSkewTestError.definite
        XCTAssertNil(AWSClockSkewProvider.provider()(request, response, error, previousClockSkew))
    }

    func test_clockSkewError_returnsNilWhenClientAndServerTimeAreDifferentByLessThanThreshold() {
        let previousClockSkew: TimeInterval? = nil
        let client = "Sun, 02 Jan 2000 20:35:26.000 GMT" // +30 seconds
        let server = "Sun, 02 Jan 2000 20:34:56.000 GMT"
        let clientDate = TimestampFormatter(format: .httpDate).date(from: client)!
        let request = HTTPRequestBuilder().withMethod(.get).withSignedAt(clientDate).build()
        let response = HTTPResponse(headers: Headers(["Date": server]), body: ByteStream.noStream, statusCode: .badRequest)
        let error = ClockSkewTestError.definite
        XCTAssertNil(AWSClockSkewProvider.provider()(request, response, error, previousClockSkew))
    }

    func test_clockSkewError_returnsIntervalWhenClientAndServerTimeAreDifferentByMoreThanThreshold() {
        let previousClockSkew: TimeInterval? = nil
        let client = "Sun, 02 Jan 2000 20:44:56.000 GMT" // server + 600 seconds
        let server = "Sun, 02 Jan 2000 20:34:56.000 GMT"
        let clientDate = TimestampFormatter(format: .httpDate).date(from: client)!
        let request = HTTPRequestBuilder().withMethod(.get).withSignedAt(clientDate).build()
        let response = HTTPResponse(headers: Headers(["Date": server]), body: ByteStream.noStream, statusCode: .badRequest)
        let error = ClockSkewTestError.definite
        XCTAssertEqual(AWSClockSkewProvider.provider()(request, response, error, previousClockSkew), -600.0)
    }

    func test_nonClockSkewError_returnsNilWhenClientAndServerTimeAreTheSame() {
        let previousClockSkew: TimeInterval? = nil
        let client = "Sun, 02 Jan 2000 20:34:56.000 GMT"
        let server = "Sun, 02 Jan 2000 20:34:56.000 GMT"
        let clientDate = TimestampFormatter(format: .httpDate).date(from: client)!
        let request = HTTPRequestBuilder().withMethod(.get).withSignedAt(clientDate).build()
        let response = HTTPResponse(headers: Headers(["Date": server]), body: ByteStream.noStream, statusCode: .badRequest)
        let error = ClockSkewTestError.notDueToClockSkew
        XCTAssertNil(AWSClockSkewProvider.provider()(request, response, error, previousClockSkew))
    }

    func test_nonClockSkewError_returnsNilWhenClientAndServerTimeAreDifferentByLessThanThreshold() {
        let previousClockSkew: TimeInterval? = nil
        let client = "Sun, 02 Jan 2000 20:35:26.000 GMT" // +30 seconds
        let server = "Sun, 02 Jan 2000 20:34:56.000 GMT"
        let clientDate = TimestampFormatter(format: .httpDate).date(from: client)!
        let request = HTTPRequestBuilder().withMethod(.get).withSignedAt(clientDate).build()
        let response = HTTPResponse(headers: Headers(["Date": server]), body: ByteStream.noStream, statusCode: .badRequest)
        let error = ClockSkewTestError.notDueToClockSkew
        XCTAssertNil(AWSClockSkewProvider.provider()(request, response, error, previousClockSkew))
    }

    func test_nonClockSkewError_returnsNilWhenClientAndServerTimeAreDifferentByMoreThanThreshold() {
        let previousClockSkew: TimeInterval? = nil
        let client = "Sun, 02 Jan 2000 20:36:26.000 GMT" // +90 seconds
        let server = "Sun, 02 Jan 2000 20:34:56.000 GMT"
        let clientDate = TimestampFormatter(format: .httpDate).date(from: client)!
        let request = HTTPRequestBuilder().withMethod(.get).withSignedAt(clientDate).build()
        let response = HTTPResponse(headers: Headers(["Date": server]), body: ByteStream.noStream, statusCode: .badRequest)
        let error = ClockSkewTestError.notDueToClockSkew
        XCTAssertNil(AWSClockSkewProvider.provider()(request, response, error, previousClockSkew))
    }

    func test_headRequest_returnsNilWhenClientAndServerTimeAreTheSame() {
        let previousClockSkew: TimeInterval? = nil
        let client = "Sun, 02 Jan 2000 20:34:56.000 GMT"
        let server = "Sun, 02 Jan 2000 20:34:56.000 GMT"
        let clientDate = TimestampFormatter(format: .httpDate).date(from: client)!
        let request = HTTPRequestBuilder().withMethod(.head).withSignedAt(clientDate).build()
        let response = HTTPResponse(headers: Headers(["Date": server]), body: ByteStream.noStream, statusCode: .badRequest)
        let error = ClockSkewTestError.notDueToClockSkew
        XCTAssertNil(AWSClockSkewProvider.provider()(request, response, error, previousClockSkew))
    }

    func test_headRequest_returnsNilWhenClientAndServerTimeAreDifferentByLessThanThreshold() {
        let previousClockSkew: TimeInterval? = nil
        let client = "Sun, 02 Jan 2000 20:35:26.000 GMT" // +30 seconds
        let server = "Sun, 02 Jan 2000 20:34:56.000 GMT"
        let clientDate = TimestampFormatter(format: .httpDate).date(from: client)!
        let request = HTTPRequestBuilder().withMethod(.head).withSignedAt(clientDate).build()
        let response = HTTPResponse(headers: Headers(["Date": server]), body: ByteStream.noStream, statusCode: .badRequest)
        let error = ClockSkewTestError.notDueToClockSkew
        XCTAssertNil(AWSClockSkewProvider.provider()(request, response, error, previousClockSkew))
    }

    func test_headRequest_returnsIntervalWhenClientAndServerTimeAreDifferentByMoreThanThreshold() {
        let previousClockSkew: TimeInterval? = nil
        let client = "Sun, 02 Jan 2000 20:44:56.000 GMT" // server + 600 seconds
        let server = "Sun, 02 Jan 2000 20:34:56.000 GMT"
        let clientDate = TimestampFormatter(format: .httpDate).date(from: client)!
        let request = HTTPRequestBuilder().withMethod(.head).withSignedAt(clientDate).build()
        let response = HTTPResponse(headers: Headers(["Date": server]), body: ByteStream.noStream, statusCode: .badRequest)
        let error = ClockSkewTestError.notDueToClockSkew
        XCTAssertEqual(AWSClockSkewProvider.provider()(request, response, error, previousClockSkew), -600.0)
    }

    // MARK: - Non-nil previous clock skew

    func test_nonNilPrevious_returnsNilWhenNewClockSkewIsNil() {
        let previousClockSkew: TimeInterval = -400.0
        let client = "Sun, 02 Jan 2000 20:34:56.000 GMT" // server + 0 seconds
        let server = "Sun, 02 Jan 2000 20:34:56.000 GMT"
        let clientDate = TimestampFormatter(format: .httpDate).date(from: client)!
        let request = HTTPRequestBuilder().withMethod(.get).withSignedAt(clientDate).build()
        let response = HTTPResponse(headers: Headers(["Date": server]), body: ByteStream.noStream, statusCode: .badRequest)
        let error = ClockSkewTestError.definite
        XCTAssertEqual(AWSClockSkewProvider.provider()(request, response, error, previousClockSkew), nil)
    }

    func test_nonNilPrevious_returnsPreviousWhenClientAndServerTimeAreDifferentByLessThanThreshold() {
        let previousClockSkew: TimeInterval = -400.0
        let client = "Sun, 02 Jan 2000 20:40:56.000 GMT" // server + 360 seconds
        let server = "Sun, 02 Jan 2000 20:34:56.000 GMT"
        let clientDate = TimestampFormatter(format: .httpDate).date(from: client)!
        let request = HTTPRequestBuilder().withMethod(.get).withSignedAt(clientDate).build()
        let response = HTTPResponse(headers: Headers(["Date": server]), body: ByteStream.noStream, statusCode: .badRequest)
        let error = ClockSkewTestError.definite
        XCTAssertEqual(AWSClockSkewProvider.provider()(request, response, error, previousClockSkew), previousClockSkew)
    }

    func test_nonNilPrevious_returnsNewWhenClientAndServerTimeAreDifferentByMoreThanThreshold() {
        let previousClockSkew: TimeInterval = -400.0
        let client = "Sun, 02 Jan 2000 20:44:56.000 GMT" // server + 600 seconds
        let server = "Sun, 02 Jan 2000 20:34:56.000 GMT"
        let clientDate = TimestampFormatter(format: .httpDate).date(from: client)!
        let request = HTTPRequestBuilder().withMethod(.get).withSignedAt(clientDate).build()
        let response = HTTPResponse(headers: Headers(["Date": server]), body: ByteStream.noStream, statusCode: .badRequest)
        let error = ClockSkewTestError.definite
        XCTAssertEqual(AWSClockSkewProvider.provider()(request, response, error, previousClockSkew), -600.0)
    }

    func test_nonNilPrevious_returnsPreviousWhenErrorIsNotAClockSkewError() {
        let previousClockSkew: TimeInterval = -400.0
        let client = "Sun, 02 Jan 2000 20:44:56.000 GMT" // server + 600 seconds
        let server = "Sun, 02 Jan 2000 20:34:56.000 GMT"
        let clientDate = TimestampFormatter(format: .httpDate).date(from: client)!
        let request = HTTPRequestBuilder().withMethod(.get).withSignedAt(clientDate).build()
        let response = HTTPResponse(headers: Headers(["Date": server]), body: ByteStream.noStream, statusCode: .badRequest)
        let error = ClockSkewTestError.notDueToClockSkew
        XCTAssertEqual(AWSClockSkewProvider.provider()(request, response, error, previousClockSkew), previousClockSkew)
    }
}

private struct ClockSkewTestError: Error, ServiceError {
    static var definite: Self { .init(typeName: "RequestTimeTooSkewed") }
    static var notDueToClockSkew: Self { .init(typeName: "NotAClockSkewError") }

    var typeName: String?
    var message: String? = ""
}
