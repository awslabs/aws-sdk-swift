/*
 * Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
 * SPDX-License-Identifier: Apache-2.0.
 */
package software.amazon.smithy.aws.swift.codegen
import software.amazon.smithy.codegen.core.SymbolDependency
import software.amazon.smithy.codegen.core.SymbolDependencyContainer
import java.io.File

enum class AWSSwiftDependency(val type: String, val target: String, val branch: String?, val version: String, val url: String, var packageName: String) : SymbolDependencyContainer {
    AWS_CLIENT_RUNTIME(
        "",
        "AWSClientRuntime",
        computeBranch(),
        "0.1.0",
        computePackageLocation("aws-sdk-swift/AWSClientRuntime"),
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

private fun computeBranch(): String? {
    return System.getenv("BRANCH_NAME")
}
private fun computeAbsolutePath(relativePath: String): String {
    var userDirPath = System.getProperty("user.dir")
    while (userDirPath.isNotEmpty()) {
        val fileName = userDirPath.removeSuffix("/") + "/" + relativePath
        val file = File(fileName)
        if (file.isDirectory) {
            return fileName
        }
        userDirPath = userDirPath.substring(0, userDirPath.length - 1)
    }
    return ""
}

private fun computePackageLocation(relativePath: String): String {
    return System.getenv("BRANCH_NAME") ?: computeAbsolutePath(relativePath)
}
/* To be used for CI at a later time
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
*/
