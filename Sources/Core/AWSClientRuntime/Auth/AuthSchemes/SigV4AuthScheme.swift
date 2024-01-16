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
        let serviceName = context.getServiceName()
        let isPresignURLFlow = context.getFlowType() == .PRESIGN_URL
        updatedSigningProperties.set(
            key: AttributeKeys.signatureType,
            value: isPresignURLFlow ? .requestQueryParams : .requestHeaders
        )

        // Operation name is guaranteed to be in middleware context from generic codegen, but check just in case.
        guard let operationName = context.getOperation() else {
            throw ClientError.dataNotFound("Operation name must be configured on middleware context.")
        }

        // Set unsignedBody flag
        let shouldForceUnsignedBody = SigV4Util.shouldForceUnsignedBody(
            flow: context.getFlowType(),
            serviceName: serviceName,
            opName: operationName
        )
        let unsignedBody = context.hasUnsignedPayloadTrait() || shouldForceUnsignedBody
        updatedSigningProperties.set(key: AttributeKeys.unsignedBody, value: unsignedBody)

        // Set signedBodyHeader flag
        let useSignedBodyHeader = SigV4Util.serviceUsesSignedBodyHeader(serviceName: serviceName) && !unsignedBody
        updatedSigningProperties.set(
            key: AttributeKeys.signedBodyHeader,
            value: useSignedBodyHeader ? .contentSha256 : AWSSignedBodyHeader.none
        )

        // Set flags in SigningFlags object (S3 customizations)
        SigV4Util.setS3SpecificFlags(signingProperties: &updatedSigningProperties, serviceName: serviceName)

        return updatedSigningProperties
    }
}
