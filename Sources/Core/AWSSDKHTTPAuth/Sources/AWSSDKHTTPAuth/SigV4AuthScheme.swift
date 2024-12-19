//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import class Smithy.Context
import enum SmithyHTTPAuthAPI.AWSSignedBodyHeader
import enum SmithyHTTPAuthAPI.SigningPropertyKeys
import protocol SmithyHTTPAuthAPI.AuthScheme
import protocol SmithyHTTPAuthAPI.Signer
import struct Smithy.Attributes

public struct SigV4AuthScheme: AuthScheme {
    public let schemeID: String = "aws.auth#sigv4"
    public let signer: Signer = AWSSigV4Signer()
    public let requestUnsignedBody: Bool

    public init() {
        self.requestUnsignedBody = false
    }

    public init(requestUnsignedBody: Bool) {
        self.requestUnsignedBody = requestUnsignedBody
    }

    public func customizeSigningProperties(signingProperties: Attributes, context: Context) throws -> Attributes {
        var updatedSigningProperties = signingProperties

        // Set signing algorithm flag
        updatedSigningProperties.set(key: SigningPropertyKeys.signingAlgorithm, value: .sigv4)

        // Set bidirectional streaming flag
        updatedSigningProperties.set(
            key: SigningPropertyKeys.bidirectionalStreaming,
            value: context.isBidirectionalStreamingEnabled
        )

        // Set signing name and signing region flags
        updatedSigningProperties.set(key: SigningPropertyKeys.signingName, value: context.signingName)
        updatedSigningProperties.set(
            key: SigningPropertyKeys.signingRegion,
            value: signingProperties.get(key: SigningPropertyKeys.signingRegion) ?? context.signingRegion
        )

        // Set expiration flag
        //
        // Expiration is only used for presigning (presign request flow or presign URL flow).
        updatedSigningProperties.set(key: SigningPropertyKeys.expiration, value: context.expiration)

        // Set signature type flag
        //
        // AWSSignatureType.requestQueryParams is only used for presign URL flow.
        // Out of the AWSSignatureType enum cases, only two are used. .requestHeaders and .requestQueryParams.
        // .requestHeaders is the deafult signing used for AWS operations.
        let isPresignURLFlow = context.getFlowType() == .PRESIGN_URL
        updatedSigningProperties.set(
            key: SigningPropertyKeys.signatureType,
            value: isPresignURLFlow ? .requestQueryParams : .requestHeaders
        )

        // Set unsignedBody to true IFF operation had unsigned payload trait.
        let unsignedBody = context.hasUnsignedPayloadTrait()
        updatedSigningProperties.set(key: SigningPropertyKeys.unsignedBody, value: unsignedBody)

        // Set default values.
        updatedSigningProperties.set(key: SigningPropertyKeys.signedBodyHeader, value: AWSSignedBodyHeader.none)
        updatedSigningProperties.set(key: SigningPropertyKeys.useDoubleURIEncode, value: true)
        updatedSigningProperties.set(key: SigningPropertyKeys.shouldNormalizeURIPath, value: true)
        updatedSigningProperties.set(key: SigningPropertyKeys.omitSessionToken, value: false)

        // Copy checksum from middleware context to signing properties
        updatedSigningProperties.set(key: SigningPropertyKeys.checksum, value: context.checksumString)

        // Copy chunked streaming eligiblity from middleware context to signing properties
        updatedSigningProperties.set(
            key: SigningPropertyKeys.isChunkedEligibleStream,
            value: context.isChunkedEligibleStream
        )

        // Optionally toggle unsigned body
        if self.requestUnsignedBody {
            updatedSigningProperties.set(key: SigningPropertyKeys.requestUnsignedBody, value: true)
        }

        // Set service-specific signing properties if needed.
        try CustomSigningPropertiesSetter().setServiceSpecificSigningProperties(
            signingProperties: &updatedSigningProperties,
            context: context
        )

        return updatedSigningProperties
    }
}
