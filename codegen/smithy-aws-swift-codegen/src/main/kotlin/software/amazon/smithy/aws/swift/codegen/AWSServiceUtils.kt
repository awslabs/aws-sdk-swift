/*
 * Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
 * SPDX-License-Identifier: Apache-2.0.
 */

package software.amazon.smithy.aws.swift.codegen

import software.amazon.smithy.aws.traits.ServiceTrait
import software.amazon.smithy.aws.traits.auth.SigV4Trait
import software.amazon.smithy.model.shapes.ServiceShape
import software.amazon.smithy.swift.codegen.model.expectTrait
import software.amazon.smithy.swift.codegen.model.hasTrait

/**
 * Get the [sdkId](https://awslabs.github.io/smithy/1.0/spec/aws/aws-core.html#sdkid) from the (AWS) service shape
 */
val ServiceShape.sdkId: String
    get() = expectTrait<ServiceTrait>().sdkId

/**
 * Get the [arnNamespace](https://awslabs.github.io/smithy/1.0/spec/aws/aws-core.html#service-arn-namespace)
 * from the (AWS) service shape
 */
val ServiceShape.arnNamespace: String
    get() = expectTrait<ServiceTrait>().arnNamespace

/**
 * Get the [endpointPrefix](https://awslabs.github.io/smithy/1.0/spec/aws/aws-core.html#endpointprefix)
 * from the (AWS) service shape
 */
val ServiceShape.endpointPrefix: String
    get() = expectTrait<ServiceTrait>().endpointPrefix

/**
 * Determines if the service shape needs sigv4 signing
 */
val ServiceShape.needsSigning: Boolean
    get() = hasTrait<SigV4Trait>()
