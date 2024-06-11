//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import protocol Smithy.Stream
import protocol SmithyChecksumsAPI.Checksum
import enum SmithyChecksumsAPI.ChecksumAlgorithm
import struct Foundation.Data
import AwsCommonRuntimeKit

class ValidatingBufferedStream {
    private var stream: BufferedStream
    private var checksumAlgorithm: ChecksumAlgorithm
    private var checksum: (any Checksum)
    private var expectedChecksum: String
    private var currentHash: UInt32 = 0

    init(stream: BufferedStream, expectedChecksum: String, checksumAlgorithm: ChecksumAlgorithm) {
        self.stream = stream
        self.expectedChecksum = expectedChecksum
        self.checksumAlgorithm = checksumAlgorithm
        self.checksum = checksumAlgorithm.createChecksum()
    }
}

extension ValidatingBufferedStream: Stream {

    var position: Data.Index {
        self.stream.position
    }

    var length: Int? {
        self.stream.length
    }

    var isEmpty: Bool {
        self.stream.isEmpty
    }

    var isSeekable: Bool {
        self.stream.isSeekable
    }

    func read(upToCount count: Int) throws -> Data? {
        try self.stream.read(upToCount: count)
    }

    func readAsync(upToCount count: Int) async throws -> Data? {
        try await self.stream.readAsync(upToCount: count)
    }

    func readToEnd() throws -> Data? {
        try self.stream.readToEnd()
    }

    func readToEndAsync() async throws -> Data? {
        let streamData = try await self.stream.readToEndAsync()

        // This will be invoked when the user executes the readData() method on ByteStream
        if let data = streamData {
            // Pass chunk data to checksum
            try self.checksum.update(chunk: data)

            if self.position == self.length {
                // Validate and throw
                let actualChecksum = try self.checksum.digest().toBase64String()
                if expectedChecksum != actualChecksum {
                    throw ChecksumMismatchException.message(
                        "Checksum mismatch. Expected \(expectedChecksum) but was \(actualChecksum)"
                    )
                }
            }
        }
        return streamData
    }

    func write(contentsOf data: Data) throws {
        try self.stream.write(contentsOf: data)
    }

    func close() {
        self.stream.close()
    }

    func closeWithError(_ error: Error) {
        self.stream.closeWithError(error)
    }

}
