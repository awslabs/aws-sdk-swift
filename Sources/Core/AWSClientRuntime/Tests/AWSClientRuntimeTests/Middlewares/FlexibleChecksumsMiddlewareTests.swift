//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import Smithy
import SmithyChecksumsAPI
import SmithyHTTPAPI
import XCTest
import AwsCommonRuntimeKit
@_spi(SmithyReadWrite) import SmithyTestUtil
@testable import ClientRuntime
import class SmithyStreams.BufferedStream
import class SmithyChecksums.ChunkedStream
import enum SmithyChecksums.ChecksumMismatchException
import AWSClientRuntime

class FlexibleChecksumsMiddlewareTests: XCTestCase {
    private var builtContext: Context!
    private let testLogger = TestLogger()
    private var builder: OrchestratorBuilder<MockInput, MockOutput, SmithyHTTPAPI.HTTPRequest, SmithyHTTPAPI.HTTPResponse>!

    override func setUpWithError() throws {
        try super.setUpWithError()

        // Initialize function needs to be called before interacting with CRT
        CommonRuntimeKit.initialize()

        builtContext = ContextBuilder()
                  .withMethod(value: .get)
                  .withPath(value: "/")
                  .withOperation(value: "Test Operation")
                  .withLogger(value: testLogger)
                  .withRequestChecksumCalculation(value: .whenSupported)
                  .withResponseChecksumValidation(value: .whenSupported)
                  .build()
        var metricsAttributes = Attributes()
        metricsAttributes.set(key: OrchestratorMetricsAttributesKeys.service, value: "Service")
        metricsAttributes.set(key: OrchestratorMetricsAttributesKeys.method, value: "Method")
        builder = OrchestratorBuilder<MockInput, MockOutput, SmithyHTTPAPI.HTTPRequest, SmithyHTTPAPI.HTTPResponse>()
            .attributes(builtContext)
            .serialize(MockSerializeMiddleware(id: "TestMiddleware", headerName: "TestName", headerValue: "TestValue"))
            .deserialize(MockDeserializeMiddleware<MockOutput>(id: "TestDeserializeMiddleware", responseClosure: MockOutput.responseClosure(_:)))
            .telemetry(OrchestratorTelemetry(telemetryProvider: DefaultTelemetry.provider, metricsAttributes: metricsAttributes))
            .selectAuthScheme(SelectNoAuthScheme())
    }

    func testNormalPayloadSha256() async throws {
        let checksumAlgorithm = "sha256"
        let testData = ByteStream.data(Data("Hello world".utf8))
        setNormalPayload(payload: testData)
        addFlexibleChecksumsRequestMiddleware(true, checksumAlgorithm)
        addFlexibleChecksumsResponseMiddleware("ENABLED")
        try await AssertHeaderIsPresentAndValidationOccurs(
            expectedHeader: "x-amz-checksum-sha256",
            responseBody: testData,
            expectedChecksum: "ZOyIygCyaOW6GjVnihtTFtIS9PNmskdyMlNKiuyjfzw="
        )
    }

    func testNormalPayloadSha1() async throws {
        let checksumAlgorithm = "sha1"
        let testData = ByteStream.data(Data("Hello world".utf8))
        setNormalPayload(payload: testData)
        addFlexibleChecksumsRequestMiddleware(true, checksumAlgorithm)
        addFlexibleChecksumsResponseMiddleware("ENABLED")
        try await AssertHeaderIsPresentAndValidationOccurs(
            expectedHeader: "x-amz-checksum-sha1",
            responseBody: testData,
            expectedChecksum: "e1AsOh9IyGCa4hLN+2Od7jlnP14="
        )
    }

    func testNormalPayloadCRC32() async throws {
        let checksumAlgorithm = "crc32"
        let testData = ByteStream.data(Data("Hello world".utf8))
        setNormalPayload(payload: testData)
        addFlexibleChecksumsRequestMiddleware(true, checksumAlgorithm)
        addFlexibleChecksumsResponseMiddleware("ENABLED")
        try await AssertHeaderIsPresentAndValidationOccurs(
            expectedHeader: "x-amz-checksum-crc32",
            responseBody: testData,
            expectedChecksum: "i9aeUg=="
        )
    }

