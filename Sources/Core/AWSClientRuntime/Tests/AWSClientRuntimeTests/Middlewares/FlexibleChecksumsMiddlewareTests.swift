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
import SmithyTestUtil
@testable import ClientRuntime
import class SmithyStreams.BufferedStream
import class SmithyChecksums.ChunkedStream
import enum SmithyChecksums.ChecksumMismatchException
import AWSClientRuntime

class FlexibleChecksumsMiddlewareTests: XCTestCase {
    private var builtContext: Context!
    private var stack: OperationStack<MockInput, MockOutput>!
    private let testLogger = TestLogger()

    override func setUpWithError() throws {
        try super.setUpWithError()

        // Initialize function needs to be called before interacting with CRT
        CommonRuntimeKit.initialize()

        builtContext = ContextBuilder()
                  .withMethod(value: .get)
                  .withPath(value: "/")
                  .withOperation(value: "Test Operation")
                  .withLogger(value: testLogger)
                  .build()
        stack = OperationStack<MockInput, MockOutput>(id: "Test Operation")
    }

    func testNormalPayloadSha256() async throws {
        let checksumAlgorithm = "sha256"
        let testData = ByteStream.data(Data("Hello, world!".utf8))
        setNormalPayload(payload: testData)
        addFlexibleChecksumsRequestMiddleware(checksumAlgorithm: checksumAlgorithm)
        addFlexibleChecksumsResponseMiddleware(validationMode: true)
        try await AssertHeaderIsPresentAndValidationOccurs(
            expectedHeader: "x-amz-checksum-sha256",
            responseBody: testData,
            expectedChecksum: "MV9b23bQeMQ7isAGTkoBZGErH853yGk0W/yUx1iU7dM="
        )
    }

    func testNormalPayloadSha1() async throws {
        let checksumAlgorithm = "sha1"
        let testData = ByteStream.data(Data("Hello, world!".utf8))
        setNormalPayload(payload: testData)
        addFlexibleChecksumsRequestMiddleware(checksumAlgorithm: checksumAlgorithm)
        addFlexibleChecksumsResponseMiddleware(validationMode: true)
        try await AssertHeaderIsPresentAndValidationOccurs(
            expectedHeader: "x-amz-checksum-sha1",
            responseBody: testData,
            expectedChecksum: "lDpwLQbzRZmu4fjajvn3KWAx1pk="
        )
    }

    func testNormalPayloadCRC32() async throws {
        let checksumAlgorithm = "crc32"
        let testData = ByteStream.data(Data("Hello, world!".utf8))
        setNormalPayload(payload: testData)
        addFlexibleChecksumsRequestMiddleware(checksumAlgorithm: checksumAlgorithm)
        addFlexibleChecksumsResponseMiddleware(validationMode: true)
        try await AssertHeaderIsPresentAndValidationOccurs(
            expectedHeader: "x-amz-checksum-crc32",
            responseBody: testData,
            expectedChecksum: "6+bG5g=="
        )
    }

    func testNormalPayloadCRC32C() async throws {
        let checksumAlgorithm = "crc32c"
        let testData = ByteStream.data(Data("Hello, world!".utf8))
        setNormalPayload(payload: testData)
        addFlexibleChecksumsRequestMiddleware(checksumAlgorithm: checksumAlgorithm)
        addFlexibleChecksumsResponseMiddleware(validationMode: true)
        try await AssertHeaderIsPresentAndValidationOccurs(
            expectedHeader: "x-amz-checksum-crc32c",
            responseBody: testData,
            expectedChecksum: "yKEG5Q=="
        )
    }

    func testNilChecksumAlgorithm() async throws {
        let testData = ByteStream.data(Data("Hello, world!".utf8))
        setNormalPayload(payload: testData)
        addFlexibleChecksumsRequestMiddleware(checksumAlgorithm: nil)
        addFlexibleChecksumsResponseMiddleware(validationMode: false)
        try await AssertHeaderIsPresentAndValidationOccurs(
            checkLogs: [
                "No checksum provided! Skipping flexible checksums workflow...",
                "Checksum validation should not be performed! Skipping workflow..."
            ]
        )
    }

    private func addFlexibleChecksumsRequestMiddleware(checksumAlgorithm: String?) {
        stack.serializeStep.intercept(
            position: .after,
            middleware: FlexibleChecksumsRequestMiddleware<MockInput, MockOutput>(checksumAlgorithm: checksumAlgorithm)
        )
    }

    private func addFlexibleChecksumsResponseMiddleware(validationMode: Bool, priorityList: [String] = []) {
        stack.deserializeStep.intercept(
            position: .after,
            middleware: FlexibleChecksumsResponseMiddleware<MockInput, MockOutput>(
                validationMode: validationMode,
                priorityList: priorityList
            )
        )
    }

    private func setNormalPayload(payload: ByteStream) {
        // Set normal payload data
        stack.serializeStep.intercept(position: .before, id: "set normal payload") { (context, input, next) -> OperationOutput<MockOutput> in
            input.builder.withBody(payload) // Set the payload data here
            return try await next.handle(context: context, input: input)
        }
    }

