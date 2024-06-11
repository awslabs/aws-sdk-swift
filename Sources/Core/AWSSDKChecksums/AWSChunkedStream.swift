//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import protocol Smithy.Stream
import struct SmithyHTTPAPI.Headers
import enum SmithyChecksumsAPI.ChecksumAlgorithm
import struct Foundation.Data
import AwsCommonRuntimeKit

/// Reads data from the input stream, chunks it, and passes it out through its output stream.
///
/// URLSessionHTTPClient streams chunked payloads using this stream type.
/// CRTClientEngine uses only the reader provided by this type to create chunks, then it
/// streams them itself.
class AWSChunkedStream {
    private var inputStream: Stream
    private var signingConfig: SigningConfig
    private var previousSignature: String
    private var trailingHeaders: Headers
    var chunkedReader: AWSChunkedReader
    private var outputStream = BufferedStream()

    /// Actor used for ensuring stream reads are performed in order and one at a time.
    private actor ReadCoordinator {
        /// The most recent task performed by this actor.
        private var task: Task<Data?, Error>?

        /// Perform a new unit of work, after previously scheduled work has completed.
        func add(_ block: @escaping () async throws -> Data?) async throws -> Data? {
            let prevTask = self.task
            let task = Task {
                _ = await prevTask?.result
                return try await block()
            }
            self.task = task
            return try await task.value
        }
    }

    /// The actor instance used by this AWSChunkedStream to enforce reading in series.
    private let readCoordinator = ReadCoordinator()

    init(
        inputStream: Stream,
        signingConfig: SigningConfig,
        previousSignature: String,
        trailingHeaders: Headers,
        checksumString: String? = nil
    ) throws {
        self.inputStream = inputStream
        self.signingConfig = signingConfig
        self.previousSignature = previousSignature
        self.trailingHeaders = trailingHeaders

        // Determine the checksum algorithm, if provided
        let checksumAlgorithm: ChecksumAlgorithm?
        if let checksumString = checksumString {
            checksumAlgorithm = ChecksumAlgorithm.from(string: checksumString)

            // Unsupported checksum
            if checksumAlgorithm == nil {
                throw UnknownChecksumError.notSupported(checksum: checksumString)
            }
        } else {
            checksumAlgorithm = nil
        }

        self.chunkedReader = AWSChunkedReader(
            stream: self.inputStream,
            signingConfig: self.signingConfig,
            previousSignature: self.previousSignature,
            trailingHeaders: self.trailingHeaders,
            checksumAlgorithm: checksumAlgorithm
        )
    }
}

extension AWSChunkedStream: Stream {

    /// Writes data to the input stream.
    /// - Parameter data: The data to be written.
    func write(contentsOf data: Data) throws {
        try inputStream.write(contentsOf: data)
    }

    /// Closes the input stream.
    ///
    /// The output stream will close once the input stream closes, and all data from the
    /// input stream has been chunked.
    func close() {
        inputStream.close()
    }

    func closeWithError(_ error: any Error) {
        inputStream.closeWithError(error)
    }

    var position: Data.Index {
        self.inputStream.position
    }

    /// Returns the length of the _input_ stream.
    var length: Int? {
        self.inputStream.length
    }

    var isEmpty: Bool {
        self.inputStream.isEmpty
    }

    var isSeekable: Bool {
        self.outputStream.isSeekable
    }

    func read(upToCount count: Int) throws -> Data? {
        let bytes = try outputStream.read(upToCount: count)
        if bytes == nil {
            Task {
                try await readCoordinator.add { [self] () -> Data? in
                    guard outputStream.bufferCount == 0 else { return nil }
                    try await getNextChunk()
                    return nil
                }
            }
        }
        return bytes
    }

    func readAsync(upToCount count: Int) async throws -> Data? {
        return try await readCoordinator.add { [self] in
            let bytes = try outputStream.read(upToCount: count)
            if let bytes, bytes.isEmpty {
                // The output stream is empty.  Process the next chunk and add it to the
                // output stream before reading & returning.
                try await getNextChunk()
                return try await outputStream.readAsync(upToCount: count)
            } else {
                return bytes
            }
        }
    }

    private func getNextChunk() async throws {
        // If the stream is closed or some other Task has already replenished the stream,
        // then this operation is not needed.  Exit.
        guard !outputStream.isClosed, outputStream.bufferCount == 0 else { return }

        // Process the first chunk and determine if there are more to send
        let hasMoreChunks = try await chunkedReader.processNextChunk()
        let currentChunkBodyIsEmpty = chunkedReader.getCurrentChunkBody().isEmpty

        if hasMoreChunks && !currentChunkBodyIsEmpty {
            // Send the next, non-final chunk
            let chunk = chunkedReader.getCurrentChunk()
            try outputStream.write(contentsOf: chunk)
        } else {
            // Send the final chunk & close the stream
            let finalChunk = try await chunkedReader.getFinalChunk()
            try outputStream.write(contentsOf: finalChunk)
            outputStream.close()
        }
    }

    func readToEnd() throws -> Data? {
        try self.outputStream.readToEnd()
    }

    func readToEndAsync() async throws -> Data? {
        try await self.outputStream.readToEndAsync()
    }

    func seek(toOffset offset: Int) throws {
        try self.outputStream.seek(toOffset: offset)
    }
}