    func testNormalPayloadCRC32C() async throws {
        let checksumAlgorithm = "crc32c"
        let testData = ByteStream.data(Data("Hello world".utf8))
        setNormalPayload(payload: testData)
        addFlexibleChecksumsRequestMiddleware(true, checksumAlgorithm)
        addFlexibleChecksumsResponseMiddleware("ENABLED")
        try await AssertHeaderIsPresentAndValidationOccurs(
            expectedHeader: "x-amz-checksum-crc32c",
            responseBody: testData,
            expectedChecksum: "crUfeA=="
        )
    }

    func testNormalPayloadCRC64NVME() async throws {
        let checksumAlgorithm = "crc64nvme"
        let testData = ByteStream.data(Data("Hello world".utf8))
        setNormalPayload(payload: testData)
        addFlexibleChecksumsRequestMiddleware(true, checksumAlgorithm)
        addFlexibleChecksumsResponseMiddleware("ENABLED")
        try await AssertHeaderIsPresentAndValidationOccurs(
            expectedHeader: "x-amz-checksum-crc64nvme",
            responseBody: testData,
            expectedChecksum: "OOJZ0D8xKts="
        )
    }

    func testUseDefaultChecksumAlgorithm1() async throws {
        let testData = ByteStream.data(Data("Hello world".utf8))
        setNormalPayload(payload: testData)
        builder.attributes.responseChecksumValidation = .whenRequired
        addFlexibleChecksumsRequestMiddleware(false, nil)
        addFlexibleChecksumsResponseMiddleware("unset")
        try await AssertHeaderIsPresentAndValidationOccurs(
            expectedHeader: "x-amz-checksum-crc32",
            checkLogs: [
                "No algorithm chosen by user. Defaulting to CRC32 checksum algorithm.",
                "Checksum validation should not be performed! Skipping workflow..."
            ]
        )
    }

    func testUseDefaultChecksumAlgorithm2() async throws {
        let testData = ByteStream.data(Data("Hello world".utf8))
        setNormalPayload(payload: testData)
        builder.attributes.requestChecksumCalculation = .whenRequired
        builder.attributes.responseChecksumValidation = .whenRequired
        addFlexibleChecksumsRequestMiddleware(true, nil)
        addFlexibleChecksumsResponseMiddleware("ENABLED")
        try await AssertHeaderIsPresentAndValidationOccurs(
            expectedHeader: "x-amz-checksum-crc32",
            responseBody: testData,
            expectedChecksum: "i9aeUg==",
            checkLogs: [
                "No algorithm chosen by user. Defaulting to CRC32 checksum algorithm."
            ]
        )
    }

    func testNoRequestChecksumCalculation() async throws {
        let testData = ByteStream.data(Data("Hello, world!".utf8))
        setNormalPayload(payload: testData)
        builder.attributes.requestChecksumCalculation = .whenRequired
        addFlexibleChecksumsRequestMiddleware(false, nil)
        addFlexibleChecksumsResponseMiddleware("unset")
        try await AssertHeaderIsPresentAndValidationOccurs(
            checkLogs: [
                "Checksum not required for the operation.",
                "Client config `requestChecksumCalculation` set to `.whenRequired`",
                "No checksum algorithm chosen by the user. Skipping checksum calculation..."
            ]
        )
    }

    private func addFlexibleChecksumsRequestMiddleware(_ requestChecksumRequired: Bool, _ checksumAlgorithm: String?) {
        builder.interceptors.add(FlexibleChecksumsRequestMiddleware<MockInput, MockOutput>(requestChecksumRequired: requestChecksumRequired, checksumAlgorithm: checksumAlgorithm, checksumAlgoHeaderName: "x-amz-checksum-algorithm"))
    }

    private func addFlexibleChecksumsResponseMiddleware(_ validationMode: String, _ algosSupportedByOperation: [String] = []) {
        builder.interceptors.add(FlexibleChecksumsResponseMiddleware<MockInput, MockOutput>(
                validationMode: validationMode,
                algosSupportedByOperation: algosSupportedByOperation
        ))
    }

    private func setNormalPayload(payload: ByteStream) {
        // Set normal payload data
        builder.serialize({ input, builder, ctx in
            builder.withBody(payload)
        })
    }

