//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import Smithy
@_spi(SmithyEventStreams) import SmithyEventStreams
import SmithyEventStreamsAPI
import SmithyEventStreamsAuthAPI
import SmithyHTTPAPI

/// The auth schemes under which event stream messages are signed by `AWSMessageSigner`.
private let sigV4SchemeIDs: Set<String> = ["aws.auth#sigv4", "aws.auth#sigv4a"]

/// Setups context with encoder, decoder and signer for bidirectional streaming
/// and sets the bidirectional streaming flag
/// - Parameter context: The context to be configured for bidirectional streaming
public func setupBidirectionalStreaming(context: Context) {
    // setup client to server
    let messageEncoder = SmithyEventStreams.DefaultMessageEncoder()
    let messageSigner = AWSMessageSigner(
        encoder: messageEncoder,
        signer: { try context.fetchMessageDataSigner },
        signingConfig: { try await context.makeEventStreamSigningConfig() },
        requestSignature: { context.requestSignature },
        // Event stream messages are SigV4-signed only under a SigV4 auth scheme.  Under any other scheme,
        // i.e. noAuth or bearer auth, there are no AWS credentials to sign with and messages are sent unsigned.
        shouldSign: { sigV4SchemeIDs.contains(context.selectedAuthScheme?.schemeID ?? "") }
    )
    context.messageEncoder = messageEncoder
    context.messageSigner = messageSigner

    // enable the flag
    context.isBidirectionalStreamingEnabled = true
}

extension Context {

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
