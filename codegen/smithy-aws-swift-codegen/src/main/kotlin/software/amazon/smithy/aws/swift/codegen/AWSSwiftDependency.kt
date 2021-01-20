/*
 * Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
 * SPDX-License-Identifier: Apache-2.0.
 */
package software.amazon.smithy.aws.swift.codegen
import software.amazon.smithy.codegen.core.SymbolDependency
import software.amazon.smithy.codegen.core.SymbolDependencyContainer

enum class AWSSwiftDependency(val type: String, val namespace: String, val version: String, val url: String, var packageName: String) : SymbolDependencyContainer {
    AWS_CLIENT_RUNTIME("", "AWSClientRuntime", "0.1.0", "/Users/sadiredd/Documents/aws-sdk-swift/AWSClientRuntime", "AWSClientRuntime");

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
