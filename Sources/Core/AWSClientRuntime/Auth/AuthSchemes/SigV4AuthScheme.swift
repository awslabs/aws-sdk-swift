//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import ClientRuntime

public struct SigV4AuthScheme: ClientRuntime.AuthScheme {
    public let schemeID: String = "aws.auth#sigv4"
    public let signer: ClientRuntime.Signer = AWSSigV4Signer()
    public let idKind: ClientRuntime.IdentityKind = .aws

    public func customizeSigningProperties(signingProperties: Attributes, context: HttpContext) -> Attributes {
        var copy = signingProperties
        copy.set(key: AttributeKeys.bidirectionalStreaming, value: context.isBidirectionalStreamingEnabled())
        copy.set(key: AttributeKeys.signingRegion, value: context.getSigningRegion())
        return copy
    }
}
