/*
 * Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
 * SPDX-License-Identifier: Apache-2.0.
 */
package software.amazon.smithy.aws.swift.codegen

import software.amazon.smithy.aws.swift.codegen.middleware.AWSSigningMiddleware
import software.amazon.smithy.aws.swift.codegen.middleware.OperationEndpointResolverMiddleware
import software.amazon.smithy.aws.swift.codegen.middleware.UserAgentMiddleware
import software.amazon.smithy.codegen.core.Symbol
import software.amazon.smithy.model.shapes.MemberShape
import software.amazon.smithy.model.shapes.OperationShape
import software.amazon.smithy.model.shapes.Shape
import software.amazon.smithy.model.shapes.ShapeId
import software.amazon.smithy.model.shapes.UnionShape
import software.amazon.smithy.model.traits.TimestampFormatTrait
import software.amazon.smithy.rulesengine.language.EndpointRuleSet
import software.amazon.smithy.rulesengine.traits.EndpointRuleSetTrait
import software.amazon.smithy.rulesengine.traits.EndpointTestsTrait
import software.amazon.smithy.swift.codegen.SwiftWriter
import software.amazon.smithy.swift.codegen.integration.HttpBindingProtocolGenerator
import software.amazon.smithy.swift.codegen.integration.HttpProtocolTestGenerator
import software.amazon.smithy.swift.codegen.integration.HttpProtocolUnitTestErrorGenerator
import software.amazon.smithy.swift.codegen.integration.HttpProtocolUnitTestRequestGenerator
import software.amazon.smithy.swift.codegen.integration.HttpProtocolUnitTestResponseGenerator
import software.amazon.smithy.swift.codegen.integration.ProtocolGenerator
import software.amazon.smithy.swift.codegen.integration.serde.json.StructDecodeGenerator
import software.amazon.smithy.swift.codegen.integration.serde.json.StructEncodeGenerator
import software.amazon.smithy.swift.codegen.model.ShapeMetadata
import software.amazon.smithy.swift.codegen.model.findStreamingMember
import software.amazon.smithy.swift.codegen.model.getTrait
import software.amazon.smithy.swift.codegen.model.isInputEventStream
import software.amazon.smithy.swift.codegen.model.isOutputEventStream
import software.amazon.smithy.swift.codegen.testModuleName

abstract class AWSHttpBindingProtocolGenerator : HttpBindingProtocolGenerator() {

    override var serviceErrorProtocolSymbol: Symbol = AWSClientRuntimeTypes.Core.AWSServiceError

    override val unknownServiceErrorSymbol: Symbol = AWSClientRuntimeTypes.Core.UnknownAWSHTTPServiceError

    override val retryErrorInfoProviderSymbol: Symbol
        get() = AWSClientRuntimeTypes.Core.AWSRetryErrorInfoProvider

    override val httpProtocolClientGeneratorFactory = AWSHttpProtocolClientGeneratorFactory()

    val requestTestBuilder = HttpProtocolUnitTestRequestGenerator.Builder()
    val responseTestBuilder = HttpProtocolUnitTestResponseGenerator.Builder()
    val errorTestBuilder = HttpProtocolUnitTestErrorGenerator.Builder()
    open val testsToIgnore: Set<String> = setOf()
    open val tagsToIgnore: Set<String> = setOf()

    override val shouldRenderDecodableBodyStructForInputShapes = true
    override val shouldRenderCodingKeysForEncodable = true
    override val shouldRenderEncodableConformance = false
    override fun generateProtocolUnitTests(ctx: ProtocolGenerator.GenerationContext): Int {
        val imports = listOf(AWSSwiftDependency.AWS_CLIENT_RUNTIME.target)
        return HttpProtocolTestGenerator(
            ctx,
            requestTestBuilder,
            responseTestBuilder,
            errorTestBuilder,
            httpProtocolCustomizable,
            operationMiddleware,
            getProtocolHttpBindingResolver(ctx, defaultContentType),
            imports,
            testsToIgnore,
            tagsToIgnore,
        ).generateProtocolTests() + renderEndpointsTests(ctx)
    }