    private func setStreamingPayload(payload: ByteStream, checksum: String) {
        // Set streaming payload
        stack.serializeStep.intercept(position: .before, id: "set streaming payload") { (context, input, next) -> OperationOutput<MockOutput> in
            input.builder.withHeader(name: "x-amz-checksum-algorithm", value: "\(checksum.uppercased())")
            input.builder.withHeader(name: "Transfer-encoding", value: "chunked")
            input.builder.withBody(payload) // Set the payload data here
            return try await next.handle(context: context, input: input)
        }
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

        addFlexibleChecksumsRequestMiddleware(checksumAlgorithm: checksumAlgorithm)
        addFlexibleChecksumsResponseMiddleware(validationMode: true)
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
        let validationMode = false
        var colBHeaders = Headers()
        colB.forEach { checksum in
            colBHeaders.add(name: "x-amz-checksum-\(checksum)", value: "AAAAA")
        }
        addFlexibleChecksumsResponseMiddleware(validationMode: validationMode, priorityList: colA)
        try await AssertValidationAsExpected(
            responseHeaders: colBHeaders,
            validationMode: validationMode,
            expectedValidationHeader: nil
        )
    }

    func testAlgorithmSelectionCase2() async throws -> () {
        let colA = ["sha256", "crc32"]
        let validationMode = true
        var colBHeaders = Headers()
        // Add only sha256 header in response
        colBHeaders.add(name: "x-amz-checksum-sha256", value: "MV9b23bQeMQ7isAGTkoBZGErH853yGk0W/yUx1iU7dM=")
        addFlexibleChecksumsResponseMiddleware(validationMode: validationMode, priorityList: colA)
        try await AssertValidationAsExpected(
            responseHeaders: colBHeaders,
            validationMode: validationMode,
            expectedValidationHeader: "x-amz-checksum-sha256"
        )
    }

    func testAlgorithmSelectionCase3() async throws -> () {
        let colA = ["sha256", "crc32"]
        let colB = ["crc32", "sha256"]
        let validationMode = true
        var colBHeaders = Headers()
        // Add both sha256 header and crc32 in response
        // Add expected crc32 checksum as value since it should take priority
        colB.forEach { checksum in
            colBHeaders.add(name: "x-amz-checksum-\(checksum)", value: "6+bG5g==")
        }
        addFlexibleChecksumsResponseMiddleware(validationMode: validationMode, priorityList: colA)
        try await AssertValidationAsExpected(
            responseHeaders: colBHeaders,
            validationMode: validationMode,
            expectedValidationHeader: "x-amz-checksum-crc32"
        )
    }

    func testAlgorithmSelectionCase4() async throws -> () {
        let colA = ["crc32", "crc32c"]
        let validationMode = false
        var colBHeaders = Headers()
        // crc64 is not modeled in the service so no validation should be perforemd, but we shouldnt error
        colBHeaders.add(name: "x-amz-checksum-crc64", value: "6+bG5g==")
        addFlexibleChecksumsResponseMiddleware(validationMode: validationMode, priorityList: colA)
        try await AssertValidationAsExpected(
            responseHeaders: colBHeaders,
            validationMode: validationMode,
            expectedValidationHeader: nil
        )
    }

