/*
 * Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
 * SPDX-License-Identifier: Apache-2.0.
 */

package software.amazon.smithy.aws.swift.codegen

import io.kotest.matchers.booleans.shouldBeFalse
import io.kotest.matchers.booleans.shouldBeTrue
import io.kotest.matchers.collections.shouldContainExactly
import io.kotest.matchers.string.shouldContain
import io.kotest.matchers.string.shouldNotContain
import org.junit.jupiter.api.Test
import software.amazon.smithy.aws.traits.ServiceTrait
import software.amazon.smithy.aws.traits.auth.UnsignedPayloadTrait
import software.amazon.smithy.model.shapes.OperationShape
import software.amazon.smithy.model.shapes.ServiceShape

class SigV4ConfiguratorTests {
    @Test
    fun `useDoubleURIEncode is false when service is S3`() {
        val params = AWSSigningParams(
            service = s3Service,
            operation = operation(),
            useSignatureTypeQueryString = false,
            forceUnsignedBody = false,
            useExpiration = false,
            signingAlgorithm = SigningAlgorithm.SigV4
        )
        val subject = SigV4Configurator(params)
        subject.useDoubleURIEncode.shouldBeFalse()
    }

    @Test
    fun `useDoubleURIEncode is true when service is not S3`() {
        val params = AWSSigningParams(
            service = otherService,
            operation = operation(),
            useSignatureTypeQueryString = false,
            forceUnsignedBody = false,
            useExpiration = false,
            signingAlgorithm = SigningAlgorithm.SigV4
        )
        val subject = SigV4Configurator(params)
        subject.useDoubleURIEncode.shouldBeTrue()
    }

    @Test
    fun `useURLPathNormalization is false when service is S3`() {
        val params = AWSSigningParams(
            service = s3Service,
            operation = operation(),
            useSignatureTypeQueryString = false,
            forceUnsignedBody = false,
            useExpiration = false,
            signingAlgorithm = SigningAlgorithm.SigV4
        )
        val subject = SigV4Configurator(params)
        subject.useDoubleURIEncode.shouldBeFalse()
    }

    @Test
    fun `useURLPathNormalization is true when service is not S3`() {
        val params = AWSSigningParams(
            service = otherService,
            operation = operation(),
            useSignatureTypeQueryString = false,
            forceUnsignedBody = false,
            useExpiration = false,
            signingAlgorithm = SigningAlgorithm.SigV4
        )
        val subject = SigV4Configurator(params)
        subject.useDoubleURIEncode.shouldBeTrue()
    }

    @Test
    fun `useUnsignedPayload is false when operation has no presigned trait and forceUnsignedBody is false`() {
        val params = AWSSigningParams(
            service = otherService,
            operation = operation(),
            useSignatureTypeQueryString = false,
            forceUnsignedBody = false,
            useExpiration = false,
            signingAlgorithm = SigningAlgorithm.SigV4
        )
        val subject = SigV4Configurator(params)
        subject.useUnsignedPayload.shouldBeFalse()
    }

    @Test
    fun `useUnsignedPayload is true when operation has presigned trait and forceUnsignedBody is false`() {
        val params = AWSSigningParams(
            service = otherService,
            operation = operation(true),
            useSignatureTypeQueryString = false,
            forceUnsignedBody = false,
            useExpiration = false,
            signingAlgorithm = SigningAlgorithm.SigV4
        )
        val subject = SigV4Configurator(params)
        subject.useUnsignedPayload.shouldBeTrue()
    }

    @Test
    fun `useUnsignedPayload is true when operation has no presigned trait and forceUnsignedBody is true`() {
        val params = AWSSigningParams(
            service = otherService,
            operation = operation(),
            useSignatureTypeQueryString = false,
            forceUnsignedBody = true,
            useExpiration = false,
            signingAlgorithm = SigningAlgorithm.SigV4
        )
        val subject = SigV4Configurator(params)
        subject.useUnsignedPayload.shouldBeTrue()
    }

    @Test
    fun `useUnsignedPayload is true when operation has presigned trait and forceUnsignedBody is true`() {
        val params = AWSSigningParams(
            service = otherService,
            operation = operation(true),
            useSignatureTypeQueryString = false,
            forceUnsignedBody = true,
            useExpiration = false,
            signingAlgorithm = SigningAlgorithm.SigV4
        )
        val subject = SigV4Configurator(params)
        subject.useUnsignedPayload.shouldBeTrue()
    }

    @Test
    fun `useSignedBodyHeader is false when service is not S3 or Glacier or S3 Control and forceUnsignedBody is false`() {
        val params = AWSSigningParams(
            service = otherService,
            operation = operation(),
            useSignatureTypeQueryString = false,
            forceUnsignedBody = false,
            useExpiration = false,
            signingAlgorithm = SigningAlgorithm.SigV4
        )
        val subject = SigV4Configurator(params)
        subject.useSignedBodyHeader.shouldBeFalse()
    }

