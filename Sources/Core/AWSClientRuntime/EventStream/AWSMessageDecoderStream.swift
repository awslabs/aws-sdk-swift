//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import ClientRuntime

extension AWSEventStream {

    /// Stream adapter that decodes input data into `EventStream.Message` objects.
    struct AWSMessageDecoderStream: MessageDecoderStream {

        let stream: Stream
        let decoder: MessageDecoder

        init(stream: Stream, decoder: MessageDecoder) {
            self.stream = stream
            self.decoder = decoder
        }

        struct AsyncIterator: AsyncIteratorProtocol {
            let stream: Stream
            let decoder: MessageDecoder

            init(stream: Stream, decoder: MessageDecoder) {
                self.stream = stream
                self.decoder = decoder
            }

            mutating func next() async throws -> EventStream.Message? {
                // if we have a message in the decoder buffer, return it
                if let message = try decoder.message() {
                    return message
                }

                // read until the end of the stream
                while let data = try stream.read(upToCount: Int.max) {
                    // feed the data to the decoder
                    // this may result in a message being returned
                    try decoder.feed(data: data)

                    // if we have a message in the decoder buffer, return it
                    if let message = try decoder.message() {
                        return message
                    }
                }

                // this is the end of the stream
                // notify the decoder that the stream has ended
                try decoder.endOfStream()
                return nil
            }
        }

        func makeAsyncIterator() -> AsyncIterator {
            AsyncIterator(stream: stream, decoder: decoder)
        }
    }
}