    private func setStreamingPayload(payload: ByteStream, checksum: String) {
        // Set streaming payload
        builder.serialize({ input, builder, ctx in
            builder.withHeader(name: "x-amz-checksum-algorithm", value: "\(checksum.uppercased())")
                .withHeader(name: "Transfer-encoding", value: "chunked")
                .withBody(payload) // Set the payload data here
        })
    }

    func testBufferedStreamingPayloadCRC32() async throws {
        // Mock data to simulate the file content
        let mockData = Data(repeating: 0, count: 1_024 * 1_024) // 1MB of 0s
        let checksumAlgorithm = "crc32"
        let signingConfig = SigningConfig(algorithm: .signingV4, signatureType: .requestHeaders, service: "S3", region: "us-west-2")

        let testData = ByteStream.stream(try ChunkedStream(
            inputStream: BufferedStream(data: mockData, isClosed: true),
            signingConfig: signingConfig,
            previousSignature: "test-signature",
            trailingHeaders: Headers(),
            checksumString: checksumAlgorithm
        ))

        setStreamingPayload(payload: testData, checksum: checksumAlgorithm)

        addFlexibleChecksumsRequestMiddleware(true, checksumAlgorithm)
        addFlexibleChecksumsResponseMiddleware("ENABLED")
        try await AssertionsWhenStreaming(
            expectedHeader: "x-amz-checksum-crc32",
            responseBody: testData,
            expectedChecksumAlgorithm: .crc32,
            expectedChecksum: "6+bG5g=="
        )
    }

    /*
     * Algorithm Selection Tests for Response
     */
    func testAlgorithmSelectionCase1() async throws -> () {
        let colA = ["crc64", "crc32", "crc32c"]
        let colB = ["crc32c", "crc32"]
        let validationMode = "unset"
        var colBHeaders = Headers()
        colB.forEach { checksum in
            colBHeaders.add(name: "x-amz-checksum-\(checksum)", value: "yKEG5Q==")
        }
        addFlexibleChecksumsResponseMiddleware(validationMode, colA)
        try await AssertValidationAsExpected(
            responseHeaders: colBHeaders,
            validationMode: true, // true since responseChecksumValidation is set to .whenSupported
            expectedValidationHeader: "x-amz-checksum-crc32c"
        )
    }

    func testAlgorithmSelectionCase2() async throws -> () {
        let colA = ["sha256", "crc32"]
        let validationMode = "ENABLED"
        var colBHeaders = Headers()
        // Add only sha256 header in response
        colBHeaders.add(name: "x-amz-checksum-sha256", value: "MV9b23bQeMQ7isAGTkoBZGErH853yGk0W/yUx1iU7dM=")
        addFlexibleChecksumsResponseMiddleware(validationMode, colA)
        try await AssertValidationAsExpected(
            responseHeaders: colBHeaders,
            validationMode: true,
            expectedValidationHeader: "x-amz-checksum-sha256"
        )
    }

    func testAlgorithmSelectionCase3() async throws -> () {
        let colA = ["sha256", "crc32"]
        let colB = ["crc32", "sha256"]
        let validationMode = "ENABLED"
        var colBHeaders = Headers()
        // Add both sha256 header and crc32 in response
        // Add expected crc32 checksum as value since it should take priority
        colB.forEach { checksum in
            colBHeaders.add(name: "x-amz-checksum-\(checksum)", value: "6+bG5g==")
        }
        addFlexibleChecksumsResponseMiddleware(validationMode, colA)
        try await AssertValidationAsExpected(
            responseHeaders: colBHeaders,
            validationMode: true,
            expectedValidationHeader: "x-amz-checksum-crc32"
        )
    }

    func testAlgorithmSelectionCase4() async throws -> () {
        let colA = ["crc32", "crc32c"]
        let validationMode = "unset"
        var colBHeaders = Headers()
        // crc64 is supported for this request (not included in colA array),
        //   so no validation should be performed, but we shouldnt error
        colBHeaders.add(name: "x-amz-checksum-crc64", value: "6+bG5g==")
        addFlexibleChecksumsResponseMiddleware(validationMode, colA)
        try await AssertValidationAsExpected(
            responseHeaders: colBHeaders,
            validationMode: false,
            expectedValidationHeader: nil
        )
    }

