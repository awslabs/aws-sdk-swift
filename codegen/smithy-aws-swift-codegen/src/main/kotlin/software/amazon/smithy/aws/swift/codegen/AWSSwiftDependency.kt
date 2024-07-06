/*
 * Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
 * SPDX-License-Identifier: Apache-2.0.
 */
package software.amazon.smithy.aws.swift.codegen
import software.amazon.smithy.swift.codegen.SwiftDependency
import software.amazon.smithy.swift.codegen.SwiftDependency.DistributionMethod

class AWSSwiftDependency {

    companion object {
        val AWS_SDK_IDENTITY = awsTargetNamed("AWSSDKIdentity")
        val AWS_SDK_HTTP_AUTH = awsTargetNamed("AWSSDKHTTPAuth")
        val AWS_SDK_EVENT_STREAMS_AUTH = awsTargetNamed("AWSSDKEventStreamsAuth")
        val AWS_CLIENT_RUNTIME = awsTargetNamed("AWSClientRuntime")

        private fun awsTargetNamed(name: String): SwiftDependency {
            return SwiftDependency(
                name,
                "main",
                "0.0.15",
                "aws-sdk-swift",
                "../../../aws-sdk-swift",
                name,
                DistributionMethod.SPR,
            )
        }
    }
}
