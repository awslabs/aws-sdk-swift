//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import ClientRuntime

extension AWSEventStream {
    /// Stream adapter that encodes input into `Data` objects.
    struct AWSMessageEncoderStream<Element: MessageMarshaller>: MessageEncoderStream {
        let stream: AsyncThrowingStream<Element, Error>
        
        let messageEncoder: MessageEncoder
        let requestSignature: String
        let signingConfig: AWSSigningConfig
        let requestEncoder: RequestEncoder

        init(stream: AsyncThrowingStream<Element, Error>,
             messageEncoder: MessageEncoder,
             requestEncoder: RequestEncoder,
             signingConfig: AWSSigningConfig,
             requestSignature: String) {
            self.stream = stream
            self.messageEncoder = messageEncoder
            self.requestSignature = requestSignature
            self.signingConfig = signingConfig
            self.requestEncoder = requestEncoder
        }

        struct AsyncIterator: AsyncIteratorProtocol {
            let stream: AsyncThrowingStream<Element, Error>
            let messageEncoder: MessageEncoder
            var previousSignature: String
            let signingConfig: AWSSigningConfig
            var lastMessageSent: Bool = false
            let requestEncoder: RequestEncoder

            init(stream: AsyncThrowingStream<Element, Error>,
                 messageEncoder: MessageEncoder,
                 requestEncoder: RequestEncoder,
                 signingConfig: AWSSigningConfig,
                 requestSignature: String) {
                self.stream = stream
                self.messageEncoder = messageEncoder
                self.previousSignature = requestSignature
                self.signingConfig = signingConfig
                self.requestEncoder = requestEncoder
            }

            mutating func next() async throws -> Data? {
                var iterator = stream.makeAsyncIterator()
                guard let event = try await iterator.next() else {
                    // There are no more messages in the base stream
                    // if we have not sent the last message, send it now
                    if !lastMessageSent {
                        let signResult = try await AWSSigV4Signer.signEvent(payload: .init(),
                                                                            previousSignature: previousSignature,
                                                                            signingConfig: signingConfig)
                        let data = try messageEncoder.encode(message: signResult.output)
                        lastMessageSent = true
                        return data
                    }

                    // mark the stream as complete
                    return nil
                }

                let message = try event.marshall(encoder: requestEncoder)

                // encode the message
                let encodedMessage = try messageEncoder.encode(message: message)

                // sign the message
                let signResult = try await AWSSigV4Signer.signEvent(payload: encodedMessage,
                                                                    previousSignature: previousSignature,
                                                                    signingConfig: signingConfig)
                previousSignature = signResult.signature

                // encode again the signed message
                let data = try messageEncoder.encode(message: signResult.output)
                return data
            }
        }

        func makeAsyncIterator() -> AsyncIterator {
            AsyncIterator(stream: stream,
                          messageEncoder: messageEncoder,
                          requestEncoder: requestEncoder,
                          signingConfig: signingConfig,
                          requestSignature: requestSignature)
        }
    }

}
