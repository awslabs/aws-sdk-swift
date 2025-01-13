// Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
// SPDX-License-Identifier: Apache-2.0.

import Smithy
import SmithyHTTPAPI
import enum SmithyChecksumsAPI.ChecksumAlgorithm
import enum SmithyChecksums.ChecksumMismatchException
import ClientRuntime
import struct Foundation.NSRange
import class Foundation.NSRegularExpression

public struct FlexibleChecksumsResponseMiddleware<OperationStackInput, OperationStackOutput> {

    public let id: String = "FlexibleChecksumsResponseMiddleware"

    // The priority to validate response checksums, if multiple are present
    let CHECKSUM_HEADER_VALIDATION_PRIORITY_LIST: [String] = [
        ChecksumAlgorithm.crc32c,
        .crc32,
        .crc64nvme,
        .sha1,
        .sha256
    ].sorted().map { $0.toString() }

    let validationMode: String
    let priorityList: [String]

    public init(validationMode: String, priorityList: [String] = []) {
        self.validationMode = validationMode
        self.priorityList = !priorityList.isEmpty
            ? withPriority(checksums: priorityList)
            : CHECKSUM_HEADER_VALIDATION_PRIORITY_LIST
    }

    private func validateChecksum(response: HTTPResponse, logger: any LogAgent, attributes: Context) async throws {
        // Exit if validation should not be performed
        if validationMode != "ENABLED" && attributes.responseChecksumValidation == .whenRequired {
            logger.info("Checksum validation should not be performed! Skipping workflow...")
            return
        }

        let checksumHeaderIsPresent = priorityList.first {
            response.headers.value(for: "x-amz-checksum-\($0)") != nil  &&
            // When retrieving an object uploaded using mutipart upload (MPU) and flexible checksum,
            //   S3 may return the checksum for the whole object (full object checksum)
            //   or the checksum of checksums (composite checksum).
            // Composite checksums end in "-#" where # is an integer between 1 and 10000, indicating number of parts the object
            //   was originally uploaded in.
            // The composite checksum should be ignored.
            !isCompositeChecksum(response.headers.value(for: "x-amz-checksum-\($0)")!)
        }

        guard let checksumHeader = checksumHeaderIsPresent else {
            let message =
                "User requested checksum validation, but the response headers did not contain any valid checksums"
            logger.warn(message)
            return
        }

        let fullChecksumHeader = "x-amz-checksum-" + checksumHeader

        logger.debug("Validating checksum from \(fullChecksumHeader)")
        attributes.set(key: AttributeKey<String>(name: "ChecksumHeaderValidated"), value: fullChecksumHeader)

        let checksumString = checksumHeader.removePrefix("x-amz-checksum-")
        guard let responseChecksum = ChecksumAlgorithm.from(string: checksumString) else {
            throw ClientError.dataNotFound("Checksum found in header is not supported!")
        }

        guard let expectedChecksum = response.headers.value(for: fullChecksumHeader) else {
            throw ClientError.dataNotFound("Could not determine the expected checksum!")
        }

        // Handle body vs handle stream
        switch response.body {
        case .data(let data):
            guard let data else {
                logger.info("Response body is empty. Skipping response checksum validation...")
                return
            }

            let responseChecksumHasher = responseChecksum.createChecksum()
            try responseChecksumHasher.update(chunk: data)
            let actualChecksum = try responseChecksumHasher.digest().toBase64String()

            guard expectedChecksum == actualChecksum else {
                let message = "Checksum mismatch. Expected \(expectedChecksum) but was \(actualChecksum)"
                throw ChecksumMismatchException.message(message)
            }
        case .stream(let stream):
            let validatingStream = ByteStream.getChecksumValidatingBody(
                stream: stream,
                expectedChecksum: expectedChecksum,
                checksumAlgorithm: responseChecksum
            )

            // Set the response to a validating stream
            attributes.httpResponse = response
            attributes.httpResponse?.body = validatingStream
        case .noStream:
            logger.info("Response body is empty. Skipping response checksum validation...")
            return
        }
    }

    // Returns true if input string ends in "-#" where "#" is an integer between 1 and 10000, inclusive.
    private func isCompositeChecksum(_ input: String) -> Bool {
        let regex = "-([1-9][0-9]{0,3}|10000)$"
        let range = NSRange(input.startIndex..<input.endIndex, in: input)
        let regexMatch = try? NSRegularExpression(pattern: regex)
        return regexMatch?.firstMatch(in: input, options: [], range: range) != nil
    }
}

extension FlexibleChecksumsResponseMiddleware: Interceptor {
    public typealias InputType = OperationStackInput
    public typealias OutputType = OperationStackOutput
    public typealias RequestType = HTTPRequest
    public typealias ResponseType = HTTPResponse

    public func modifyBeforeRetryLoop(context: some MutableRequest<InputType, RequestType>) async throws {
        context.getAttributes().set(key: AttributeKey<String>(name: "ChecksumHeaderValidated"), value: nil)
    }

    public func modifyBeforeDeserialization(
        context: some MutableResponse<InputType, RequestType, ResponseType>
    ) async throws {
        guard let logger = context.getAttributes().getLogger() else {
            throw ClientError.unknownError("No logger found!")
        }

        let response = context.getResponse()
        try await validateChecksum(response: response, logger: logger, attributes: context.getAttributes())
        context.updateResponse(updated: response)
    }
}

private func withPriority(checksums: [String]) -> [String] {
    let checksumsMap = checksums.compactMap { ChecksumAlgorithm.from(string: $0) }
    return checksumsMap.sorted().map { $0.toString() }
}
