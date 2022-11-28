/*
 * Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
 * SPDX-License-Identifier: Apache-2.0.
 */

package software.amazon.smithy.aws.swift.codegen

import io.kotest.matchers.booleans.shouldBeFalse
import io.kotest.matchers.booleans.shouldBeTrue
import io.kotest.matchers.string.shouldContain
import io.kotest.matchers.string.shouldNotContain
import org.junit.jupiter.api.Test
import software.amazon.smithy.aws.traits.ServiceTrait
import software.amazon.smithy.aws.traits.auth.UnsignedPayloadTrait
import software.amazon.smithy.model.shapes.OperationShape
import software.amazon.smithy.model.shapes.ServiceShape

class AWSSigningParamsTests {
    @Test
    fun `serviceIsS3 is true when service is S3`() {
        val subject = AWSSigningParams(
            s3Service,
            operation(),
            false,
            false,
            false
        )
        subject.serviceIsS3.shouldBeTrue()
    }

    @Test
    fun `serviceIsS3 is false when service is not S3`() {
        val subject = AWSSigningParams(
            otherService,
            operation(),
            false,
            false,
            false
        )
        subject.serviceIsS3.shouldBeFalse()
    }

    @Test
    fun `serviceIsGlacier is true when service is Glacier`() {
        val subject = AWSSigningParams(
            glacierService,
            operation(),
            false,
            false,
            false
        )
        subject.serviceIsGlacier.shouldBeTrue()
    }

    @Test
    fun `serviceIsGlacier is false when service is not Glacier`() {
        val subject = AWSSigningParams(
            otherService,
            operation(),
            false,
            false,
            false
        )
        subject.serviceIsGlacier.shouldBeFalse()
    }

    @Test
    fun `useUnsignedPayload is false when operation has no unsigned trait and forceUnsignedBody is false`() {
        val subject = AWSSigningParams(
            otherService,
            operation(),
            false,
            false,
            false
        )
        subject.useUnsignedPayload.shouldBeFalse()
    }

    @Test
    fun `useUnsignedPayload is true when operation has unsigned trait and forceUnsignedBody is false`() {
        val subject = AWSSigningParams(
            otherService,
            operation(true),
            false,
            false,
            false
        )
        subject.useUnsignedPayload.shouldBeTrue()
    }

    @Test
    fun `useUnsignedPayload is true when operation has no unsigned trait and forceUnsignedBody is true`() {
        val subject = AWSSigningParams(
            otherService,
            operation(),
            false,
            true,
            false
        )
        subject.useUnsignedPayload.shouldBeTrue()
    }

    @Test
    fun `useSignedBodyHeader is false when service is not S3 or Glacier and forceUnsignedBody is false`() {
        val subject = AWSSigningParams(
            otherService,
            operation(),
            false,
            false,
            false
        )
        subject.useSignedBodyHeader.shouldBeFalse()
    }

    @Test
    fun `useSignedBodyHeader is false when service is S3 or Glacier and forceUnsignedBody is true`() {
        val subject = AWSSigningParams(
            s3Service,
            operation(),
            false,
            true,
            false
        )
        subject.useSignedBodyHeader.shouldBeFalse()
    }

    @Test
    fun `useSignedBodyHeader is true when service is S3 and forceUnsignedBody is false`() {
        val subject = AWSSigningParams(
            s3Service,
            operation(),
            false,
            false,
            false
        )
        subject.useSignedBodyHeader.shouldBeTrue()
    }

    @Test
    fun `useSignedBodyHeader is true when service is Glacier and forceUnsignedBody is false`() {
        val subject = AWSSigningParams(
            glacierService,
            operation(),
            false,
            false,
            false
        )
        subject.useSignedBodyHeader.shouldBeTrue()
    }

    @Test
    fun `middlewareParamsString includes signatureType when useSignatureTypeQueryString is true`() {
        val subject = AWSSigningParams(
            otherService,
            operation(),
            true,
            false,
            false
        )
        subject.middlewareParamsString.shouldContain("signatureType: .requestQueryParams")
    }

    @Test
    fun `middlewareParamsString omits signatureType when useSignatureTypeQueryString is false`() {
        val subject = AWSSigningParams(
            otherService,
            operation(),
            false,
            false,
            false
        )
        subject.middlewareParamsString.shouldNotContain("signatureType: .requestQueryParams")
    }

