//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import enum SmithyChecksumsAPI.ChecksumAlgorithm
import enum SmithyChecksums.ChecksumMismatchException
import enum Smithy.ClientError
import struct Smithy.URIQueryItem
import class Smithy.Context
import struct Foundation.Data
import AwsCommonRuntimeKit
import AWSSDKChecksums
import ClientRuntime
import SmithyHTTPAPI

public struct FlexibleChecksumsRequestMiddleware<OperationStackInput, OperationStackOutput> {

    public let id: String = "FlexibleChecksumsRequestMiddleware"

    let requestChecksumRequired: Bool
    let checksumAlgorithm: String?
    let checksumAlgoHeaderName: String?

    public init(
        requestChecksumRequired: Bool,
        checksumAlgorithm: String?,
        checksumAlgoHeaderName: String?
    ) {
        self.requestChecksumRequired = requestChecksumRequired
        self.checksumAlgorithm = checksumAlgorithm
        self.checksumAlgoHeaderName = checksumAlgoHeaderName
    }

    private func addHeaders(builder: HTTPRequestBuilder, attributes: Context) async throws {
        // Initialize logger
        guard let logger = attributes.getLogger() else {
            throw ClientError.unknownError("No logger found!")
        }

        if case(.stream(let stream)) = builder.body {
            attributes.isChunkedEligibleStream = stream.isEligibleForChunkedStreaming
            if stream.isEligibleForChunkedStreaming {
                try builder.setAwsChunkedHeaders() // x-amz-decoded-content-length
            }
        } else if case(.noStream) = builder.body {
            logger.info("Request body is empty. Skipping request checksum calculation...")
            return
        }

        // E.g., prefix for x-amz-checksum-crc32
        let checksumHeaderPrefix = "x-amz-checksum-"

        if attributes.getFlowType() == .PRESIGN_URL {
            // Skip default request checksum calculation logic for PRESIGN_URL flow.
            return
        }

        // Check if any checksum header is already provided by the user
        if builder.headers.headers.contains(where: {
            $0.name.lowercased().starts(with: checksumHeaderPrefix) &&
            $0.name.lowercased() != checksumAlgoHeaderName?.lowercased()
        }) {
            logger.debug("Checksum header already provided by the user. Skipping calculation.")
            return
        }

        var checksumHashFunction: ChecksumAlgorithm
        if let checksumAlgorithm {
            // If checksum algorithm to use was configured via checksum algorithm input member by the user
            if let hashFunction = ChecksumAlgorithm.from(string: checksumAlgorithm) {
                // If user chose a supported algorithm, continue
                checksumHashFunction = hashFunction
            } else {
                // If user chose an unsupported algorithm, throw error
                throw ClientError.invalidValue("Error: Checksum algorithm \(checksumAlgorithm) is not supported!")
            }
        } else {
            // If user didn't choose an algorithm via checksum algorithm input member, then:
            if requestChecksumRequired || (attributes.requestChecksumCalculation == .whenSupported) {
                // If requestChecksumRequired == true OR RequestChecksumCalculation == when_supported, use CRC32 as default algorithm.
                checksumHashFunction = ChecksumAlgorithm.from(string: "crc32")!
                logger.info("No algorithm chosen by user. Defaulting to CRC32 checksum algorithm.")
                // If the input member tied to `requestAlgorithmMember` has `@httpHeader` trait in model,
                //   manually set the header with the name from `@httpHeader` trait with SDK's default algorithm: CRC32.
                // This needs to be manually added here because user didn't configure checksumAlgorithm but we're sending default checksum.
                // If user did set checksumAlgorithm in input, it would've been automatically added to requset as a header in serialize step.
                if let checksumAlgoHeaderName {
                    builder.updateHeader(name: checksumAlgoHeaderName, value: "crc32")
                }
            } else {
                // If requestChecksumRequired == false AND RequestChecksumCalculation == when_required, skip calculation.
                logger.info("Checksum not required for the operation.")
                logger.info("Client config `requestChecksumCalculation` set to `.whenRequired`")
                logger.info("No checksum algorithm chosen by the user. Skipping checksum calculation...")
                return
            }
        }

        // Save resolved ChecksumAlgorithm to interceptor context.
        attributes.checksum = checksumHashFunction

        // Determine the checksum header name
        let checksumHashHeaderName = "x-amz-checksum-\(checksumHashFunction)"
        logger.debug("Resolved checksum header name: \(checksumHashHeaderName)")

        // Handle body vs handle stream
        switch builder.body {
        case .data(let data):
            try await calculateAndAddChecksumHeader(data: data)
        case .stream(let stream):
            if stream.isEligibleForChunkedStreaming {
                // Handle calculating and adding checksum header in ChunkedStream
                builder.updateHeader(name: "x-amz-trailer", value: [checksumHashHeaderName])
            } else {
                // If not eligible for chunked streaming, calculate and add checksum to request header now instead of as a trailing header.
                let streamBytes: Data?
                if stream.isSeekable {
                    // Need to save current position to reset stream position after reading
                    let currentPosition = stream.position
                    try stream.seek(toOffset: 0) // Explicit seek to beginning for correct behavior of FileHandle
                    streamBytes = try stream.readToEnd()
                    // Reset stream position to where it was before reading it for checksum calculation
                    try stream.seek(toOffset: currentPosition)
                } else {
                    streamBytes = try await stream.readToEndAsync()
                    builder.withBody(.data(streamBytes)) // Reset request body with streamBytes to "refill" it
                }
                try await calculateAndAddChecksumHeader(data: streamBytes)
            }
        case .noStream:
            // Unreachable block since we return early if .noStream, but it's here for exhaustive switch case
            break
        }

        func calculateAndAddChecksumHeader(data: Data?) async throws {
            guard let data else {
                logger.info("Request body is empty. Skipping request checksum calculation...")
                return
            }
            if builder.headers.value(for: checksumHashHeaderName) == nil {
                logger.debug("Calculating request checksum")
            }
            // Create checksum instance
            let checksum = checksumHashFunction.createChecksum()
            // Pass data to hash
            try checksum.update(chunk: data)
            // Retrieve the hash
            let hash = try checksum.digest().toBase64String()
            builder.updateHeader(name: checksumHashHeaderName, value: [hash])
        }
    }
}

extension FlexibleChecksumsRequestMiddleware: Interceptor {
    public typealias InputType = OperationStackInput
    public typealias OutputType = OperationStackOutput
    public typealias RequestType = SmithyHTTPAPI.HTTPRequest
    public typealias ResponseType = HTTPResponse

    public func modifyBeforeRetryLoop(context: some MutableRequest<InputType, RequestType>) async throws {
        let builder = context.getRequest().toBuilder()
        try await addHeaders(builder: builder, attributes: context.getAttributes())
        context.updateRequest(updated: builder.build())
    }
}
