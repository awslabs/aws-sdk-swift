/*
 * Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
 * SPDX-License-Identifier: Apache-2.0.
 */
package software.amazon.smithy.aws.swift.codegen

import software.amazon.smithy.codegen.core.Symbol
import software.amazon.smithy.swift.codegen.integration.CodingKeysGenerator
import software.amazon.smithy.swift.codegen.integration.DefaultCodingKeysGenerator
import software.amazon.smithy.swift.codegen.integration.HttpBindingProtocolGenerator
import software.amazon.smithy.swift.codegen.integration.HttpProtocolTestGenerator
import software.amazon.smithy.swift.codegen.integration.HttpProtocolUnitTestErrorGenerator
import software.amazon.smithy.swift.codegen.integration.HttpProtocolUnitTestGenerator
import software.amazon.smithy.swift.codegen.integration.HttpProtocolUnitTestRequestGenerator
import software.amazon.smithy.swift.codegen.integration.HttpProtocolUnitTestResponseGenerator
import software.amazon.smithy.swift.codegen.integration.ProtocolGenerator

abstract class AWSHttpBindingProtocolGenerator : HttpBindingProtocolGenerator() {

    override val codingKeysGenerator: CodingKeysGenerator = DefaultCodingKeysGenerator()

    override val serviceErrorProtocolSymbol: Symbol = Symbol.builder()
        .name("AWSHttpServiceError")
        .namespace(AWSSwiftDependency.AWS_CLIENT_RUNTIME.target, "")
        .addDependency(AWSSwiftDependency.AWS_CLIENT_RUNTIME)
        .build()

    override val unknownServiceErrorSymbol: Symbol = Symbol.builder()
        .name("UnknownAWSHttpServiceError")
        .namespace(AWSSwiftDependency.AWS_CLIENT_RUNTIME.target, "")
        .addDependency(AWSSwiftDependency.AWS_CLIENT_RUNTIME)
        .build()

    val serdeContextJSON = HttpProtocolUnitTestGenerator.SerdeContext("JSONEncoder()", "JSONDecoder()", ".secondsSince1970")
    val serdeContextXML = HttpProtocolUnitTestGenerator.SerdeContext("XMLEncoder()", "XMLDecoder()")
    val serdeContextAWSQuery = HttpProtocolUnitTestGenerator.SerdeContext("FormURLEncoder()", "XMLDecoder()")
    abstract val serdeContext: HttpProtocolUnitTestGenerator.SerdeContext

    val requestTestBuilder = HttpProtocolUnitTestRequestGenerator.Builder()
    val responseTestBuilder = HttpProtocolUnitTestResponseGenerator.Builder()
    val errorTestBuilder = HttpProtocolUnitTestErrorGenerator.Builder()

    override fun generateProtocolUnitTests(ctx: ProtocolGenerator.GenerationContext) {
        HttpProtocolTestGenerator(
            ctx,
            requestTestBuilder,
            responseTestBuilder,
            errorTestBuilder,
            httpProtocolCustomizable,
            serdeContext
        ).generateProtocolTests()
    }
}
