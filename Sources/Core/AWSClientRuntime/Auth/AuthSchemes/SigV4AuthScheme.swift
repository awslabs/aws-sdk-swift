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

    public init() {}

    public func customizeSigningProperties(signingProperties: Attributes, context: HttpContext) throws -> Attributes {
        var updatedSigningProperties = signingProperties

        // Set signing algorithm flag
        updatedSigningProperties.set(key: AttributeKeys.signingAlgorithm, value: .sigv4)

        // Set bidirectional streaming flag
        updatedSigningProperties.set(
            key: AttributeKeys.bidirectionalStreaming,
            value: context.isBidirectionalStreamingEnabled()
        )

        // Set signing name and signing region flags
        updatedSigningProperties.set(key: AttributeKeys.signingName, value: context.getSigningName())
        updatedSigningProperties.set(key: AttributeKeys.signingRegion, value: context.getSigningRegion())

        // Set expiration flag
        //
        // Expiration is only used for presigning (presign request flow or presign URL flow).
        updatedSigningProperties.set(key: AttributeKeys.expiration, value: context.getExpiration())

        // Set signature type flag
        //
        // AWSSignatureType.requestQueryParams is only used for presign URL flow.
        // Out of the AWSSignatureType enum cases, only two are used. .requestHeaders and .requestQueryParams.
        // .requestHeaders is the deafult signing used for AWS operations.
        let isPresignURLFlow = context.getFlowType() == .PRESIGN_URL
        updatedSigningProperties.set(
            key: AttributeKeys.signatureType,
            value: isPresignURLFlow ? .requestQueryParams : .requestHeaders
        )

        // Set unsignedBody to true IFF operation had unsigned payload trait.
        let unsignedBody = context.hasUnsignedPayloadTrait()
        updatedSigningProperties.set(key: AttributeKeys.unsignedBody, value: unsignedBody)

        // Set default values.
        updatedSigningProperties.set(key: AttributeKeys.signedBodyHeader, value: AWSSignedBodyHeader.none)
        updatedSigningProperties.set(key: AttributeKeys.useDoubleURIEncode, value: true)
        updatedSigningProperties.set(key: AttributeKeys.shouldNormalizeURIPath, value: true)
        updatedSigningProperties.set(key: AttributeKeys.omitSessionToken, value: false)

        // Copy checksum from middleware context to signing properties
        updatedSigningProperties.set(key: AttributeKeys.checksum, value: context.getChecksum())

        // Copy chunked streaming eligiblity from middleware context to signing properties
        updatedSigningProperties.set(
            key: AttributeKeys.isChunkedEligibleStream,
            value: context.getIsChunkedEligibleStream()
        )

        // Set service-specific signing properties if needed.
        try CustomSigningPropertiesSetter().setServiceSpecificSigningProperties(
            signingProperties: &updatedSigningProperties,
            context: context
        )

        return updatedSigningProperties
    }
}
