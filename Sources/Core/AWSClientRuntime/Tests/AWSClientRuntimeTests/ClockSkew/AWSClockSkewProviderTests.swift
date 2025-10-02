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

    func test_clockSkewError_returnsNilWhenClientAndServerTimeAreTheSame() {
        let client = "Sun, 02 Jan 2000 20:34:56.000 GMT"
        let server = "Sun, 02 Jan 2000 20:34:56.000 GMT"
        let clientDate = TimestampFormatter(format: .httpDate).date(from: client)!
        let request = HTTPRequestBuilder().withMethod(.get).withSignedAt(clientDate).build()
        let response = HTTPResponse(headers: Headers(["Date": server]), body: ByteStream.noStream, statusCode: .badRequest)
        let error = ClockSkewTestError.definite
        XCTAssertNil(AWSClockSkewProvider.clockSkew(request: request, response: response, error: error))
    }

    func test_clockSkewError_returnsNilWhenClientAndServerTimeAreDifferentByLessThanThreshold() {
        let client = "Sun, 02 Jan 2000 20:35:26.000 GMT" // +30 seconds
        let server = "Sun, 02 Jan 2000 20:34:56.000 GMT"
        let clientDate = TimestampFormatter(format: .httpDate).date(from: client)!
        let request = HTTPRequestBuilder().withMethod(.get).withSignedAt(clientDate).build()
        let response = HTTPResponse(headers: Headers(["Date": server]), body: ByteStream.noStream, statusCode: .badRequest)
        let error = ClockSkewTestError.definite
        XCTAssertNil(AWSClockSkewProvider.clockSkew(request: request, response: response, error: error))
    }

    func test_clockSkewError_returnsIntervalWhenClientAndServerTimeAreDifferentByMoreThanThreshold() {
        let client = "Sun, 02 Jan 2000 20:36:26.000 GMT" // +90 seconds
        let server = "Sun, 02 Jan 2000 20:34:56.000 GMT"
        let clientDate = TimestampFormatter(format: .httpDate).date(from: client)!
        let request = HTTPRequestBuilder().withMethod(.get).withSignedAt(clientDate).build()
        let response = HTTPResponse(headers: Headers(["Date": server]), body: ByteStream.noStream, statusCode: .badRequest)
        let error = ClockSkewTestError.definite
        XCTAssertEqual(AWSClockSkewProvider.clockSkew(request: request, response: response, error: error), -90.0)
    }

    func test_nonClockSkewError_returnsNilWhenClientAndServerTimeAreTheSame() {
        let client = "Sun, 02 Jan 2000 20:34:56.000 GMT"
        let server = "Sun, 02 Jan 2000 20:34:56.000 GMT"
        let clientDate = TimestampFormatter(format: .httpDate).date(from: client)!
        let request = HTTPRequestBuilder().withMethod(.get).withSignedAt(clientDate).build()
        let response = HTTPResponse(headers: Headers(["Date": server]), body: ByteStream.noStream, statusCode: .badRequest)
        let error = ClockSkewTestError.notDueToClockSkew
        XCTAssertNil(AWSClockSkewProvider.clockSkew(request: request, response: response, error: error))
    }

    func test_nonClockSkewError_returnsNilWhenClientAndServerTimeAreDifferentByLessThanThreshold() {
        let client = "Sun, 02 Jan 2000 20:35:26.000 GMT" // +30 seconds
        let server = "Sun, 02 Jan 2000 20:34:56.000 GMT"
        let clientDate = TimestampFormatter(format: .httpDate).date(from: client)!
        let request = HTTPRequestBuilder().withMethod(.get).withSignedAt(clientDate).build()
        let response = HTTPResponse(headers: Headers(["Date": server]), body: ByteStream.noStream, statusCode: .badRequest)
        let error = ClockSkewTestError.notDueToClockSkew
        XCTAssertNil(AWSClockSkewProvider.clockSkew(request: request, response: response, error: error))
    }

    func test_nonClockSkewError_returnsNilWhenClientAndServerTimeAreDifferentByMoreThanThreshold() {
        let client = "Sun, 02 Jan 2000 20:36:26.000 GMT" // +90 seconds
        let server = "Sun, 02 Jan 2000 20:34:56.000 GMT"
        let clientDate = TimestampFormatter(format: .httpDate).date(from: client)!
        let request = HTTPRequestBuilder().withMethod(.get).withSignedAt(clientDate).build()
        let response = HTTPResponse(headers: Headers(["Date": server]), body: ByteStream.noStream, statusCode: .badRequest)
        let error = ClockSkewTestError.notDueToClockSkew
        XCTAssertNil(AWSClockSkewProvider.clockSkew(request: request, response: response, error: error))
    }

    func test_headRequest_returnsNilWhenClientAndServerTimeAreTheSame() {
        let client = "Sun, 02 Jan 2000 20:34:56.000 GMT"
        let server = "Sun, 02 Jan 2000 20:34:56.000 GMT"
        let clientDate = TimestampFormatter(format: .httpDate).date(from: client)!
        let request = HTTPRequestBuilder().withMethod(.head).withSignedAt(clientDate).build()
        let response = HTTPResponse(headers: Headers(["Date": server]), body: ByteStream.noStream, statusCode: .badRequest)
        let error = ClockSkewTestError.notDueToClockSkew
        XCTAssertNil(AWSClockSkewProvider.clockSkew(request: request, response: response, error: error))
    }

    func test_headRequest_returnsNilWhenClientAndServerTimeAreDifferentByLessThanThreshold() {
        let client = "Sun, 02 Jan 2000 20:35:26.000 GMT" // +30 seconds
        let server = "Sun, 02 Jan 2000 20:34:56.000 GMT"
        let clientDate = TimestampFormatter(format: .httpDate).date(from: client)!
        let request = HTTPRequestBuilder().withMethod(.head).withSignedAt(clientDate).build()
        let response = HTTPResponse(headers: Headers(["Date": server]), body: ByteStream.noStream, statusCode: .badRequest)
        let error = ClockSkewTestError.notDueToClockSkew
        XCTAssertNil(AWSClockSkewProvider.clockSkew(request: request, response: response, error: error))
    }

    func test_headRequest_returnsIntervalWhenClientAndServerTimeAreDifferentByMoreThanThreshold() {
        let client = "Sun, 02 Jan 2000 20:36:26.000 GMT" // +90 seconds
        let server = "Sun, 02 Jan 2000 20:34:56.000 GMT"
        let clientDate = TimestampFormatter(format: .httpDate).date(from: client)!
        let request = HTTPRequestBuilder().withMethod(.head).withSignedAt(clientDate).build()
        let response = HTTPResponse(headers: Headers(["Date": server]), body: ByteStream.noStream, statusCode: .badRequest)
        let error = ClockSkewTestError.notDueToClockSkew
        XCTAssertEqual(AWSClockSkewProvider.clockSkew(request: request, response: response, error: error), -90.0)
    }
}

private struct ClockSkewTestError: Error, ServiceError {
    static var definite: Self { .init(typeName: "RequestTimeTooSkewed") }
    static var notDueToClockSkew: Self { .init(typeName: "NotAClockSkewError") }

    var typeName: String?
    var message: String? { "" }
}