    @Test
    fun `middlewareParamsString includes useDoubleURIEncode and shouldNormalizeURIPath when service is S3`() {
        val subject = AWSSigningParams(
            s3Service,
            operation(),
            false,
            false,
            false
        )
        subject.middlewareParamsString.shouldContain("useDoubleURIEncode: false")
        subject.middlewareParamsString.shouldContain("shouldNormalizeURIPath: false")
    }

    @Test
    fun `middlewareParamsString omits useDoubleURIEncode and shouldNormalizeURIPath when service is not S3`() {
        val subject = AWSSigningParams(
            otherService,
            operation(),
            false,
            false,
            false
        )
        subject.middlewareParamsString.shouldNotContain("useDoubleURIEncode: false")
        subject.middlewareParamsString.shouldNotContain("shouldNormalizeURIPath: false")
    }

    @Test
    fun `middlewareParamsString includes expiration when useExpiration is true`() {
        val subject = AWSSigningParams(
            otherService,
            operation(),
            false,
            false,
            true
        )
        subject.useExpiration.shouldBeTrue()
        subject.middlewareParamsString.shouldContain("expiration: expiration")
    }

    @Test
    fun `middlewareParamsString omits expiration when useExpiration is false`() {
        val subject = AWSSigningParams(
            otherService,
            operation(),
            false,
            false,
            false
        )
        subject.useExpiration.shouldBeFalse()
        subject.middlewareParamsString.shouldNotContain("expiration: expiration")
    }

    @Test
    fun `middlewareParamsString includes signedBodyHeader when useSignedBodyHeader is true`() {
        val subject = AWSSigningParams(
            s3Service,
            operation(),
            false,
            false,
            false
        )
        subject.useSignedBodyHeader.shouldBeTrue()
        subject.middlewareParamsString.shouldContain("signedBodyHeader: .contentSha256")
    }

    @Test
    fun `middlewareParamsString omits signedBodyHeader when useSignedBodyHeader is false`() {
        val subject = AWSSigningParams(
            otherService,
            operation(),
            false,
            false,
            false
        )
        subject.useSignedBodyHeader.shouldBeFalse()
        subject.middlewareParamsString.shouldNotContain("signedBodyHeader: .contentSha256")
    }

    @Test
    fun `middlewareParamsString includes unsignedBody true when useUnsignedPayload is true`() {
        val subject = AWSSigningParams(
            otherService,
            operation(),
            false,
            true,
            false
        )
        subject.useUnsignedPayload.shouldBeTrue()
        subject.middlewareParamsString.shouldContain("unsignedBody: true")
    }

    @Test
    fun `middlewareParamsString includes unsignedBody false when useUnsignedPayload is false`() {
        val subject = AWSSigningParams(
            otherService,
            operation(),
            false,
            false,
            false
        )
        subject.useUnsignedPayload.shouldBeFalse()
        subject.middlewareParamsString.shouldContain("unsignedBody: false")
    }

    private val s3Service: ServiceShape =
        ServiceShape.builder()
            .id("com.test#Example")
            .addTrait(serviceTraitWithId("S3"))
            .version("1.0")
            .build()

    private val glacierService: ServiceShape =
        ServiceShape.builder()
            .id("com.test#Example")
            .addTrait(serviceTraitWithId("Glacier"))
            .version("1.0")
            .build()

    private val otherService: ServiceShape =
        ServiceShape.builder()
            .id("com.test#Example")
            .addTrait(serviceTraitWithId("DefinitelyNotS3OrGlacier"))
            .version("1.0")
            .build()

    private fun operation(presignedTrait: Boolean = false): OperationShape {
        val builder = OperationShape.builder()
            .id("com.test#Operation")
        if (presignedTrait) builder.addTrait(UnsignedPayloadTrait())
        return builder.build()
    }
    private fun serviceTraitWithId(sdkID: String): ServiceTrait {
        return ServiceTrait.builder().sdkId(sdkID).arnNamespace("aws::example").cloudFormationName("ExampleService").cloudTrailEventSource("ExampleService").build()
    }
}
