/*
 * Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
 * SPDX-License-Identifier: Apache-2.0.
 */
package software.amazon.smithy.aws.swift.codegen

import software.amazon.smithy.codegen.core.Symbol
import software.amazon.smithy.swift.codegen.SwiftWriter
import software.amazon.smithy.swift.codegen.integration.*

/**
 * Base class for all AWS HTTP protocol generators
 */
abstract class AWSHttpBindingProtocolGenerator : HttpBindingProtocolGenerator() {
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

    override fun getHttpProtocolClientGenerator(
        ctx: ProtocolGenerator.GenerationContext,
        writer: SwiftWriter
    ): HttpProtocolClientGenerator {
        val properties = getClientProperties(ctx)
        val config = getConfigClass(writer)
        return AwsHttpProtocolClientGenerator(ctx, writer, properties, config)
    }
}
