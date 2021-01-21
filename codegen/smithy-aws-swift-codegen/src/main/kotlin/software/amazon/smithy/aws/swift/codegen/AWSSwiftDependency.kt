/*
 * Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
 * SPDX-License-Identifier: Apache-2.0.
 */
package software.amazon.smithy.aws.swift.codegen
import software.amazon.smithy.codegen.core.SymbolDependency
import software.amazon.smithy.codegen.core.SymbolDependencyContainer
import java.io.File

enum class AWSSwiftDependency(val type: String, val namespace: String, val version: String, val url: String, var packageName: String) : SymbolDependencyContainer {
    AWS_CLIENT_RUNTIME("",
        "AWSClientRuntime",
        "0.1.0",
        computeAbsolutePath("aws-sdk-swift/AWSClientRuntime"),
        "AWSClientRuntime");

    override fun getDependencies(): List<SymbolDependency> {
        val dependency = SymbolDependency.builder()
                .dependencyType(type)
                .packageName(namespace)
                .version(version)
                .putProperty("url", url)
                .putProperty("swiftPackageName", packageName)
                .build()
        return listOf(dependency)
    }
}

private fun computeAbsolutePath(relativePath: String): String {
    var userDirPath = System.getProperty("user.dir")
    while (userDirPath.isNotEmpty()) {
        val fileName = userDirPath.removeSuffix("/") + "/" + relativePath
        val file = File(fileName)
        if (file.isDirectory) {
            return fileName
        }
        userDirPath = userDirPath.substring(0, userDirPath.length-1)
    }
    return ""
}