    fun renderEndpointsTests(ctx: ProtocolGenerator.GenerationContext): Int {
        val ruleSetNode = ctx.service.getTrait<EndpointRuleSetTrait>()?.ruleSet
        val ruleSet = if (ruleSetNode != null) EndpointRuleSet.fromNode(ruleSetNode) else null
        var testCount = 0

        ctx.service.getTrait<EndpointTestsTrait>()?.let { testsTrait ->
            if (testsTrait?.testCases.isEmpty()) {
                return 0
            }

            ctx.delegator.useFileWriter("./${ctx.settings.testModuleName}/EndpointResolverTest.swift") { swiftWriter ->
                testCount = + EndpointTestGenerator(testsTrait, ruleSet, ctx).render(swiftWriter)
            }
        }

        return testCount
    }

    override fun renderStructEncode(
        ctx: ProtocolGenerator.GenerationContext,
        shapeContainingMembers: Shape,
        shapeMetadata: Map<ShapeMetadata, Any>,
        members: List<MemberShape>,
        writer: SwiftWriter,
        defaultTimestampFormat: TimestampFormatTrait.Format,
        path: String?
    ) {
        val encodeGenerator = StructEncodeGenerator(ctx, members, writer, defaultTimestampFormat, path)
        encodeGenerator.render()
    }

    override fun renderStructDecode(
        ctx: ProtocolGenerator.GenerationContext,
        shapeContainingMembers: Shape,
        shapeMetaData: Map<ShapeMetadata, Any>,
        members: List<MemberShape>,
        writer: SwiftWriter,
        defaultTimestampFormat: TimestampFormatTrait.Format,
        path: String
    ) {
        val decoder = StructDecodeGenerator(ctx, members, writer, defaultTimestampFormat, path)
        decoder.render()
    }

    override fun addProtocolSpecificMiddleware(ctx: ProtocolGenerator.GenerationContext, operation: OperationShape) {
        operationMiddleware.appendMiddleware(operation, OperationEndpointResolverMiddleware(ctx))

        if (AWSSigningMiddleware.hasSigV4AuthScheme(ctx.model, ctx.service, operation)) {
            val params = AWSSigningParams(
                ctx.service,
                operation,
                useSignatureTypeQueryString = false,
                forceUnsignedBody = false,
                useExpiration = false,
                signingAlgorithm = SigningAlgorithm.SigV4
            )
            operationMiddleware.appendMiddleware(operation, AWSSigningMiddleware(ctx.model, ctx.symbolProvider, params))
        }

        operationMiddleware.appendMiddleware(operation, UserAgentMiddleware(ctx.settings))
    }

    override fun generateMessageMarshallable(ctx: ProtocolGenerator.GenerationContext) {
        var streamingShapes = outputStreamingShapes(ctx)
        val messageUnmarshallableGenerator = MessageUnmarshallableGenerator(ctx)
        streamingShapes.forEach { streamingMember ->
            messageUnmarshallableGenerator.renderNotImplemented(streamingMember)
        }
    }

    override fun generateMessageUnmarshallable(ctx: ProtocolGenerator.GenerationContext) {
        val streamingShapes = inputStreamingShapes(ctx)
        val messageMarshallableGenerator = MessageMarshallableGenerator(ctx, defaultContentType)
        for (streamingShape in streamingShapes) {
            messageMarshallableGenerator.renderNotImplemented(streamingShape)
        }
    }

    fun outputStreamingShapes(ctx: ProtocolGenerator.GenerationContext): MutableSet<MemberShape> {
        val streamingShapes = mutableMapOf<ShapeId, MemberShape>()
        val streamingOperations = getHttpBindingOperations(ctx).filter { it.isOutputEventStream(ctx.model) }
        streamingOperations.forEach { operation ->
            val input = operation.output.get()
            val streamingMember = ctx.model.expectShape(input).findStreamingMember(ctx.model)
            streamingMember?.let {
                val targetType = ctx.model.expectShape(it.target)
                streamingShapes[targetType.id] = it
            }
        }

        return streamingShapes.values.toMutableSet()
    }

    fun inputStreamingShapes(ctx: ProtocolGenerator.GenerationContext): MutableSet<UnionShape> {
        val streamingShapes = mutableSetOf<UnionShape>()
        val streamingOperations = getHttpBindingOperations(ctx).filter { it.isInputEventStream(ctx.model) }
        streamingOperations.forEach { operation ->
            val input = operation.input.get()
            val streamingMember = ctx.model.expectShape(input).findStreamingMember(ctx.model)
            streamingMember?.let {
                val targetType = ctx.model.expectShape(it.target)
                streamingShapes.add(targetType as UnionShape)
            }
        }
        return streamingShapes
    }
}