    @Test
    fun `useSignedBodyHeader is false when service is S3 and forceUnsignedBody is true`() {
        val params = AWSSigningParams(
            service = s3Service,
            operation = operation(),
            useSignatureTypeQueryString = false,
            forceUnsignedBody = true,
            useExpiration = false,
            signingAlgorithm = SigningAlgorithm.SigV4
        )
        val subject = SigV4Configurator(params)
        subject.useSignedBodyHeader.shouldBeFalse()
    }

    @Test
    fun `useSignedBodyHeader is true when service is S3 and forceUnsignedBody is false`() {
        val params = AWSSigningParams(
            service = s3Service,
            operation = operation(),
            useSignatureTypeQueryString = false,
            forceUnsignedBody = false,
            useExpiration = false,
            signingAlgorithm = SigningAlgorithm.SigV4
        )
        val subject = SigV4Configurator(params)
        subject.useSignedBodyHeader.shouldBeTrue()
    }

    @Test
    fun `useSignedBodyHeader is false when service is Glacier and forceUnsignedBody is true`() {
        val params = AWSSigningParams(
            service = glacierService,
            operation = operation(),
            useSignatureTypeQueryString = false,
            forceUnsignedBody = true,
            useExpiration = false,
            signingAlgorithm = SigningAlgorithm.SigV4
        )
        val subject = SigV4Configurator(params)
        subject.useSignedBodyHeader.shouldBeFalse()
    }

    @Test
    fun `useSignedBodyHeader is true when service is Glacier and forceUnsignedBody is false`() {
        val params = AWSSigningParams(
            service = glacierService,
            operation = operation(),
            useSignatureTypeQueryString = false,
            forceUnsignedBody = false,
            useExpiration = false,
            signingAlgorithm = SigningAlgorithm.SigV4
        )
        val subject = SigV4Configurator(params)
        subject.useSignedBodyHeader.shouldBeTrue()
    }

    @Test
    fun `useSignedBodyHeader is false when service is S3 Control and forceUnsignedBody is true`() {
        val params = AWSSigningParams(
            service = s3ControlService,
            operation = operation(),
            useSignatureTypeQueryString = false,
            forceUnsignedBody = true,
            useExpiration = false,
            signingAlgorithm = SigningAlgorithm.SigV4
        )
        val subject = SigV4Configurator(params)
        subject.useSignedBodyHeader.shouldBeFalse()
    }

    @Test
    fun `useSignedBodyHeader is true when service is S3 Control and forceUnsignedBody is false`() {
        val params = AWSSigningParams(
            service = s3ControlService,
            operation = operation(),
            useSignatureTypeQueryString = false,
            forceUnsignedBody = false,
            useExpiration = false,
            signingAlgorithm = SigningAlgorithm.SigV4
        )
        val subject = SigV4Configurator(params)
        subject.useSignedBodyHeader.shouldBeTrue()
    }

    @Test
    fun `swiftParamsString includes signatureType when useSignatureTypeQueryString is true`() {
        val subject = SigV4Configurator(
            useSignatureTypeQueryString = true,
            useExpiration = false,
            useDoubleURIEncode = false,
            useURLPathNormalization = false,
            useUnsignedPayload = false,
            useSignedBodyHeader = false,
            signingAlgorithm = SigningAlgorithm.SigV4
        )
        subject.swiftParamsString.shouldContain("signatureType: .requestQueryParams")
    }

    @Test
    fun `swiftParamsString omits signatureType when useSignatureTypeQueryString is false`() {
        val subject = SigV4Configurator(
            useSignatureTypeQueryString = false,
            useExpiration = false,
            useDoubleURIEncode = false,
            useURLPathNormalization = false,
            useUnsignedPayload = false,
            useSignedBodyHeader = false,
            signingAlgorithm = SigningAlgorithm.SigV4
        )
        subject.swiftParamsString.shouldNotContain("signatureType:")
    }

    @Test
    fun `swiftParamsString includes useDoubleURIEncode false when useDoubleURLEncode is false`() {
        val subject = SigV4Configurator(
            useSignatureTypeQueryString = false,
            useExpiration = false,
            useDoubleURIEncode = false,
            useURLPathNormalization = false,
            useUnsignedPayload = false,
            useSignedBodyHeader = false,
            signingAlgorithm = SigningAlgorithm.SigV4
        )
        subject.swiftParamsString.shouldContain("useDoubleURIEncode: false")
    }

    @Test
    fun `swiftParamsString omits useDoubleURIEncode false when when useDoubleURLEncode is true`() {
        val subject = SigV4Configurator(
            useSignatureTypeQueryString = false,
            useExpiration = false,
            useDoubleURIEncode = true,
            useURLPathNormalization = false,
            useUnsignedPayload = false,
            useSignedBodyHeader = false,
            signingAlgorithm = SigningAlgorithm.SigV4
        )
        subject.swiftParamsString.shouldNotContain("useDoubleURIEncode:")
    }

