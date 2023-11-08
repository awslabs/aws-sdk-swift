/*
 * Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
 * SPDX-License-Identifier: Apache-2.0.
 */

package software.amazon.smithy.aws.swift.codegen

import software.amazon.smithy.aws.traits.auth.UnsignedPayloadTrait
import software.amazon.smithy.model.shapes.OperationShape
import software.amazon.smithy.model.shapes.ServiceShape
import software.amazon.smithy.swift.codegen.model.hasTrait
import java.util.Locale

data class AWSSigningParams(
    // The service that the signature is being prepared for.
    val service: ServiceShape,
    // The operation that the signature is being prepared for.
    val operation: OperationShape,
    // When set to true, forces the AWSv4 signature to be placed in the query string.
    val useSignatureTypeQueryString: Boolean,
    // When set to true, the AWSv4 signature does not include the body of the request.
    val forceUnsignedBody: Boolean,
    // When set to true, the expiration is included in the params string so it may be set to a custom
    // value named `expiration`.
    val useExpiration: Boolean,
    // The signing algorithm to use which is determined by the service's SigV4Trait.
    val signingAlgorithm: SigningAlgorithm
)

enum class SigningAlgorithm {
    SigV4
}

private fun SigningAlgorithm.toSwiftLiteral(): String {
    return when (this) {
        SigningAlgorithm.SigV4 -> ".sigv4"
    }
}

class SigV4Configurator(
    val useSignatureTypeQueryString: Boolean,
    val useExpiration: Boolean,
    val useDoubleURIEncode: Boolean,
    val useURLPathNormalization: Boolean,
    val useUnsignedPayload: Boolean,
    val useSignedBodyHeader: Boolean,
    val signingAlgorithm: SigningAlgorithm
) {
    constructor(params: AWSSigningParams) : this(
        useSignatureTypeQueryString = params.useSignatureTypeQueryString,
        useExpiration = params.useExpiration,
        useDoubleURIEncode = params.service.sdkId.lowercase(Locale.US) != "s3",
        useURLPathNormalization = params.service.sdkId.lowercase(Locale.US) != "s3",
        useUnsignedPayload = params.operation.hasTrait<UnsignedPayloadTrait>() || params.forceUnsignedBody,
        useSignedBodyHeader = listOf("s3", "glacier", "s3 control").contains(params.service.sdkId.lowercase(Locale.US)) &&
            !params.operation.hasTrait<UnsignedPayloadTrait>() && !params.forceUnsignedBody,
        signingAlgorithm = params.signingAlgorithm
    )

    val swiftParamsString: String
        get() {
            // Create param strings for each setting, or null for default param
            val params = listOf(
                "signatureType: .requestQueryParams".takeIf { useSignatureTypeQueryString },
                "useDoubleURIEncode: false".takeIf { !useDoubleURIEncode },
                "shouldNormalizeURIPath: false".takeIf { !useURLPathNormalization },
                "expiration: expiration".takeIf { useExpiration },
                "signedBodyHeader: .contentSha256".takeIf { useSignedBodyHeader },
                "unsignedBody: " + ("true".takeIf { useUnsignedPayload } ?: "false"),
                "signingAlgorithm: ${signingAlgorithm.toSwiftLiteral()}"
            )
            // Join the strings for use in initializing the Swift SigV4Config
            return params.mapNotNull { it }.joinToString(", ")
        }
}
