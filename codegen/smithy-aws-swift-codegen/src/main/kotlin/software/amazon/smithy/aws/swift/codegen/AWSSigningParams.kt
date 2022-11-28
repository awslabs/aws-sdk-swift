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
    val useExpiration: Boolean
) {
    val serviceIsS3: Boolean =
        service.sdkId.lowercase(Locale.US) == "s3"

    val serviceIsGlacier: Boolean =
        service.sdkId.lowercase(Locale.US) == "glacier"

    var useUnsignedPayload: Boolean =
        operation.hasTrait<UnsignedPayloadTrait>() || forceUnsignedBody

    var useSignedBodyHeader: Boolean =
        (serviceIsS3 || serviceIsGlacier) && !useUnsignedPayload

    val middlewareParamsString: String
        get() {
            // Create param strings for each setting, or null for default param
            val params = listOf(
                "signatureType: .requestQueryParams".takeIf { useSignatureTypeQueryString },
                "useDoubleURIEncode: false".takeIf { serviceIsS3 },
                "shouldNormalizeURIPath: false".takeIf { serviceIsS3 },
                "expiration: expiration".takeIf { useExpiration },
                "signedBodyHeader: .contentSha256".takeIf { useSignedBodyHeader },
                "unsignedBody: " + ("true".takeIf { useUnsignedPayload } ?: "false")
            )
            // Join the strings for use in initializing the Swift SigV4Config
            return params.mapNotNull { it }.joinToString(", ")
        }
}