    @Test
    fun `swiftParamsString includes shouldNormalizeURIPath false when useURLPathNormalization is false`() {
        val subject = SigV4Configurator(
            useSignatureTypeQueryString = false,
            useExpiration = false,
            useDoubleURIEncode = false,
            useURLPathNormalization = false,
            useUnsignedPayload = false,
            useSignedBodyHeader = false,
            signingAlgorithm = SigningAlgorithm.SigV4
        )
        subject.swiftParamsString.shouldContain("shouldNormalizeURIPath: false")
    }

    @Test
    fun `swiftParamsString omits shouldNormalizeURIPath when useURLPathNormalization is true`() {
        val subject = SigV4Configurator(
            useSignatureTypeQueryString = false,
            useExpiration = false,
            useDoubleURIEncode = false,
            useURLPathNormalization = true,
            useUnsignedPayload = false,
            useSignedBodyHeader = false,
            signingAlgorithm = SigningAlgorithm.SigV4
        )
        subject.swiftParamsString.shouldNotContain("shouldNormalizeURIPath:")
    }

    @Test
    fun `swiftParamsString includes expiration when useExpiration is true`() {
        val subject = SigV4Configurator(
            useSignatureTypeQueryString = false,
            useExpiration = true,
            useDoubleURIEncode = false,
            useURLPathNormalization = false,
            useUnsignedPayload = false,
            useSignedBodyHeader = false,
            signingAlgorithm = SigningAlgorithm.SigV4
        )
        subject.swiftParamsString.shouldContain("expiration: expiration")
    }

    @Test
    fun `swiftParamsString omits expiration when useExpiration is false`() {
        val subject = SigV4Configurator(
            useSignatureTypeQueryString = false,
            useExpiration = false,
            useDoubleURIEncode = false,
            useURLPathNormalization = false,
            useUnsignedPayload = false,
            useSignedBodyHeader = false,
            signingAlgorithm = SigningAlgorithm.SigV4
        )
        subject.swiftParamsString.shouldNotContain("expiration:")
    }

    @Test
    fun `swiftParamsString includes signedBodyHeader when useSignedBodyHeader is true`() {
        val subject = SigV4Configurator(
            useSignatureTypeQueryString = false,
            useExpiration = false,
            useDoubleURIEncode = false,
            useURLPathNormalization = false,
            useUnsignedPayload = false,
            useSignedBodyHeader = true,
            signingAlgorithm = SigningAlgorithm.SigV4
        )
        subject.swiftParamsString.shouldContain("signedBodyHeader: .contentSha256")
    }

    @Test
    fun `swiftParamsString omits signedBodyHeader when useSignedBodyHeader is false`() {
        val subject = SigV4Configurator(
            useSignatureTypeQueryString = false,
            useExpiration = false,
            useDoubleURIEncode = false,
            useURLPathNormalization = false,
            useUnsignedPayload = false,
            useSignedBodyHeader = false,
            signingAlgorithm = SigningAlgorithm.SigV4
        )
        subject.swiftParamsString.shouldNotContain("signedBodyHeader:")
    }

    @Test
    fun `swiftParamsString includes unsignedBody true when useUnsignedPayload is true`() {
        val subject = SigV4Configurator(
            useSignatureTypeQueryString = false,
            useExpiration = false,
            useDoubleURIEncode = false,
            useURLPathNormalization = false,
            useUnsignedPayload = true,
            useSignedBodyHeader = false,
            signingAlgorithm = SigningAlgorithm.SigV4
        )
        subject.swiftParamsString.shouldContain("unsignedBody: true")
    }

    @Test
    fun `swiftParamsString includes unsignedBody false when useUnsignedPayload is false`() {
        val subject = SigV4Configurator(
            useSignatureTypeQueryString = false,
            useExpiration = false,
            useDoubleURIEncode = false,
            useURLPathNormalization = false,
            useUnsignedPayload = false,
            useSignedBodyHeader = false,
            signingAlgorithm = SigningAlgorithm.SigV4
        )
        subject.swiftParamsString.shouldContain("unsignedBody: false")
    }

    @Test
    fun `swiftParamsString joins individual params with comma plus space`() {
        val subject = SigV4Configurator(
            useSignatureTypeQueryString = true,
            useExpiration = true,
            useDoubleURIEncode = false,
            useURLPathNormalization = false,
            useUnsignedPayload = true,
            useSignedBodyHeader = true,
            signingAlgorithm = SigningAlgorithm.SigV4
        )
        subject.swiftParamsString.split(", ").shouldContainExactly(
            "signatureType: .requestQueryParams",
            "useDoubleURIEncode: false",
            "shouldNormalizeURIPath: false",
            "expiration: expiration",
            "signedBodyHeader: .contentSha256",
            "unsignedBody: true",
            "signingAlgorithm: .sigv4"
        )
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

    private val s3ControlService: ServiceShape =
        ServiceShape.builder()
            .id("com.test#Example")
            .addTrait(serviceTraitWithId("S3 Control"))
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