    func testNoResponseValidationOccurs() async throws -> () {
        let colA = ["crc32", "crc32c"]
        let validationMode = "unset"
        var colBHeaders = Headers()
        colBHeaders.add(name: "x-amz-checksum-crc32", value: "6+bG5g==")
        // Change responseChecksumValidation config to .whenRequired
        builder.attributes.responseChecksumValidation = .whenSupported
        addFlexibleChecksumsResponseMiddleware(validationMode, colA)
        // Since responseChecksumValidation config is set to .whenRequired and validationMode is not "ENABLED",
        //   no response checksum validation should occur.
        try await AssertValidationAsExpected(
            responseHeaders: colBHeaders,
            validationMode: true,
            expectedValidationHeader: "x-amz-checksum-crc32"
        )
    }

    func testChecksumMismatchException() async throws -> () {
        let validationMode = "ENABLED"
        var testHeaders = Headers()
        testHeaders.add(name: "x-amz-checksum-crc32", value: "AAAA==")
        addFlexibleChecksumsResponseMiddleware(validationMode)
        try await AssertValidationAsExpected(
            responseHeaders: testHeaders,
            validationMode: true,
            expectedValidationHeader: "x-amz-checksum-crc32",
            expectedChecksumMismatch: true
        )
    }

    private func AssertionsWhenStreaming(
        expectedHeader: String = "",
        responseBody: ByteStream = ByteStream.noStream,
        expectedChecksumAlgorithm: ChecksumAlgorithm? = nil,
        expectedChecksum: String = "",
        expectValidation: Bool = true,
        file: StaticString = #filePath, line: UInt = #line
    ) async throws -> () {
        var isChecksumValidated = false
        _ = try await builder.executeRequest({ (req, ctx) in
            let response = HTTPResponse(body: responseBody, statusCode: .ok)
            response.headers.add(name: expectedHeader, value: expectedChecksum)
            return response
        })
        .build()
        .execute(input: MockInput())

        XCTAssertEqual(
            self.builtContext.checksum,
            expectedChecksumAlgorithm, file: file, line: line
        )
        XCTAssertTrue(
            self.builtContext.isChunkedEligibleStream ?? false,
            "Stream is not 'chunked eligible'",
            file: file, line: line
        )
        if let validatedChecksum = self.builtContext.get(key: AttributeKey<String>(name: "ChecksumHeaderValidated")), validatedChecksum == expectedHeader {
            isChecksumValidated = true
        }
        if expectedChecksum != "" {
            // Assert that the expected checksum was validated
            XCTAssertTrue(isChecksumValidated, "Could not determine which checksum will be validated!", file: file, line: line)
        }
    }

    private func AssertHeaderIsPresentAndValidationOccurs(
        expectedHeader: String = "",
        responseBody: ByteStream = ByteStream.noStream,
        expectedChecksum: String = "",
        checkLogs: [String] = [],
        file: StaticString = #filePath, line: UInt = #line
    ) async throws -> Void {
        var isChecksumValidated = false
        _ = try await builder.executeRequest({ request, attrs in
            if expectedHeader != "" {
                XCTAssert(request.headers.value(for: expectedHeader) != nil, file: file, line: line)
            }
            let response = HTTPResponse(body: responseBody, statusCode: .ok)
            response.headers.add(name: expectedHeader, value: expectedChecksum)
            return response
        })
        .build()
        .execute(input: MockInput())

        // _ = try await stack.handleMiddleware(context: builtContext, input: MockInput(), next: mockHandler)

        if !checkLogs.isEmpty {
            checkLogs.forEach { expectedLog in
                let logFound = testLogger.messages.contains { $0.level == .debug && $0.message.contains(expectedLog) }
                XCTAssertTrue(logFound, "Expected log message \"\(expectedLog)\" not found", file: file, line: line)
            }
        }

        if let validatedChecksum = self.builtContext.get(key: AttributeKey<String>(name: "ChecksumHeaderValidated")), validatedChecksum == expectedHeader {
            isChecksumValidated = true
        }
        if expectedChecksum != "" {
            // Assert that the expected checksum was validated
            XCTAssertTrue(isChecksumValidated, "Checksum was not validated as expected.", file: file, line: line)
        }
    }

