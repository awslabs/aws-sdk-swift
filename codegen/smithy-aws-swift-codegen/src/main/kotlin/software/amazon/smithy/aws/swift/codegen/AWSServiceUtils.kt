/*
 * Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
 * SPDX-License-Identifier: Apache-2.0.
 */

package software.amazon.smithy.aws.swift.codegen

import software.amazon.smithy.aws.traits.ServiceTrait
import software.amazon.smithy.model.shapes.ServiceShape
import software.amazon.smithy.swift.codegen.model.getTrait

/**
 * Get the [sdkId](https://smithy.io/2.0/aws/aws-core.html#sdkid) from the (AWS) service shape
 * or return a default value if the trait is not present.
 */
val ServiceShape.sdkId: String
    get() = getTrait<ServiceTrait>()?.sdkId ?: "defaultSdkId"

/**
 * Get the [arnNamespace](https://smithy.io/2.0/aws/aws-core.html#arnnamespace)
 * from the (AWS) service shape or return a default value if the trait is not present.
 */
val ServiceShape.arnNamespace: String
    get() = getTrait<ServiceTrait>()?.arnNamespace ?: "defaultArnNamespace"

/**
 * Get the [endpointPrefix](https://smithy.io/2.0/aws/aws-core.html#endpointprefix)
 * from the (AWS) service shape or return a default value if the trait is not present.
 */
val ServiceShape.endpointPrefix: String
    get() = getTrait<ServiceTrait>()?.endpointPrefix ?: "defaultEndpointPrefix"
