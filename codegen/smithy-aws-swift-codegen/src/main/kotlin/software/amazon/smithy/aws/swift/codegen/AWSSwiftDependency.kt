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
        computeAbsolutePath("aws-sdk-swift/AWSClientRuntime"),
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

private fun computeAbsolutePath(relativePath: String): String {
    val userDirPathOverride = System.getenv("AWS_SDK_SWIFT_CI_DIR")
    if (!userDirPathOverride.isNullOrEmpty()) {
        return userDirPathOverride
    }

    var userDirPath = System.getProperty("user.dir")
    while (userDirPath.isNotEmpty()) {
        val fileName = userDirPath.removeSuffix("/") + "/" + relativePath
        if (File(fileName).isDirectory) {
            return fileName
        }
        userDirPath = userDirPath.substring(0, userDirPath.length - 1)
    }
    return ""
}
