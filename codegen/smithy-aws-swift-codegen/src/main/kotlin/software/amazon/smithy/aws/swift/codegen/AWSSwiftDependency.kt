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
        null,
        "0.1.0",
        computeAbsolutePath(
            mapOf(
                // For aws-sdk-swift CI
                "aws-sdk-swift/target/build/deps/smithy-swift" to "aws-sdk-swift",
                // For smithy-swift CI
                "smithy-swift/target/build/deps/aws-sdk-swift" to "smithy-swift/target/build/deps/aws-sdk-swift",
                // For development
                "aws-sdk-swift/AWSClientRuntime" to "aws-sdk-swift/AWSClientRuntime",
            )
        ),
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

private fun computeAbsolutePath(relativePaths: Map<String, String>): String {
    for (relativePath in relativePaths.keys) {
        var userDirPath = System.getProperty("user.dir")
        while (userDirPath.isNotEmpty()) {
            val fileNameForCheckDir = userDirPath.removeSuffix("/") + "/" + relativePath
            val fileNameForAbsolutePath = userDirPath.removeSuffix("/") + "/" + relativePaths[relativePath]
            if (File(fileNameForCheckDir).isDirectory) {
                return fileNameForAbsolutePath
            }
            userDirPath = userDirPath.substring(0, userDirPath.length - 1)
        }
    }
    return ""
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
