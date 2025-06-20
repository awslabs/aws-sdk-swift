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
                SwiftDependency.DistributionMethod.SPR,
            )
        val AWS_SDK_IDENTITY =
            SwiftDependency(
                "AWSSDKIdentity",
                "main",
                "0.0.1",
                "aws-sdk-swift",
                "../../../aws-sdk-swift",
                "AWSSDKIdentity",
                SwiftDependency.DistributionMethod.SPR,
            )
        val AWS_SDK_HTTP_AUTH =
            SwiftDependency(
                "AWSSDKHTTPAuth",
                "main",
                "0.0.1",
                "aws-sdk-swift",
                "../../../aws-sdk-swift",
                "AWSSDKHTTPAuth",
                SwiftDependency.DistributionMethod.SPR,
            )
        val AWS_SDK_EVENT_STREAMS_AUTH =
            SwiftDependency(
                "AWSSDKEventStreamsAuth",
                "main",
                "0.0.1",
                "aws-sdk-swift",
                "../../../aws-sdk-swift",
                "AWSSDKEventStreamsAuth",
                SwiftDependency.DistributionMethod.SPR,
            )
        val AWS_CLIENT_RUNTIME =
            SwiftDependency(
                "AWSClientRuntime",
                "main",
                "0.0.1",
                "aws-sdk-swift",
                "../../../aws-sdk-swift",
                "AWSClientRuntime",
                SwiftDependency.DistributionMethod.SPR,
            )
        val INTERNAL_AWS_STS =
            SwiftDependency(
                "InternalAWSSTS",
                "main",
                "0.0.1",
                "aws-sdk-swift",
                "../../../aws-sdk-swift",
                "InternalAWSSTS",
                SwiftDependency.DistributionMethod.SPR,
            )
        val INTERNAL_AWS_SSO =
            SwiftDependency(
                "InternalAWSSSO",
                "main",
                "0.0.1",
                "aws-sdk-swift",
                "../../../aws-sdk-swift",
                "InternalAWSSSO",
                SwiftDependency.DistributionMethod.SPR,
            )
        val INTERNAL_AWS_SSO_OIDC =
            SwiftDependency(
                "InternalAWSSSOOIDC",
                "main",
                "0.0.1",
                "aws-sdk-swift",
                "../../../aws-sdk-swift",
                "InternalAWSSSOOIDC",
                SwiftDependency.DistributionMethod.SPR,
            )
    }
}
