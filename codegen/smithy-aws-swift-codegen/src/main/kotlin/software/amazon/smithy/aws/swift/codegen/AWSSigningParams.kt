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
    val service: ServiceShape,
    val useSignatureTypeQueryString: Boolean,
    val forceUnsignedBody: Boolean,
    val signedBodyHeaderContentSHA256: Boolean,
    val useExpiration: Boolean
) {
    val serviceIsS3: Boolean =
        service.sdkId.lowercase(Locale.US) == "s3"

    val serviceIsGlacier: Boolean =
        service.sdkId.lowercase(Locale.US) == "glacier"

    fun useUnsignedPayload(operation: OperationShape): Boolean =
        operation.hasTrait<UnsignedPayloadTrait>() || forceUnsignedBody

    fun useSignedBodyHeader(operation: OperationShape): Boolean =
        (serviceIsS3 || serviceIsGlacier) && !useUnsignedPayload(operation)

    fun middlewareParamsString(operation: OperationShape): String {
        val useUnsignedPayload = useUnsignedPayload(operation)
        val useSignedBodyHeader = useSignedBodyHeader(operation)

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
