//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import Foundation
import ClientRuntime

extension AWSEventStream {
    /// Stream adapter that encodes input into `Data` objects.
    struct AWSMessageEncoderStream: MessageEncoderStream {
        let stream: AsyncThrowingStream<EventStream.Message, Error>
        let encoder: MessageEncoder
        let requestSignature: String
        let signingConfig: AWSSigningConfig

        init(stream: AsyncThrowingStream<EventStream.Message, Error>,
             encoder: MessageEncoder,
             signingConfig: AWSSigningConfig,
             requestSignature: String) {
            self.stream = stream
            self.encoder = encoder
            self.requestSignature = requestSignature
            self.signingConfig = signingConfig
        }

        struct AsyncIterator: AsyncIteratorProtocol {
            let stream: AsyncThrowingStream<EventStream.Message, Error>
            let encoder: MessageEncoder
            var previousSignature: String
            let signingConfig: AWSSigningConfig
            var lastMessageSent: Bool = false

            init(stream: AsyncThrowingStream<EventStream.Message, Error>,
                 encoder: MessageEncoder,
                 signingConfig: AWSSigningConfig,
                 requestSignature: String) {
                self.stream = stream
                self.encoder = encoder
                self.previousSignature = requestSignature
                self.signingConfig = signingConfig
            }

            mutating func next() async -> Data? {
                var iterator = stream.makeAsyncIterator()
                do {
                    guard let message = try await iterator.next() else {
                        // There are no more messages in the base stream
                        // if we have not sent the last message, send it now
                        if !lastMessageSent {
                            let signResult = try await AWSSigV4Signer.signEvent(payload: .init(),
                                                                                previousSignature: previousSignature,
                                                                                signingConfig: signingConfig)
                            let data = try encoder.encode(message: signResult.output)
                            lastMessageSent = true
                            return data
                        }

                        // mark the stream as complete
                        return nil
                    }

                    // encode the message
                    let encodedMessage = try encoder.encode(message: message)

                    // sign the message
                    let signResult = try await AWSSigV4Signer.signEvent(payload: encodedMessage,
                                                                        previousSignature: previousSignature,
                                                                        signingConfig: signingConfig)
                    previousSignature = signResult.signature

                    // encode again the signed message
                    let data = try encoder.encode(message: signResult.output)
                    return data
                } catch {
                    return nil
                }
            }
        }

        func makeAsyncIterator() -> AsyncIterator {
            AsyncIterator(stream: stream,
                          encoder: encoder,
                          signingConfig: signingConfig,
                          requestSignature: requestSignature)
        }
    }

}
