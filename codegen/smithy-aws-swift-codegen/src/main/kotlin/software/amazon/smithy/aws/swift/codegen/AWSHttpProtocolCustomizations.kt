/*
 * Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
 * SPDX-License-Identifier: Apache-2.0.
 */

package software.amazon.smithy.aws.swift.codegen

import software.amazon.smithy.aws.swift.codegen.customization.RulesBasedAuthSchemeResolverGenerator
import software.amazon.smithy.aws.swift.codegen.middleware.AWSEndpointResolverMiddleware
import software.amazon.smithy.model.shapes.OperationShape
import software.amazon.smithy.model.shapes.ServiceShape
import software.amazon.smithy.swift.codegen.AuthSchemeResolverGenerator
import software.amazon.smithy.swift.codegen.SwiftWriter
import software.amazon.smithy.swift.codegen.endpoints.EndpointResolverGenerator
import software.amazon.smithy.swift.codegen.integration.ClientProperty
import software.amazon.smithy.swift.codegen.integration.DefaultHttpProtocolCustomizations
import software.amazon.smithy.swift.codegen.integration.HttpProtocolServiceClient
import software.amazon.smithy.swift.codegen.integration.ProtocolGenerator
import software.amazon.smithy.swift.codegen.integration.ServiceConfig
import software.amazon.smithy.swift.codegen.model.isInputEventStream
import software.amazon.smithy.swift.codegen.model.isOutputEventStream

abstract class AWSHttpProtocolCustomizations : DefaultHttpProtocolCustomizations() {

    override fun renderContextAttributes(ctx: ProtocolGenerator.GenerationContext, writer: SwiftWriter, serviceShape: ServiceShape, op: OperationShape) {
        val endpointPrefix = ctx.service.endpointPrefix // get endpoint prefix from smithy trait

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
            writer.write("try context.setupBidirectionalStreaming()")
        }
    }

    override fun renderInternals(ctx: ProtocolGenerator.GenerationContext) {
        AuthSchemeResolverGenerator().render(ctx)
        // Generate rules-based auth scheme resolver for services that depend on endpoint resolver for auth scheme resolution
        if (AuthSchemeResolverGenerator.usesRulesBasedAuthResolver(ctx)) {
            RulesBasedAuthSchemeResolverGenerator().render(ctx)
        }
        EndpointResolverGenerator(
            partitionDefinition = AWSClientRuntimeTypes.Core.AWSPartitionDefinition,
            dependency = AWSSwiftDependency.AWS_CLIENT_RUNTIME,
            endpointResolverMiddleware = { w, i, o, oe -> AWSEndpointResolverMiddleware(w, i, o, oe) }
        ).render(ctx)
    }

    override fun getClientProperties(): List<ClientProperty> {
        val properties = mutableListOf<ClientProperty>()
        val requestEncoderOptions = mutableMapOf<String, String>()
        val responseDecoderOptions = mutableMapOf<String, String>()
        requestEncoderOptions["dateEncodingStrategy"] = ".secondsSince1970"
        requestEncoderOptions["nonConformingFloatEncodingStrategy"] = ".convertToString(positiveInfinity: \"Infinity\", negativeInfinity: \"-Infinity\", nan: \"NaN\")"
        responseDecoderOptions["dateDecodingStrategy"] = ".secondsSince1970"
        responseDecoderOptions["nonConformingFloatDecodingStrategy"] = ".convertFromString(positiveInfinity: \"Infinity\", negativeInfinity: \"-Infinity\", nan: \"NaN\")"
        properties.add(AWSHttpRequestJsonEncoder(requestEncoderOptions))
        properties.add(AWSHttpResponseJsonDecoder(responseDecoderOptions))
        return properties
    }

    override fun serviceClient(
        ctx: ProtocolGenerator.GenerationContext,
        writer: SwiftWriter,
        serviceConfig: ServiceConfig
    ): HttpProtocolServiceClient {
        writer.addImport(AWSSwiftDependency.AWS_CLIENT_RUNTIME.target, false, "FileBasedConfig")
        val clientProperties = getClientProperties()
        return AWSHttpProtocolServiceClient(ctx, writer, clientProperties, serviceConfig)
    }
}
