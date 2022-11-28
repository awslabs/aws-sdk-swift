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

class SigV4ConfiguratorTests {
    @Test
    fun `serviceIsS3 is true when service is S3`() {
        val params = AWSSigningParams(
            s3Service,
            operation(),
            false,
            false,
            false
        )
        val subject = SigV4Configurator(params)
        subject.serviceIsS3.shouldBeTrue()
    }

    @Test
    fun `serviceIsS3 is false when service is not S3`() {
        val params = AWSSigningParams(
            otherService,
            operation(),
            false,
            false,
            false
        )
        val subject = SigV4Configurator(params)
        subject.serviceIsS3.shouldBeFalse()
    }

    @Test
    fun `useUnsignedPayload is false when operation has no presigned trait and forceUnsignedBody is false`() {
        val params = AWSSigningParams(
            otherService,
            operation(),
            false,
            false,
            false
        )
        val subject = SigV4Configurator(params)
        subject.useUnsignedPayload.shouldBeFalse()
    }

    @Test
    fun `useUnsignedPayload is true when operation has presigned trait and forceUnsignedBody is false`() {
        val params = AWSSigningParams(
            otherService,
            operation(true),
            false,
            false,
            false
        )
        val subject = SigV4Configurator(params)
        subject.useUnsignedPayload.shouldBeTrue()
    }

    @Test
    fun `useUnsignedPayload is true when operation has no presigned trait and forceUnsignedBody is true`() {
        val params = AWSSigningParams(
            otherService,
            operation(),
            false,
            true,
            false
        )
        val subject = SigV4Configurator(params)
        subject.useUnsignedPayload.shouldBeTrue()
    }

    @Test
    fun `useUnsignedPayload is true when operation has presigned trait and forceUnsignedBody is true`() {
        val params = AWSSigningParams(
            otherService,
            operation(true),
            false,
            true,
            false
        )
        val subject = SigV4Configurator(params)
        subject.useUnsignedPayload.shouldBeTrue()
    }

    @Test
    fun `useSignedBodyHeader is false when service is not S3 or Glacier and forceUnsignedBody is false`() {
        val params = AWSSigningParams(
            otherService,
            operation(),
            false,
            false,
            false
        )
        val subject = SigV4Configurator(params)
        subject.useSignedBodyHeader.shouldBeFalse()
    }

    @Test
    fun `useSignedBodyHeader is false when service is S3 or Glacier and forceUnsignedBody is true`() {
        val params = AWSSigningParams(
            s3Service,
            operation(),
            false,
            true,
            false
        )
        val subject = SigV4Configurator(params)
        subject.useSignedBodyHeader.shouldBeFalse()
    }

    @Test
    fun `useSignedBodyHeader is true when service is S3 and forceUnsignedBody is false`() {
        val params = AWSSigningParams(
            s3Service,
            operation(),
            false,
            false,
            false
        )
        val subject = SigV4Configurator(params)
        subject.useSignedBodyHeader.shouldBeTrue()
    }

    @Test
    fun `useSignedBodyHeader is true when service is Glacier and forceUnsignedBody is false`() {
        val params = AWSSigningParams(
            glacierService,
            operation(),
            false,
            false,
            false
        )
        val subject = SigV4Configurator(params)
        subject.useSignedBodyHeader.shouldBeTrue()
    }

    @Test
    fun `swiftParamsString includes signatureType when useSignatureTypeQueryString is true`() {
        val subject = SigV4Configurator(
            true,
            false,
            false,
            false,
            false
        )
        subject.swiftParamsString.shouldContain("signatureType: .requestQueryParams")
    }

    @Test
    fun `swiftParamsString omits signatureType when useSignatureTypeQueryString is false`() {
        val subject = SigV4Configurator(
            false,
            false,
            false,
            false,
            false
        )
        subject.swiftParamsString.shouldNotContain("signatureType:")
    }

    @Test
    fun `swiftParamsString includes useDoubleURIEncode and shouldNormalizeURIPath when service is S3`() {
        val subject = SigV4Configurator(
            false,
            false,
            true,
            false,
            false
        )
        subject.swiftParamsString.shouldContain("useDoubleURIEncode: false")
        subject.swiftParamsString.shouldContain("shouldNormalizeURIPath: false")
    }

    @Test
    fun `swiftParamsString omits useDoubleURIEncode and shouldNormalizeURIPath when service is not S3`() {
        val subject = SigV4Configurator(
            false,
            false,
            false,
            false,
            false
        )
        subject.swiftParamsString.shouldNotContain("useDoubleURIEncode:")
        subject.swiftParamsString.shouldNotContain("shouldNormalizeURIPath:")
    }

    @Test
    fun `swiftParamsString includes expiration when useExpiration is true`() {
        val subject = SigV4Configurator(
            false,
            true,
            false,
            false,
            false
        )
        subject.swiftParamsString.shouldContain("expiration: expiration")
    }

    @Test
    fun `swiftParamsString omits expiration when useExpiration is false`() {
        val subject = SigV4Configurator(
            false,
            false,
            false,
            false,
            false
        )
        subject.swiftParamsString.shouldNotContain("expiration:")
    }

    @Test
    fun `swiftParamsString includes signedBodyHeader when useSignedBodyHeader is true`() {
        val subject = SigV4Configurator(
            false,
            false,
            false,
            false,
            true
        )
        subject.swiftParamsString.shouldContain("signedBodyHeader: .contentSha256")
    }

    @Test
    fun `swiftParamsString omits signedBodyHeader when useSignedBodyHeader is false`() {
        val subject = SigV4Configurator(
            false,
            false,
            false,
            false,
            false
        )
        subject.swiftParamsString.shouldNotContain("signedBodyHeader:")
    }

    @Test
    fun `swiftParamsString includes unsignedBody true when useUnsignedPayload is true`() {
        val subject = SigV4Configurator(
            false,
            false,
            false,
            true,
            false
        )
        subject.swiftParamsString.shouldContain("unsignedBody: true")
    }

    @Test
    fun `swiftParamsString includes unsignedBody false when useUnsignedPayload is false`() {
        val subject = SigV4Configurator(
            false,
            false,
            false,
            false,
            false
        )
        subject.swiftParamsString.shouldContain("unsignedBody:")
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
