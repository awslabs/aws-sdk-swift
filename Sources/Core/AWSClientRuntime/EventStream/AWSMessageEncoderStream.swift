//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import ClientRuntime

extension AWSEventStream {
    /// Stream adapter that encodes input into `Data` objects.
    public class AWSMessageEncoderStream<Event: MessageMarshallable>: MessageEncoderStream {
        let stream: AsyncThrowingStream<Event, Error>
        let messageEncoder: MessageEncoder
        let messageSinger: MessageSigner
        let requestEncoder: RequestEncoder

        public init(stream: AsyncThrowingStream<Event, Error>,
                    messageEncoder: MessageEncoder,
                    requestEncoder: RequestEncoder,
                    messageSinger: MessageSigner) {
            self.stream = stream
            self.messageEncoder = messageEncoder
            self.messageSinger = messageSinger
            self.requestEncoder = requestEncoder
        }

        public struct AsyncIterator: AsyncIteratorProtocol {
            let stream: AsyncThrowingStream<Event, Error>
            let messageEncoder: MessageEncoder
            var messageSinger: MessageSigner
            let requestEncoder: RequestEncoder

            private var lastMessageSent: Bool = false

            init(stream: AsyncThrowingStream<Event, Error>,
                 messageEncoder: MessageEncoder,
                 requestEncoder: RequestEncoder,
                 messageSinger: MessageSigner) {
                self.stream = stream
                self.messageEncoder = messageEncoder
                self.messageSinger = messageSinger
                self.requestEncoder = requestEncoder
            }

            mutating public func next() async throws -> Data? {
                var iterator = stream.makeAsyncIterator()
                guard let event = try await iterator.next() else {
                    // There are no more messages in the base stream
                    // if we have not sent the last message, send it now
                    if !lastMessageSent {
                        let emptySignedMessage = try await messageSinger.signEmpty()
                        let data = try messageEncoder.encode(message: emptySignedMessage)
                        lastMessageSent = true
                        return data
                    }

                    // mark the stream as complete
                    return nil
                }

                // marshall event to message
                let message = try event.marshall(encoder: requestEncoder)

                // sign the message
                let signedMessage = try await messageSinger.sign(message: message)

                // encode again the signed message
                let data = try messageEncoder.encode(message: signedMessage)
                return data
            }
        }

        public func makeAsyncIterator() -> AsyncIterator {
            AsyncIterator(stream: stream,
                          messageEncoder: messageEncoder,
                          requestEncoder: requestEncoder,
                          messageSinger: messageSinger)
        }
    }
}
