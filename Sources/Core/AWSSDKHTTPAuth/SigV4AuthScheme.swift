//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import Smithy
import enum AWSSDKIdentity.FlowType
import SmithyHTTPAuthAPI

public struct SigV4AuthScheme: AuthScheme {
    public let schemeID: String = "aws.auth#sigv4"
    public let signer: Signer = AWSSigV4Signer()

    public init() {}

    public func customizeSigningProperties(signingProperties: Attributes, context: Context) throws -> Attributes {
        var updatedSigningProperties = signingProperties

        // Set signing algorithm flag
        updatedSigningProperties.set(key: AWSSigningConfigKeys.awsSigningAlgorithm, value: .sigv4)

        // Set bidirectional streaming flag
        updatedSigningProperties.set(
            key: AWSSigningConfigKeys.bidirectionalStreaming,
            value: context.isBidirectionalStreamingEnabled
        )

        // Set signing name and signing region flags
        updatedSigningProperties.set(key: AWSSigningConfigKeys.signingName, value: context.getSigningName())
        updatedSigningProperties.set(key: AWSSigningConfigKeys.signingRegion, value: context.getSigningRegion())

        // Set expiration flag
        //
        // Expiration is only used for presigning (presign request flow or presign URL flow).
        updatedSigningProperties.set(key: AWSSigningConfigKeys.expiration, value: context.getExpiration())

        // Set signature type flag
        //
        // AWSSignatureType.requestQueryParams is only used for presign URL flow.
        // Out of the AWSSignatureType enum cases, only two are used. .requestHeaders and .requestQueryParams.
        // .requestHeaders is the deafult signing used for AWS operations.
        let isPresignURLFlow = context.getFlowType() == .PRESIGN_URL
        updatedSigningProperties.set(
            key: AWSSigningConfigKeys.signatureType,
            value: isPresignURLFlow ? .requestQueryParams : .requestHeaders
        )

        // Set unsignedBody to true IFF operation had unsigned payload trait.
        let unsignedBody = context.hasUnsignedPayloadTrait()
        updatedSigningProperties.set(key: AWSSigningConfigKeys.unsignedBody, value: unsignedBody)

        // Set default values.
        updatedSigningProperties.set(key: AWSSigningConfigKeys.signedBodyHeader, value: AWSSignedBodyHeader.none)
        updatedSigningProperties.set(key: AWSSigningConfigKeys.useDoubleURIEncode, value: true)
        updatedSigningProperties.set(key: AWSSigningConfigKeys.shouldNormalizeURIPath, value: true)
        updatedSigningProperties.set(key: AWSSigningConfigKeys.omitSessionToken, value: false)

        // Copy checksum from middleware context to signing properties
        updatedSigningProperties.set(key: AWSSigningConfigKeys.checksum, value: context.checksum)

        // Copy chunked streaming eligiblity from middleware context to signing properties
        updatedSigningProperties.set(
            key: AWSSigningConfigKeys.isChunkedEligibleStream,
            value: context.isChunkedEligibleStream
        )

        // Set service-specific signing properties if needed.
        try CustomSigningPropertiesSetter().setServiceSpecificSigningProperties(
            signingProperties: &updatedSigningProperties,
            context: context
        )

        return updatedSigningProperties
    }
}
