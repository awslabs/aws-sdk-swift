/*
 * Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
 * SPDX-License-Identifier: Apache-2.0.
 */
package software.amazon.smithy.aws.swift.codegen
import software.amazon.smithy.codegen.core.SymbolDependency
import software.amazon.smithy.codegen.core.SymbolDependencyContainer
import software.amazon.smithy.swift.codegen.resources.Resources

enum class AWSSwiftDependency(val type: String, val target: String, val branch: String?, val version: String, val url: String, var packageName: String) : SymbolDependencyContainer {
    AWS_CLIENT_RUNTIME(
        "",
        "AWSClientRuntime",
        null,
        "0.1.0",
        Resources.computeAbsolutePath("aws-sdk-swift/AWSClientRuntime", "AWS_SDK_SWIFT_CI_DIR"),
        "AWSClientRuntime"
    );

    override fun getDependencies(): List<SymbolDependency> {
        val dependency = SymbolDependency.builder()
            .dependencyType(type)
            .putProperty("target", target)
            .packageName(packageName)
            .version(version)
            .putProperty("url", url)
            .putProperty("branch", branch)
            .build()
        return listOf(dependency)
    }
}
