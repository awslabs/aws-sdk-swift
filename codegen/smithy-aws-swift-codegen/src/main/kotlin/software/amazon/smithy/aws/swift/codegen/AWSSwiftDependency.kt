/*
 * Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
 * SPDX-License-Identifier: Apache-2.0.
 */
package software.amazon.smithy.aws.swift.codegen
import software.amazon.smithy.swift.codegen.SwiftDependency

class AWSSwiftDependency {
    override val target: String,
    private val branch: String?,
    private val version: String,
    private val url: String,
    private val localPath: String,
    override var packageName: String
) : Dependency {

    companion object {
        val AWS_SDK_IDENTITY = SwiftDependency(
            "AWSSDKIdentity",
            "main",
            "0.1.0",
            "https://github.com/awslabs/aws-sdk-swift",
            "../../../aws-sdk-swift",
            "aws-sdk-swift",
        )
        val AWS_SDK_HTTP_AUTH = SwiftDependency(
            "AWSSDKHTTPAuth",
            "main",
            "0.1.0",
            "https://github.com/awslabs/aws-sdk-swift",
            "../../../aws-sdk-swift",
            "aws-sdk-swift",
        )
        val AWS_SDK_EVENT_STREAMS_AUTH = SwiftDependency(
            "AWSSDKEventStreamsAuth",
            "main",
            "0.1.0",
            "https://github.com/awslabs/aws-sdk-swift",
            "../../../aws-sdk-swift",
            "aws-sdk-swift",
        )
        val AWS_CLIENT_RUNTIME = SwiftDependency(
            "AWSClientRuntime",
            "main",
            "0.1.0",
            "https://github.com/awslabs/aws-sdk-swift",
            "../../../aws-sdk-swift",
            "aws-sdk-swift",
        )
    }
}
