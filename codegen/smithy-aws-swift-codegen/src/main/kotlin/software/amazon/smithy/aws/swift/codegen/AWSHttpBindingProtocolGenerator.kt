/*
 * Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
 * SPDX-License-Identifier: Apache-2.0.
 */
package software.amazon.smithy.aws.swift.codegen

import software.amazon.smithy.aws.swift.codegen.middleware.AWSSigningMiddleware
import software.amazon.smithy.aws.swift.codegen.middleware.EndpointResolverMiddleware
import software.amazon.smithy.aws.swift.codegen.middleware.RetryMiddleware
import software.amazon.smithy.aws.swift.codegen.middleware.UserAgentMiddleware
import software.amazon.smithy.codegen.core.Symbol
import software.amazon.smithy.model.shapes.MemberShape
import software.amazon.smithy.model.shapes.OperationShape
import software.amazon.smithy.model.shapes.Shape
import software.amazon.smithy.model.traits.TimestampFormatTrait
import software.amazon.smithy.swift.codegen.SwiftWriter
import software.amazon.smithy.swift.codegen.integration.HttpBindingProtocolGenerator
import software.amazon.smithy.swift.codegen.integration.HttpProtocolTestGenerator
import software.amazon.smithy.swift.codegen.integration.HttpProtocolUnitTestErrorGenerator
import software.amazon.smithy.swift.codegen.integration.HttpProtocolUnitTestGenerator
import software.amazon.smithy.swift.codegen.integration.HttpProtocolUnitTestRequestGenerator
import software.amazon.smithy.swift.codegen.integration.HttpProtocolUnitTestResponseGenerator
import software.amazon.smithy.swift.codegen.integration.ProtocolGenerator
import software.amazon.smithy.swift.codegen.integration.serde.json.StructDecodeGenerator
import software.amazon.smithy.swift.codegen.integration.serde.json.StructEncodeGenerator
import software.amazon.smithy.swift.codegen.model.ShapeMetadata

abstract class AWSHttpBindingProtocolGenerator : HttpBindingProtocolGenerator() {

    override var serviceErrorProtocolSymbol: Symbol = AWSClientRuntimeTypes.Core.AWSHttpServiceError

    override val unknownServiceErrorSymbol: Symbol = AWSClientRuntimeTypes.Core.UnknownAWSHttpServiceError
    override val httpProtocolClientGeneratorFactory = AWSHttpProtocolClientGeneratorFactory()

    val serdeContextJSON = HttpProtocolUnitTestGenerator.SerdeContext("JSONEncoder()", "JSONDecoder()", ".secondsSince1970")
    val serdeContextXML = HttpProtocolUnitTestGenerator.SerdeContext("XMLEncoder()", "XMLDecoder()")
    abstract val serdeContext: HttpProtocolUnitTestGenerator.SerdeContext

    val requestTestBuilder = HttpProtocolUnitTestRequestGenerator.Builder()
    val responseTestBuilder = HttpProtocolUnitTestResponseGenerator.Builder()
    val errorTestBuilder = HttpProtocolUnitTestErrorGenerator.Builder()

    override val shouldRenderDecodableBodyStructForInputShapes = true
    override val shouldRenderCodingKeysForEncodable = true

    override fun generateProtocolUnitTests(ctx: ProtocolGenerator.GenerationContext): Int {
        return HttpProtocolTestGenerator(
            ctx,
            requestTestBuilder,
            responseTestBuilder,
            errorTestBuilder,
            httpProtocolCustomizable,
            serdeContext
        ).generateProtocolTests()
    }

    override fun renderStructEncode(
        ctx: ProtocolGenerator.GenerationContext,
        shapeContainingMembers: Shape,
        shapeMetadata: Map<ShapeMetadata, Any>,
        members: List<MemberShape>,
        writer: SwiftWriter,
        defaultTimestampFormat: TimestampFormatTrait.Format,
    ) {
        val encodeGenerator = StructEncodeGenerator(ctx, members, writer, defaultTimestampFormat)
        encodeGenerator.render()
    }

    override fun renderStructDecode(
        ctx: ProtocolGenerator.GenerationContext,
        shapeMetaData: Map<ShapeMetadata, Any>,
        members: List<MemberShape>,
        writer: SwiftWriter,
        defaultTimestampFormat: TimestampFormatTrait.Format
    ) {
        val decoder = StructDecodeGenerator(ctx, members, writer, defaultTimestampFormat)
        decoder.render()
    }

    override fun addProtocolSpecificMiddleware(ctx: ProtocolGenerator.GenerationContext, operation: OperationShape) {

        val endpointResolverMiddleware = EndpointResolverMiddleware()
        val retryMiddleware = RetryMiddleware()
        operationMiddleware.appendMiddleware(operation, endpointResolverMiddleware.middlewareStep, endpointResolverMiddleware)
        operationMiddleware.appendMiddleware(operation, retryMiddleware.middlewareStep, retryMiddleware)

        if (AWSSigningMiddleware.hasSigV4AuthScheme(ctx.model, ctx.service, operation)) {
            val signingMiddleware = AWSSigningMiddleware()
            operationMiddleware.appendMiddleware(operation, signingMiddleware.middlewareStep, signingMiddleware)
        }
        val userAgentMiddleware = UserAgentMiddleware()
        operationMiddleware.appendMiddleware(operation, userAgentMiddleware.middlewareStep, userAgentMiddleware)
//        protocolMiddlewares.add(UserAgentMiddleware())
//        return defaultMiddlewares + protocolMiddlewares
    }
}
