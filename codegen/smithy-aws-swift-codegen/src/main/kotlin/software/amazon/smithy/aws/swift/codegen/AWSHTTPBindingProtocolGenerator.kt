/*
 * Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
 * SPDX-License-Identifier: Apache-2.0.
 */
package software.amazon.smithy.aws.swift.codegen

import software.amazon.smithy.aws.swift.codegen.message.MessageMarshallableGenerator
import software.amazon.smithy.aws.swift.codegen.message.MessageUnmarshallableGenerator
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
import software.amazon.smithy.swift.codegen.integration.HTTPBindingProtocolGenerator
import software.amazon.smithy.swift.codegen.integration.HTTPProtocolCustomizable
import software.amazon.smithy.swift.codegen.integration.HttpProtocolTestGenerator
import software.amazon.smithy.swift.codegen.integration.HttpProtocolUnitTestErrorGenerator
import software.amazon.smithy.swift.codegen.integration.HttpProtocolUnitTestRequestGenerator
import software.amazon.smithy.swift.codegen.integration.HttpProtocolUnitTestResponseGenerator
import software.amazon.smithy.swift.codegen.integration.ProtocolGenerator
import software.amazon.smithy.swift.codegen.integration.serde.struct.StructDecodeGenerator
import software.amazon.smithy.swift.codegen.integration.serde.struct.StructEncodeGenerator
import software.amazon.smithy.swift.codegen.model.ShapeMetadata
import software.amazon.smithy.swift.codegen.model.findStreamingMember
import software.amazon.smithy.swift.codegen.model.getTrait
import software.amazon.smithy.swift.codegen.model.isInputEventStream
import software.amazon.smithy.swift.codegen.model.isOutputEventStream
import software.amazon.smithy.swift.codegen.testModuleName

abstract class AWSHTTPBindingProtocolGenerator(
    customizations: HTTPProtocolCustomizable,
) : HTTPBindingProtocolGenerator(customizations) {

    override var serviceErrorProtocolSymbol: Symbol = AWSClientRuntimeTypes.Core.AWSServiceError

    override val retryErrorInfoProviderSymbol: Symbol
        get() = AWSClientRuntimeTypes.Core.AWSRetryErrorInfoProvider

    override val httpProtocolClientGeneratorFactory = AWSHttpProtocolClientGeneratorFactory()

    val requestTestBuilder = HttpProtocolUnitTestRequestGenerator.Builder()
    val responseTestBuilder = HttpProtocolUnitTestResponseGenerator.Builder()
    val errorTestBuilder = HttpProtocolUnitTestErrorGenerator.Builder()
    open val testsToIgnore: Set<String> = setOf()
    open val tagsToIgnore: Set<String> = setOf()

    override val shouldRenderEncodableConformance = false
    override fun generateProtocolUnitTests(ctx: ProtocolGenerator.GenerationContext): Int {
        val imports = listOf(AWSSwiftDependency.AWS_CLIENT_RUNTIME.target)
        return HttpProtocolTestGenerator(
            ctx,
            requestTestBuilder,
            responseTestBuilder,
            errorTestBuilder,
            customizations,
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
            if (testsTrait.testCases?.isEmpty() == true) {
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
        StructEncodeGenerator(ctx, shapeContainingMembers, members, shapeMetadata, writer).render()
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
        StructDecodeGenerator(ctx, shapeContainingMembers, members, shapeMetaData, writer).render()
    }

    override fun addProtocolSpecificMiddleware(ctx: ProtocolGenerator.GenerationContext, operation: OperationShape) {
        operationMiddleware.appendMiddleware(operation, OperationEndpointResolverMiddleware(ctx))
        operationMiddleware.appendMiddleware(operation, UserAgentMiddleware(ctx.settings))
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

    override fun generateMessageMarshallable(ctx: ProtocolGenerator.GenerationContext) {
        var streamingShapes = inputStreamingShapes(ctx)
        val messageMarshallableGenerator = MessageMarshallableGenerator(ctx, defaultContentType)
        streamingShapes.forEach { streamingMember ->
            messageMarshallableGenerator.render(streamingMember)
        }
    }

    override fun generateMessageUnmarshallable(ctx: ProtocolGenerator.GenerationContext) {
        var streamingShapes = outputStreamingShapes(ctx)
        val messageUnmarshallableGenerator = MessageUnmarshallableGenerator(ctx)
        streamingShapes.forEach { streamingMember ->
            messageUnmarshallableGenerator.render(streamingMember)
        }
    }
}
