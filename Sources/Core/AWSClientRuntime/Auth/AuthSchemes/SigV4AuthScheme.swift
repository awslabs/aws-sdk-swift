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

    public func customizeSigningProperties(signingProperties: Attributes, context: HttpContext) -> Attributes {
        var updatedSigningProperties = signingProperties

        updatedSigningProperties.set(key: AttributeKeys.signingAlgorithm, value: .sigv4)

        updatedSigningProperties.set(
            key: AttributeKeys.bidirectionalStreaming,
            value: context.isBidirectionalStreamingEnabled()
        )
        updatedSigningProperties.set(key: AttributeKeys.signingName, value: context.getSigningName())
        updatedSigningProperties.set(key: AttributeKeys.signingRegion, value: context.getSigningRegion())

        // Expiration is only used for presigning (presign request flow or presign URL flow).
        updatedSigningProperties.set(key: AttributeKeys.expiration, value: context.getExpiration())

        // AWSSignatureType.requestQueryParams is only used for presign URL flow.
        // Out of the AWSSignatureType enum cases, only two are used. .requestHeaders and .requestQueryParams.
        // .requestHeaders is the deafult signing used for AWS operations.
        let serviceName = context.getServiceName()
        let isS3PresignURLOp = serviceName == "S3" && ["getObject", "putObject"].contains(context.getOperation())
        let isPollyPresignURLOp = serviceName == "Polly" && ["synthesizeSpeech"].contains(context.getOperation())
        let flowType = context.getFlowType()
        let shouldUseRequestQueryParams = flowType == .PRESIGN_URL && (isS3PresignURLOp || isPollyPresignURLOp)
        updatedSigningProperties.set(
            key: AttributeKeys.signatureType,
            value: shouldUseRequestQueryParams ? .requestQueryParams : .requestHeaders
        )

        // Set unsignedBody flag
        let shouldForceUnsignedBody = context.getFlowType() == .PRESIGN_URL &&
                                        context.getServiceName() == "S3" &&
                                        ["getObject", "putObject"].contains(context.getOperation())
        let unsignedBody = context.hasUnsignedPayloadTrait() || shouldForceUnsignedBody
        updatedSigningProperties.set(key: AttributeKeys.unsignedBody, value: unsignedBody)

        // Set signedBodyHeader flag
        let useSignedBodyHeader = ["S3", "Glacier"].contains(context.getServiceName()) && !unsignedBody
        updatedSigningProperties.set(
            key: AttributeKeys.signedBodyHeader,
            value: useSignedBodyHeader ? .contentSha256 : AWSSignedBodyHeader.none
        )

        // Flags in SigningFlags object
        // Set useDoubleURIEncode to false IFF service is S3
        updatedSigningProperties.set(key: AttributeKeys.useDoubleURIEncode, value: serviceName != "S3")
        // Set shouldNormalizeURIPath to false IFF service is S3
        updatedSigningProperties.set(key: AttributeKeys.shouldNormalizeURIPath, value: serviceName != "S3")
        updatedSigningProperties.set(key: AttributeKeys.omitSessionToken, value: false)

        return updatedSigningProperties
    }
}
