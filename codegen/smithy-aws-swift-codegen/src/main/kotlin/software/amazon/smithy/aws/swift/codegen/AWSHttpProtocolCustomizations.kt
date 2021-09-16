/*
 * Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
 * SPDX-License-Identifier: Apache-2.0.
 */

package software.amazon.smithy.aws.swift.codegen

import software.amazon.smithy.aws.swift.codegen.middleware.AWSSigningMiddleware
import software.amazon.smithy.model.node.Node
import software.amazon.smithy.model.shapes.OperationShape
import software.amazon.smithy.model.shapes.ServiceShape
import software.amazon.smithy.swift.codegen.SwiftWriter
import software.amazon.smithy.swift.codegen.integration.ClientProperty
import software.amazon.smithy.swift.codegen.integration.DefaultHttpProtocolCustomizations
import software.amazon.smithy.swift.codegen.integration.HttpProtocolServiceClient
import software.amazon.smithy.swift.codegen.integration.ProtocolGenerator
import software.amazon.smithy.swift.codegen.integration.ServiceConfig

abstract class AWSHttpProtocolCustomizations : DefaultHttpProtocolCustomizations() {

    override fun renderContextAttributes(ctx: ProtocolGenerator.GenerationContext, writer: SwiftWriter, serviceShape: ServiceShape, op: OperationShape) {
        val endpointPrefix = ctx.service.endpointPrefix // get endpoint prefix from smithy trait

        // FIXME handle indentation properly or do swift formatting after the fact
        writer.write("  .withCredentialsProvider(value: config.credentialsProvider)")
        writer.write("  .withRegion(value: config.region)")
        if (AWSSigningMiddleware.hasSigV4AuthScheme(ctx.model, ctx.service, op)) {
            val signingName = AWSSigningMiddleware.signingServiceName(serviceShape)
            writer.write("  .withSigningName(value: \$S)", signingName)
            writer.write("  .withSigningRegion(value: config.signingRegion)")
        }
    }

    override fun renderInternals(ctx: ProtocolGenerator.GenerationContext) {
        val endpointData = Node.parse(EndpointResolverGenerator::class.java.getResource("/software.amazon.smithy.aws.swift.codegen/endpoints.json").readText()).expectObjectNode()
        EndpointResolverGenerator(endpointData).render(ctx)
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
        writer.addImport(AWSSwiftDependency.AWS_CLIENT_RUNTIME.target)
        val clientProperties = getClientProperties()
        return AWSHttpProtocolServiceClient(ctx, writer, clientProperties, serviceConfig)
    }
}
