/*
 * Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
 * SPDX-License-Identifier: Apache-2.0.
 */

package software.amazon.smithy.aws.swift.codegen

import software.amazon.smithy.aws.swift.codegen.customization.RulesBasedAuthSchemeResolverGenerator
import software.amazon.smithy.aws.swift.codegen.swiftmodules.AWSClientRuntimeTypes
import software.amazon.smithy.codegen.core.Symbol
import software.amazon.smithy.model.shapes.OperationShape
import software.amazon.smithy.model.shapes.ServiceShape
import software.amazon.smithy.swift.codegen.AuthSchemeResolverGenerator
import software.amazon.smithy.swift.codegen.SwiftWriter
import software.amazon.smithy.swift.codegen.endpoints.EndpointParamsGenerator
import software.amazon.smithy.swift.codegen.endpoints.EndpointResolverGenerator
import software.amazon.smithy.swift.codegen.integration.DefaultHTTPProtocolCustomizations
import software.amazon.smithy.swift.codegen.integration.HttpProtocolServiceClient
import software.amazon.smithy.swift.codegen.integration.ProtocolGenerator
import software.amazon.smithy.swift.codegen.integration.ServiceConfig
import software.amazon.smithy.swift.codegen.model.isInputEventStream
import software.amazon.smithy.swift.codegen.model.isOutputEventStream

abstract class AWSHTTPProtocolCustomizations : DefaultHTTPProtocolCustomizations() {

    override fun renderContextAttributes(ctx: ProtocolGenerator.GenerationContext, writer: SwiftWriter, serviceShape: ServiceShape, op: OperationShape) {

        // FIXME handle indentation properly or do swift formatting after the fact
        writer.write("  .withIdentityResolver(value: config.awsCredentialIdentityResolver, schemeID: \$S)", "aws.auth#sigv4")
        writer.write("  .withIdentityResolver(value: config.awsCredentialIdentityResolver, schemeID: \$S)", "aws.auth#sigv4a")
        writer.write("  .withRegion(value: config.region)")
        if (SigV4Utils.hasSigV4AuthScheme(ctx.model, ctx.service, op)) {
            val signingName = SigV4Utils.signingServiceName(serviceShape)
            writer.write("  .withSigningName(value: \$S)", signingName)
            writer.write("  .withSigningRegion(value: config.signingRegion)")
        }
    }

    override fun renderEventStreamAttributes(
        ctx: ProtocolGenerator.GenerationContext,
        writer: SwiftWriter,
        op: OperationShape
    ) {
        if (op.isInputEventStream(ctx.model) && op.isOutputEventStream(ctx.model)) {
            writer.addImport(AWSSwiftDependency.AWS_SDK_EVENT_STREAMS_AUTH.target)
            writer.write("try context.setupBidirectionalStreaming()")
        }
    }

    override fun renderInternals(ctx: ProtocolGenerator.GenerationContext) {
        AuthSchemeResolverGenerator().render(ctx)
        // Generate rules-based auth scheme resolver for services that depend on endpoint resolver for auth scheme resolution
        if (AuthSchemeResolverGenerator.usesRulesBasedAuthResolver(ctx)) {
            RulesBasedAuthSchemeResolverGenerator().render(ctx)
        }
        EndpointParamsGenerator(ctx).render()
        EndpointResolverGenerator(
            partitionDefinition = AWSClientRuntimeTypes.Core.AWSPartitionDefinition,
        ).render(ctx)
    }

    override fun serviceClient(
        ctx: ProtocolGenerator.GenerationContext,
        writer: SwiftWriter,
        serviceConfig: ServiceConfig
    ): HttpProtocolServiceClient {
        writer.addImport(AWSSwiftDependency.AWS_CLIENT_RUNTIME.target, false, "FileBasedConfig")
        return AWSHttpProtocolServiceClient(ctx, writer, serviceConfig)
    }

    override val endpointMiddlewareSymbol: Symbol = AWSClientRuntimeTypes.Core.EndpointResolverMiddleware

    override val unknownServiceErrorSymbol: Symbol = AWSClientRuntimeTypes.Core.UnknownAWSHTTPServiceError
}
