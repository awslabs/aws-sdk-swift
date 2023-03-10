//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import AwsCommonRuntimeKit
import ClientRuntime

extension AWSEventStream {

    /// AWS implementation of `MessageDecoder` for decoding event stream messages
    /// Note: This is class because struct does not allow using `self` in closure
    ///      and we need to use `self` to access `messageBuffer` per CRT API.
    class AWSMessageDecoder: MessageDecoder {
        private var decoder: EventStreamMessageDecoder?
        private var messageBuffer: [EventStream.Message] = []
        private var error: Error?

        private var decodedPayload = Data()
        private var decodededHeaders: [EventStreamHeader] = []

        private let logger = SwiftLogger(label: "AWSMessageDecoder")

        init() {
            self.decoder = EventStreamMessageDecoder(
                onPayloadSegment: { payload, finalSegment in
                    self.logger.debug("onPayloadSegment: \(payload.count) bytes, finalSegment: \(finalSegment)")
                    self.decodedPayload.append(payload)
                },
                onPreludeReceived: { totalLength, headersLength in
                    self.logger.debug("onPreludeReceived: totalLength: \(totalLength), headersLength: \(headersLength)")

                    // This is beginning of a new message, so reset the state
                    self.decodedPayload = Data()
                    self.decodededHeaders = []
                },
                onHeaderReceived: { header in
                    self.logger.debug("onHeaderReceived: \(header.name): \(header.value)")
                    self.decodededHeaders.append(header)
                },
                onComplete: {
                    self.logger.debug("onComplete")
                    let message = EventStream.Message(headers: self.decodededHeaders.toHeaders(),
                                                      payload: self.decodedPayload)
                    self.messageBuffer.append(message)

                    // This could be end of the stream, hence reset the state
                    self.decodedPayload = Data()
                    self.decodededHeaders = []
                },
                onError: { code, message in
                    self.logger.debug("onError: \(code): \(message)")
                    self.error = AWSEventStreamError.decoding("\(code): \(message)")
                }
            )
        }

        /// Feeds data into the decoder, which may or may not result in a message.
        /// - Parameter data: The data to feed into the decoder.
        func feed(data: Data) throws {
            try throwIfErrorOccurred()
            try decoder?.decode(data: data)
        }

        /// Notifies the decoder that the stream has ended.
        /// If the stream ends before a message is complete, an error will be thrown.
        func endOfStream() throws {
            try throwIfErrorOccurred()

            guard decodedPayload.isEmpty && decodededHeaders.isEmpty else {
                throw AWSEventStreamError.decoding("Stream ended before message was complete")
            }
        }

        /// Returns the next message in the decoder's buffer
        /// and removes it from the buffer.
        func message() throws -> EventStream.Message? {
            try throwIfErrorOccurred()

            guard !messageBuffer.isEmpty else {
                return nil
            }

            let message = messageBuffer.removeFirst()
            return message
        }

        private func throwIfErrorOccurred() throws {
            if let error = error {
                throw error
            }
        }
    }
}
