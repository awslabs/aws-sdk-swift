/*
 * Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
 * SPDX-License-Identifier: Apache-2.0.
 */
package software.amazon.smithy.aws.swift.codegen
import software.amazon.smithy.swift.codegen.SwiftDependency

class AWSSwiftDependency {
    companion object {
        val AWS_SDK_CHECKSUMS =
            SwiftDependency(
                "AWSSDKChecksums",
                "main",
                "0.0.1",
                "aws-sdk-swift",
                "../../../aws-sdk-swift",
                "AWSSDKChecksums",
            )
        val AWS_SDK_IDENTITY_API =
            SwiftDependency(
                "AWSSDKIdentityAPI",
                "main",
                "0.0.1",
                "aws-sdk-swift",
                "../../../aws-sdk-swift",
                "AWSSDKIdentityAPI",
            )
        val AWS_SDK_IDENTITY =
            SwiftDependency(
                "AWSSDKIdentity",
                "main",
                "0.0.1",
                "aws-sdk-swift",
                "../../../aws-sdk-swift",
                "AWSSDKIdentity",
            )
        val AWS_SDK_HTTP_AUTH =
            SwiftDependency(
                "AWSSDKHTTPAuth",
                "main",
                "0.0.1",
                "aws-sdk-swift",
                "../../../aws-sdk-swift",
                "AWSSDKHTTPAuth",
            )
        val AWS_SDK_EVENT_STREAMS_AUTH =
            SwiftDependency(
                "AWSSDKEventStreamsAuth",
                "main",
                "0.0.1",
                "aws-sdk-swift",
                "../../../aws-sdk-swift",
                "AWSSDKEventStreamsAuth",
            )
        val AWS_CLIENT_RUNTIME =
            SwiftDependency(
                "AWSClientRuntime",
                "main",
                "0.0.1",
                "aws-sdk-swift",
                "../../../aws-sdk-swift",
                "AWSClientRuntime",
            )
        val AWS_SDK_RPCV2CBOR =
            SwiftDependency(
                "AWSSDKRPCv2CBOR",
                "main",
                "0.0.1",
                "aws-sdk-swift",
                "../../../aws-sdk-swift",
                "AWSSDKRPCv2CBOR",
            )
    }
}
