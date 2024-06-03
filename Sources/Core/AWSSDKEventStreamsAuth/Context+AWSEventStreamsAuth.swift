//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import Smithy
import SmithyHTTPAPI
import SmithyEventStreamsAPI
import SmithyEventStreams
import SmithyEventStreamsAuthAPI

extension Context {

    /// Setups context with encoder, decoder and signer for bidirectional streaming
    /// and sets the bidirectional streaming flag
    public func setupBidirectionalStreaming() throws {
        // setup client to server
        let messageEncoder = SmithyEventStreams.DefaultMessageEncoder()
        let messageSigner = AWSMessageSigner(
            encoder: messageEncoder,
            signer: { try self.fetchMessageDataSigner },
            signingConfig: { try await self.makeEventStreamSigningConfig() },
            requestSignature: { self.requestSignature }
        )
        self.messageEncoder = messageEncoder
        self.messageSigner = messageSigner

        // enable the flag
        self.isBidirectionalStreamingEnabled = true
    }

    public var fetchMessageDataSigner: MessageDataSigner {
        get throws {
            guard let authScheme = self.selectedAuthScheme else {
                throw ClientError.authError(
                    "Signer for event stream could not be loaded because auth scheme was not configured."
                )
            }
            guard let signer = authScheme.signer else {
                throw ClientError.authError("Signer was not configured for the selected auth scheme.")
            }
            guard let messageDataSigner = signer as? MessageDataSigner else {
                throw ClientError.authError("Signer is not a message data signer.")
            }
            return messageDataSigner
        }
    }
}
