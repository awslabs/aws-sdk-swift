/*
 * Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
 * SPDX-License-Identifier: Apache-2.0.
 */
package software.amazon.smithy.aws.swift.codegen
import software.amazon.smithy.codegen.core.SymbolDependency
import software.amazon.smithy.swift.codegen.Dependency
import software.amazon.smithy.swift.codegen.resources.Resources

enum class AWSSwiftDependency(
    override val target: String,
    private val branch: String?,
    private val version: String,
    private val url: String,
    private val localPath: String,
    override var packageName: String
) : Dependency {
    AWS_SDK_IDENTITY(
        "AWSSDKIdentity",
        "main",
        "0.1.0",
        "https://github.com/awslabs/aws-sdk-swift",
        Resources.computeAbsolutePath("aws-sdk-swift", "", "AWS_SDK_SWIFT_CI_DIR"),
        "aws-sdk-swift"
    ),
    AWS_SDK_HTTP_AUTH(
        "AWSSDKHTTPAuth",
        "main",
        "0.1.0",
        "https://github.com/awslabs/aws-sdk-swift",
        Resources.computeAbsolutePath("aws-sdk-swift", "", "AWS_SDK_SWIFT_CI_DIR"),
        "aws-sdk-swift"
    ),
    AWS_SDK_EVENT_STREAMS_AUTH(
        "AWSSDKEventStreamsAuth",
        "main",
        "0.1.0",
        "https://github.com/awslabs/aws-sdk-swift",
        Resources.computeAbsolutePath("aws-sdk-swift", "", "AWS_SDK_SWIFT_CI_DIR"),
        "aws-sdk-swift"
    ),
    AWS_CLIENT_RUNTIME(
        "AWSClientRuntime",
        "main",
        "0.1.0",
        "https://github.com/awslabs/aws-sdk-swift",
        Resources.computeAbsolutePath("aws-sdk-swift", "", "AWS_SDK_SWIFT_CI_DIR"),
        "aws-sdk-swift"
    ),
    AWS_SDK_COMMON(
        "AWSSDKCommon",
        "main",
        "0.1.0",
        "https://github.com/awslabs/aws-sdk-swift",
        Resources.computeAbsolutePath("aws-sdk-swift", "", "AWS_SDK_SWIFT_CI_DIR"),
        "aws-sdk-swift"
    ),
    AWS_COMMON_RUNTIME(
        "AwsCommonRuntimeKit",
        "main",
        "0.1.0",
        "https://github.com/awslabs/aws-crt-swift",
        "",
        "aws-crt-swift"
    );

    override fun getDependencies(): List<SymbolDependency> {
        val dependency = SymbolDependency.builder()
            .putProperty("target", target)
            .packageName(packageName)
            .version(version)
            .putProperty("url", url)
            .putProperty("branch", branch)
            .putProperty("localPath", localPath)
            .build()
        return listOf(dependency)
    }
}
