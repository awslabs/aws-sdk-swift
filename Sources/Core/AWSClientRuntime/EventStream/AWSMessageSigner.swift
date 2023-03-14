//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import ClientRuntime

extension AWSEventStream {
    /// Signs a `Message` using the AWS SigV4 signing algorithm
    public class AWSMessageSigner: MessageSigner {
        let context: HttpContext
        let encoder: MessageEncoder

        private var _previousSignature: String?

        /// Returns the previous signature used to sign a message
        /// If no previous signature is available, then the request signature returned
        /// which acts as previous signature for the first message
        var previousSignature: String {
            get {
                if let signature = _previousSignature {
                    return signature
                }

                guard let signature = context.getRequestSignature() else {
                    fatalError("""
                        Unable to get request signature from context.
                        This is likely a bug in the AWSClientRuntime.
                    """)
                }

                _previousSignature = signature
                return signature
            }
            set {
                _previousSignature = newValue
            }
        }

        public init(context: HttpContext, encoder: MessageEncoder) {
            self.context = context
            self.encoder = encoder
        }

        /// Signs a `Message` using the AWS SigV4 signing algorithm
        /// - Parameter message: `Message` to sign
        /// - Returns: Signed `Message` with `:chunk-signature` & `:date` headers
        public func sign(message: ClientRuntime.EventStream.Message) async throws -> ClientRuntime.EventStream.Message {
            // encode to bytes
            let encodedMessage = try encoder.encode(message: message)
            let signingConfig = try await context.makeEventStreamSigningConfig()

            // sign encoded bytes
            let signingResult = try await AWSSigV4Signer.signEvent(payload: encodedMessage,
                                                                   previousSignature: previousSignature,
                                                                   signingConfig: signingConfig)
            previousSignature = signingResult.signature
            return signingResult.output
        }

        /// Signs an empty `Message` using the AWS SigV4 signing algorithm
        /// - Returns: Signed `Message` with `:chunk-signature` & `:date` headers
        public func signEmpty() async throws -> ClientRuntime.EventStream.Message {
            let signingConfig = try await context.makeEventStreamSigningConfig()
            let signingResult = try await AWSSigV4Signer.signEvent(payload: .init(),
                                                                   previousSignature: previousSignature,
                                                                   signingConfig: signingConfig)
            return signingResult.output
        }
    }
}
