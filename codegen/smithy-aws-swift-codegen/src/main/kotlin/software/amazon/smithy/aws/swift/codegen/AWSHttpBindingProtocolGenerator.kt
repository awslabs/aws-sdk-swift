/*
 * Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
 * SPDX-License-Identifier: Apache-2.0.
 */
package software.amazon.smithy.aws.swift.codegen

import software.amazon.smithy.codegen.core.Symbol
import software.amazon.smithy.swift.codegen.SwiftWriter
import software.amazon.smithy.swift.codegen.integration.ServiceConfig
import software.amazon.smithy.swift.codegen.integration.HttpBindingProtocolGenerator
import software.amazon.smithy.swift.codegen.integration.ProtocolGenerator
import software.amazon.smithy.swift.codegen.integration.HttpProtocolClientGenerator

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
        val serviceName = ctx.symbolProvider.toSymbol(ctx.service).name
        val config = getConfigClass(writer, serviceName)
        return AwsHttpProtocolClientGenerator(ctx, writer, properties, config)
    }

    override fun getConfigClass(writer: SwiftWriter, serviceName: String): ServiceConfig = AWSServiceConfig(writer, serviceName)
}
