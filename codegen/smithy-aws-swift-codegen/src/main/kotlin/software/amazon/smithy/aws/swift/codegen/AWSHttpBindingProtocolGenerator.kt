/*
 * Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
 * SPDX-License-Identifier: Apache-2.0.
 */
package software.amazon.smithy.aws.swift.codegen

import software.amazon.smithy.codegen.core.Symbol
import software.amazon.smithy.swift.codegen.integration.CodingKeysGenerator
import software.amazon.smithy.swift.codegen.integration.HttpBindingProtocolGenerator
import software.amazon.smithy.swift.codegen.integration.HttpProtocolTestGenerator
import software.amazon.smithy.swift.codegen.integration.HttpProtocolUnitTestErrorGenerator
import software.amazon.smithy.swift.codegen.integration.HttpProtocolUnitTestRequestGenerator
import software.amazon.smithy.swift.codegen.integration.HttpProtocolUnitTestResponseGenerator
import software.amazon.smithy.swift.codegen.integration.ProtocolGenerator

/**
 * Base class for all AWS HTTP protocol generators
 */
abstract class AWSHttpBindingProtocolGenerator : HttpBindingProtocolGenerator() {
    override val codingKeysGenerator: CodingKeysGenerator = AWSCodingKeysGenerator()

    override val serviceErrorProtocolSymbol: Symbol = Symbol.builder()
        .name("AWSHttpServiceError")
        .namespace(AWSSwiftDependency.AWS_CLIENT_RUNTIME.namespace, "")
        .addDependency(AWSSwiftDependency.AWS_CLIENT_RUNTIME)
        .build()

    override val unknownServiceErrorSymbol: Symbol = Symbol.builder()
        .name("UnknownAWSHttpServiceError")
        .namespace(AWSSwiftDependency.AWS_CLIENT_RUNTIME.namespace, "")
        .addDependency(AWSSwiftDependency.AWS_CLIENT_RUNTIME)
        .build()

    override fun generateProtocolUnitTests(ctx: ProtocolGenerator.GenerationContext) {

        val requestTestBuilder = HttpProtocolUnitTestRequestGenerator.Builder()
        val responseTestBuilder = HttpProtocolUnitTestResponseGenerator.Builder()
        val errorTestBuilder = HttpProtocolUnitTestErrorGenerator.Builder()

        HttpProtocolTestGenerator(
            ctx,
            requestTestBuilder,
            responseTestBuilder,
            errorTestBuilder
        ).generateProtocolTests()
    }
}
