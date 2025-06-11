/*
 * Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
 * SPDX-License-Identifier: Apache-2.0.
 */

package software.amazon.smithy.aws.swift.codegen

import software.amazon.smithy.aws.swift.codegen.customization.RulesBasedAuthSchemeResolverGenerator
import software.amazon.smithy.aws.swift.codegen.swiftmodules.AWSClientRuntimeTypes
import software.amazon.smithy.aws.swift.codegen.swiftmodules.AWSSDKEventStreamsAuthTypes
import software.amazon.smithy.aws.swift.codegen.swiftmodules.AWSSDKIdentityTypes
import software.amazon.smithy.aws.swift.codegen.swiftmodules.InternalClientTypes
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
import software.amazon.smithy.swift.codegen.integration.SmokeTestGenerator
import software.amazon.smithy.swift.codegen.model.isInputEventStream
import software.amazon.smithy.swift.codegen.model.isOutputEventStream

abstract class AWSHTTPProtocolCustomizations : DefaultHTTPProtocolCustomizations() {
    override fun renderContextAttributes(
        ctx: ProtocolGenerator.GenerationContext,
        writer: SwiftWriter,
        serviceShape: ServiceShape,
        op: OperationShape,
    ) {
        // FIXME handle indentation properly or do swift formatting after the fact
        val config = AWSServiceConfig(writer, ctx)
        if (config.serviceSpecificConfigProperties().any { it.memberName == "accountIdEndpointMode" }) {
            writer.write("  .withAccountIDEndpointMode(value: config.accountIdEndpointMode)")
        }
        writer.write("  .withIdentityResolver(value: config.awsCredentialIdentityResolver, schemeID: \$S)", "aws.auth#sigv4")
        writer.write("  .withIdentityResolver(value: config.awsCredentialIdentityResolver, schemeID: \$S)", "aws.auth#sigv4a")
        writer.write("  .withRegion(value: config.region)")
        writer.write("  .withRequestChecksumCalculation(value: config.requestChecksumCalculation)")
        writer.write("  .withResponseChecksumValidation(value: config.responseChecksumValidation)")
        if (AWSAuthUtils.hasSigV4AuthScheme(ctx.model, ctx.service, op)) {
            val signingName = AWSAuthUtils.signingServiceName(serviceShape)
            writer.write("  .withSigningName(value: \$S)", signingName)
            writer.write("  .withSigningRegion(value: config.signingRegion)")
        }
    }

    override fun renderEventStreamAttributes(
        ctx: ProtocolGenerator.GenerationContext,
        writer: SwiftWriter,
        op: OperationShape,
    ) {
        if (op.isInputEventStream(ctx.model) && op.isOutputEventStream(ctx.model)) {
            writer.write("\$N(context: context)", AWSSDKEventStreamsAuthTypes.setupBidirectionalStreaming)
        }
    }

    override fun renderInternals(ctx: ProtocolGenerator.GenerationContext) {
        AuthSchemeResolverGenerator(
            // Skip auth option customization w/ internal service clients for protocol test codegen.
            // Internal service clients are contained in aws-sdk-swift targets that ARE NOT vended externally
            //  via a product, meaning service clients generated outside of aws-sdk-swift CANNOT depend on
            //  the internal service clients. Not to mention it's not even needed for protocol tests.
            if (ctx.settings.forProtocolTests) {
                null
            } else {
                { authOptionName, writer ->
                    writer.write(
                        "$authOptionName.identityProperties.set(key: \$N.internalSTSClientKey, value: \$N())",
                        AWSSDKIdentityTypes.InternalClientKeys,
                        InternalClientTypes.IdentityProvidingSTSClient,
                    )
                }
            }
        ).render(ctx)
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
        serviceConfig: ServiceConfig,
    ): HttpProtocolServiceClient = AWSHttpProtocolServiceClient(ctx, writer, serviceConfig)

    override val endpointMiddlewareSymbol: Symbol = AWSClientRuntimeTypes.Core.AWSEndpointResolverMiddleware

    override val unknownServiceErrorSymbol: Symbol = AWSClientRuntimeTypes.Core.UnknownAWSHTTPServiceError

    override val queryCompatibleUtilsSymbol: Symbol = AWSClientRuntimeTypes.AWSQuery.AWSQueryCompatibleUtils

    override fun smokeTestGenerator(ctx: ProtocolGenerator.GenerationContext): SmokeTestGenerator = AWSSmokeTestGenerator(ctx)
}
