/*
* Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
* SPDX-License-Identifier: Apache-2.0.
*/
package software.amazon.smithy.aws.swift.codegen.customization.s3

import software.amazon.smithy.swift.codegen.SwiftSettings

val SwiftSettings.isS3: Boolean
    get() = sdkId.lowercase() == "s3"
