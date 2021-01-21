/*
 * Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
 * SPDX-License-Identifier: Apache-2.0.
 */
package software.amazon.smithy.aws.swift.codegen
import software.amazon.smithy.codegen.core.SymbolDependency
import software.amazon.smithy.codegen.core.SymbolDependencyContainer
import java.nio.file.FileSystem
import kotlin.io.path.Path

enum class AWSSwiftDependency(val type: String, val namespace: String, val version: String, val url: String, var packageName: String) : SymbolDependencyContainer {
    AWS_CLIENT_RUNTIME("",
        "AWSClientRuntime",
        "0.1.0",
        myAbsolutePath("aws-sdk-swift", "aws-sdk-swift/AWSClientRuntime"),
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

fun myAbsolutePath(searchString: String, relativePath: String): String {
    //This isn't a good solution because user.dir can change.. hmmm
    val javaClassPath = System.getProperty("user.dir")
    val matchingPaths = javaClassPath.split(":").filter { it.contains(searchString) }
    if (matchingPaths.isNotEmpty()) {
        val firstPath = matchingPaths.first()
        val startIndex = firstPath.indexOf(searchString)
        val rootPath = firstPath.substring(0, startIndex).trim().removeSuffix("/")
        return "$rootPath/$relativePath"
    }
    return ""
}