    func getChecksumMismatchException() async throws -> () {
        let validationMode = true
        var testHeaders = Headers()
        testHeaders.add(name: "x-amz-checksum-crc32", value: "AAAA==")
        addFlexibleChecksumsResponseMiddleware(validationMode: validationMode)
        try await AssertValidationAsExpected(
            responseHeaders: testHeaders,
            validationMode: validationMode,
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
        let mockHandler = MockHandler { (_, input) in
            let httpResponse = HttpResponse(body: responseBody, statusCode: HttpStatusCode.ok)
            httpResponse.headers.add(name: expectedHeader, value: expectedChecksum)
            let mockOutput = try await MockOutput.responseClosure(httpResponse)
            let output = OperationOutput<MockOutput>(httpResponse: httpResponse, output: mockOutput)
            XCTAssertEqual(output.httpResponse.headers.value(for: expectedHeader), expectedChecksum)
            return output
        }

        _ = try await stack.handleMiddleware(context: builtContext, input: MockInput(), next: mockHandler)

        XCTAssertEqual(
            self.builtContext.checksum,
            expectedChecksumAlgorithm, file: file, line: line
        )
        XCTAssertTrue(
            self.builtContext.isChunkedEligibleStream ?? false,
            "Stream is not 'chunked eligible'",
            file: file, line: line
        )
        if let validatedChecksum = self.builtContext.attributes.get(key: AttributeKey<String>(name: "ChecksumHeaderValidated")), validatedChecksum == expectedHeader {
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
        let mockHandler = MockHandler { (_, input) in
            if expectedHeader != "" {
                XCTAssert(input.headers.value(for: expectedHeader) != nil, file: file, line: line)
            }
            let httpResponse = HttpResponse(body: responseBody, statusCode: HttpStatusCode.ok)
            httpResponse.headers.add(name: expectedHeader, value: expectedChecksum)
            let mockOutput = try await MockOutput.responseClosure(httpResponse)
            let output = OperationOutput<MockOutput>(httpResponse: httpResponse, output: mockOutput)
            return output
        }

        _ = try await stack.handleMiddleware(context: builtContext, input: MockInput(), next: mockHandler)

        if !checkLogs.isEmpty {
            checkLogs.forEach { expectedLog in
                let logFound = testLogger.messages.contains { $0.level == .info && $0.message.contains(expectedLog) }
                XCTAssertTrue(logFound, "Expected log message \"\(expectedLog)\" not found", file: file, line: line)
            }
        }

        if let validatedChecksum = self.builtContext.attributes.get(key: AttributeKey<String>(name: "ChecksumHeaderValidated")), validatedChecksum == expectedHeader {
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
        let mockHandler = MockHandler { (_, input) in
            let responseBody = ByteStream.data(Data("Hello, world!".utf8))
            let httpResponse = HttpResponse(body: responseBody, statusCode: HttpStatusCode.ok)
            httpResponse.headers.addAll(headers: responseHeaders)
            let mockOutput = try await MockOutput.responseClosure(httpResponse)
            let output = OperationOutput<MockOutput>(httpResponse: httpResponse, output: mockOutput)
            return output
        }

        if expectedChecksumMismatch {
            await XCTAssertThrowsErrorAsync(try await handleMiddleware()) {
                XCTAssert($0 is ChecksumMismatchException, file: file, line: line)
            }
        } else {
            try await handleMiddleware()
            validatedChecksum = self.builtContext.attributes.get(key: AttributeKey<String>(name: "ChecksumHeaderValidated"))
            if validatedChecksum != nil && validatedChecksum == expectedValidationHeader {
                isChecksumValidated = true
            }
            // Assert that the expected checksum was validated or validation was not performed
            XCTAssert(isChecksumValidated == validationMode, "Checksum was not validated as expected", file: file, line: line)
            XCTAssert(validatedChecksum == expectedValidationHeader, "Checksum did not match expected", file: file, line: line)
        }

        func handleMiddleware() async throws {
            _ = try await stack.handleMiddleware(context: builtContext, input: MockInput(), next: mockHandler)
        }
    }

    func testPutRequestWithCRC32ChecksumAndUnsignedPayload() async throws {
        let checksumAlgorithm = "crc32"
        let testData = ByteStream.data(Data("Hello world".utf8))
        let expectedChecksumSHA256 = "ZOyIygCyaOW6GjVnihtTFtIS9PNmskdyMlNKiuyjfzw="
        let signingConfig = SigningConfig(algorithm: .signingV4, signatureType: .requestHeaders, service: "S3", region: "us-west-2", signedBodyValue: .unsignedPayload)
        setPutPayload(payload: testData, checksumSHA256: expectedChecksumSHA256, signingConfig: signingConfig)
        addFlexibleChecksumsRequestMiddleware(checksumAlgorithm: checksumAlgorithm)
        try await assertPutRequestHeaders(expectedChecksumSHA256: expectedChecksumSHA256)
    }

    private func setPutPayload(payload: ByteStream, checksumSHA256: String, signingConfig: SigningConfig) {
        // Set PUT payload and headers
        stack.serializeStep.intercept(position: .before, id: "set PUT payload") { (context, input, next) -> OperationOutput<MockOutput> in
            context.attributes.set(key: AttributeKey<SigningConfig>(name: "SigningConfig"), value: signingConfig)
            input.builder.withHeader(name: "x-amz-content-sha256", value: "UNSIGNED-PAYLOAD")
            input.builder.withHeader(name: "x-amz-checksum-sha256", value: checksumSHA256)
            input.builder.withBody(payload) // Set the payload data here
            return try await next.handle(context: context, input: input)
        }
    }

    private func assertPutRequestHeaders(expectedChecksumSHA256: String) async throws {
        let mockHandler = MockHandler { (context, input) -> OperationOutput<MockOutput> in
            // Verify that the request headers are correctly set
            XCTAssertEqual(input.headers.value(for: "x-amz-content-sha256"), "UNSIGNED-PAYLOAD")
            XCTAssertEqual(input.headers.value(for: "x-amz-checksum-sha256"), expectedChecksumSHA256)
            let httpResponse = HttpResponse(body: ByteStream.noStream, statusCode: HttpStatusCode.ok)
            let mockOutput = try await MockOutput.responseClosure(httpResponse)
            return OperationOutput<MockOutput>(httpResponse: httpResponse, output: mockOutput)
        }

        _ = try await stack.handleMiddleware(context: builtContext, input: MockInput(), next: mockHandler)
    }

}

class TestLogger: LogAgent {
    var name: String

    var messages: [(level: LogAgentLevel, message: String)] = []

    var level: LogAgentLevel

    init(name: String = "Test", messages: [(level: LogAgentLevel, message: String)] = [], level: LogAgentLevel = .info) {
        self.name = name
        self.messages = messages
        self.level = level
    }

    func log(level: LogAgentLevel = .info, message: String, metadata: [String : String]? = nil, source: String = "ChecksumUnitTests", file: String = #file, function: String = #function, line: UInt = #line) {
        messages.append((level: level, message: message))
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