    private func AssertValidationAsExpected(
        responseHeaders: Headers,
        validationMode: Bool,
        expectedValidationHeader: String?,
        expectedChecksumMismatch: Bool = false,
        file: StaticString = #filePath, line: UInt = #line
    ) async throws -> Void {
        var isChecksumValidated = false
        var validatedChecksum: String? = nil

        if expectedChecksumMismatch {
            await XCTAssertThrowsErrorAsync(try await handleMiddleware()) {
                XCTAssert($0 is ChecksumMismatchException, file: file, line: line)
            }
        } else {
            try await handleMiddleware()
            validatedChecksum = self.builtContext.get(key: AttributeKey<String>(name: "ChecksumHeaderValidated"))
            if validatedChecksum != nil && validatedChecksum == expectedValidationHeader {
                isChecksumValidated = true
            }
            // Assert that the expected checksum was validated or validation was not performed
            XCTAssert(isChecksumValidated == validationMode, "Checksum was not validated as expected", file: file, line: line)
            XCTAssert(validatedChecksum == expectedValidationHeader, "Checksum did not match expected", file: file, line: line)
        }

        func handleMiddleware() async throws {
            _ = try await builder.executeRequest({ request, attributes in
                let response = HTTPResponse(body: ByteStream.data(Data("Hello, world!".utf8)), statusCode: .ok)
                response.headers.addAll(headers: responseHeaders)
                return response
            })
            .build()
            .execute(input: MockInput())
        }
    }

    func testPutRequestWithCRC32ChecksumAndUnsignedPayload() async throws {
        let checksumAlgorithm = "crc32"
        let testData = ByteStream.data(Data("Hello world".utf8))
        let expectedChecksumSHA256 = "ZOyIygCyaOW6GjVnihtTFtIS9PNmskdyMlNKiuyjfzw="
        let signingConfig = SigningConfig(algorithm: .signingV4, signatureType: .requestHeaders, service: "S3", region: "us-west-2", signedBodyValue: .unsignedPayload)
        setPutPayload(payload: testData, checksumSHA256: expectedChecksumSHA256, signingConfig: signingConfig)
        addFlexibleChecksumsRequestMiddleware(true, checksumAlgorithm)
        try await assertPutRequestHeaders(expectedChecksumSHA256: expectedChecksumSHA256)
    }

    private func setPutPayload(payload: ByteStream, checksumSHA256: String, signingConfig: SigningConfig) {
        // Set PUT payload and headers
        builder.serialize({ input, builder, attributes in
            attributes.set(key: AttributeKey<SigningConfig>(name: "SigningConfig"), value: signingConfig)
            builder.withHeader(name: "x-amz-content-sha256", value: "UNSIGNED-PAYLOAD")
                .withHeader(name: "x-amz-checksum-sha256", value: checksumSHA256)
                .withBody(payload) // Set the payload data here
        })
    }

    private func assertPutRequestHeaders(expectedChecksumSHA256: String) async throws {
        _ = try await builder.executeRequest({ request, attributes in
            XCTAssertEqual(request.headers.value(for: "x-amz-content-sha256"), "UNSIGNED-PAYLOAD")
            XCTAssertEqual(request.headers.value(for: "x-amz-checksum-sha256"), expectedChecksumSHA256)
            return HTTPResponse(body: ByteStream.noStream, statusCode: HTTPStatusCode.ok)
        })
        .build()
        .execute(input: MockInput())
    }

}

class TestLogger: LogAgent {
    var name: String

    var messages: [(level: LogAgentLevel, message: String)] = []

    init(name: String = "Test", messages: [(level: LogAgentLevel, message: String)] = [], level: LogAgentLevel = .debug) {
        self.name = name
        self.messages = messages
    }

    func log(level: LogAgentLevel = .debug, message: @autoclosure () -> String, metadata: @autoclosure () -> [String : String]? = nil, source: @autoclosure () -> String = "ChecksumUnitTests", file: String = #file, function: String = #function, line: UInt = #line) {
        messages.append((level: level, message: message()))
    }
}

/// An async version of `XCTAssertThrowsError`.
func XCTAssertThrowsErrorAsync(
    _ exp: @autoclosure () async throws -> Void,
    _ block: (Error) -> Void
) async {
    do {
        try await exp()
        XCTFail("Should have thrown error")
    } catch {
        block(error)
    }
}
