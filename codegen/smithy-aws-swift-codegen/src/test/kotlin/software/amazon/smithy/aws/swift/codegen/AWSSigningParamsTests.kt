/*
 * Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
 * SPDX-License-Identifier: Apache-2.0.
 */

package software.amazon.smithy.aws.swift.codegen

import io.kotest.matchers.booleans.shouldBeFalse
import io.kotest.matchers.booleans.shouldBeTrue
import org.junit.jupiter.api.Test
import software.amazon.smithy.aws.traits.ServiceTrait
import software.amazon.smithy.model.shapes.ServiceShape

class AWSSigningParamsTests {
    @Test
    fun `serviceIsS3 is true when service is S3`() {
        val subject = AWSSigningParams(s3Service, false, false, false, false)
        subject.serviceIsS3.shouldBeTrue()
    }

    @Test
    fun `serviceIsS3 is false when service is not S3`() {
        val subject = AWSSigningParams(otherService, false, false, false, false)
        subject.serviceIsS3.shouldBeFalse()
    }

    @Test
    fun `serviceIsGlacier is true when service is Glacier`() {
        val subject = AWSSigningParams(glacierService, false, false, false, false)
        subject.serviceIsGlacier.shouldBeTrue()
    }

    @Test
    fun `serviceIsGlacier is false when service is not Glacier`() {
        val subject = AWSSigningParams(otherService, false, false, false, false)
        subject.serviceIsGlacier.shouldBeFalse()
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

    private fun serviceTraitWithId(sdkID: String): ServiceTrait {
        return ServiceTrait.builder().sdkId(sdkID).arnNamespace("aws::example").cloudFormationName("ExampleService").cloudTrailEventSource("ExampleService").build()
    }
}