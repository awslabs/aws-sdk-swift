/*
* Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
* SPDX-License-Identifier: Apache-2.0.
*/
package software.amazon.smithy.aws.swift.codegen.customization.s3

import software.amazon.smithy.aws.swift.codegen.sdkId
import software.amazon.smithy.model.shapes.ServiceShape

/**
 * Returns true if the service is S3
 */
val ServiceShape.isS3: Boolean
    get() = sdkId.toLowerCase() == "s3"

/**
 * Returns true if the service is S3 Control
 */
val ServiceShape.isS3Control: Boolean
    get() = sdkId.toLowerCase() == "s3 control"