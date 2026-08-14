/*
* Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
* SPDX-License-Identifier: Apache-2.0.
*/
package software.amazon.smithy.aws.swift.codegen.customization.s3

import software.amazon.smithy.aws.swift.codegen.sdkId
import software.amazon.smithy.model.shapes.ServiceShape

val ServiceShape.isS3: Boolean
    get() = sdkId.toLowerCase() == "s3"

// S3 in protocol tests cannot compile the S3Express customizations because the S3 protocol test model
// doesn't have the CreateSession operation.  So, use this test for applying S3Express customizations.
val ServiceShape.isS3WithExpress: Boolean
    get() = (sdkId.toLowerCase()) == "s3" && (allOperations.any { it.name == "CreateSession" })
