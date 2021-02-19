/*
 * Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
 * SPDX-License-Identifier: Apache-2.0.
 */
package software.amazon.smithy.aws.swift.codegen
import software.amazon.smithy.codegen.core.SymbolDependency
import software.amazon.smithy.codegen.core.SymbolDependencyContainer

enum class AWSSwiftDependency(val type: String, val target: String, val branch: String?, val version: String, val url: String, var packageName: String) : SymbolDependencyContainer {
    AWS_CLIENT_RUNTIME(
        "",
        "AWSClientRuntime",
        getGitBranchName(),
        "0.1.0",
        "https://github.com/awslabs/aws-sdk-swift",
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

private fun getGitBranchName(): String {
    val process = Runtime.getRuntime().exec("git rev-parse --abbrev-ref HEAD")
    val sb: StringBuilder = StringBuilder()
    while (true) {
        val char = process.inputStream.read()
        if (char == -1) break
        sb.append(char.toChar())
    }
    var branchName = sb.removeSuffix("\n").toString()
    if (branchName == "HEAD") {
        branchName = System.getenv("BRANCH_NAME")
    }
    return branchName
}
