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
        var copy = signingProperties
        copy.set(key: AttributeKeys.bidirectionalStreaming, value: context.isBidirectionalStreamingEnabled())
        copy.set(key: AttributeKeys.signingName, value: context.getSigningName())
        copy.set(key: AttributeKeys.signingRegion, value: context.getSigningRegion())
        copy.set(key: AttributeKeys.signingAlgorithm, value: .sigv4)

        // Expiration is only used for presigning URLs. E.g., in AWSS3, and in AWSPolly.
        copy.set(key: AttributeKeys.expiration, value: 0)
        // AWSSignatureType.requestQueryParams is only used for S3 GetObject and PutObject
        // Out of all AWSSignatureType cases, only two are used. .requestHeaders and .requestQueryParams.
        // .requestHeaders is the deafult signing used for all AWS operations except S3 customizations.
        copy.set(key: AttributeKeys.signatureType, value: .requestHeaders)

        // SigningFlags
        let serviceName = context.getServiceName()
        // Set useDoubleURIEncode to false IFF service is S3
        copy.set(key: AttributeKeys.useDoubleURIEncode, value: serviceName != "S3")
        // Set shouldNormalizeURIPath to false IFF service is S3
        copy.set(key: AttributeKeys.shouldNormalizeURIPath, value: serviceName != "S3")
        // FIXME: Flag doesn't seem to be used by anything - investigate
        copy.set(key: AttributeKeys.omitSessionToken, value: false)

        /*
         * The boolean flag .unsignedBody for AWSSigningConfig.signedBodyValue &
         *   the AWSSignedBodyHeader enum value for AWSSigningConfig.signedBodyHeader
         *   will be generated into signingProperties during service specific auth scheme resolver codegen and be part of
         *   the returned auth option's signing properties.
         *   By the time the call chain arrives here, code-generated flags are already included in signingProperties.
         */
        return copy
    }
}
