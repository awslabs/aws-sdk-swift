/*
 * Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
 * SPDX-License-Identifier: Apache-2.0.
 */
package software.amazon.smithy.aws.swift.codegen

import software.amazon.smithy.aws.swift.codegen.middleware.AWSOperationEndpointResolverMiddleware
import software.amazon.smithy.aws.swift.codegen.middleware.AWSXAmzTargetMiddleware
import software.amazon.smithy.aws.swift.codegen.middleware.UserAgentMiddleware
import software.amazon.smithy.aws.swift.codegen.protocols.awsjson.AWSJSONCustomizations
import software.amazon.smithy.aws.swift.codegen.protocols.awsquery.AWSQueryCustomizations
import software.amazon.smithy.aws.swift.codegen.protocols.ec2query.EC2QueryCustomizations
import software.amazon.smithy.aws.swift.codegen.protocols.restjson.RestJSONCustomizations
import software.amazon.smithy.aws.swift.codegen.protocols.restxml.RestXMLCustomizations
import software.amazon.smithy.aws.swift.codegen.protocols.rpcv2cbor.AWSRpcV2CborCustomizations
import software.amazon.smithy.aws.swift.codegen.swiftmodules.AWSClientRuntimeTypes
import software.amazon.smithy.codegen.core.Symbol
import software.amazon.smithy.swift.codegen.aws.protocols.awsjson.AWSJSON1_0ProtocolGenerator
import software.amazon.smithy.swift.codegen.aws.protocols.awsjson.AWSJSON1_1ProtocolGenerator
import software.amazon.smithy.swift.codegen.aws.protocols.awsquery.AWSQueryProtocolGenerator
import software.amazon.smithy.swift.codegen.aws.protocols.ec2query.EC2QueryProtocolGenerator
import software.amazon.smithy.swift.codegen.aws.protocols.restjson.RestJson1ProtocolGenerator
import software.amazon.smithy.swift.codegen.aws.protocols.restxml.RestXmlProtocolGenerator
import software.amazon.smithy.swift.codegen.integration.ProtocolGenerator
import software.amazon.smithy.swift.codegen.integration.SwiftIntegration
import software.amazon.smithy.swift.codegen.middleware.MiddlewareRenderable
import software.amazon.smithy.swift.codegen.protocols.rpcv2cbor.RpcV2CborProtocolGenerator

/**
 * Registers protocol generators configured with AWS-specific middleware and symbols.
 */
class AddProtocols : SwiftIntegration {
    override val order: Byte = -10

    override val protocolGenerators: List<ProtocolGenerator> =
        listOf(
            RestJson1ProtocolGenerator(
                customizations = RestJSONCustomizations(),
                operationEndpointResolverMiddlewareFactory = endpointMiddleware,
                userAgentMiddlewareFactory = userAgentMiddleware,
                serviceErrorProtocolSymbolOverride = awsServiceError,
                clockSkewProviderSymbolOverride = awsClockSkew,
                retryErrorInfoProviderSymbolOverride = awsRetryErrorInfo,
            ),
            AWSJSON1_0ProtocolGenerator(
                customizations = AWSJSONCustomizations(),
                operationEndpointResolverMiddlewareFactory = endpointMiddleware,
                userAgentMiddlewareFactory = userAgentMiddleware,
                xAmzTargetMiddlewareFactory = xAmzTargetMiddleware,
                serviceErrorProtocolSymbolOverride = awsServiceError,
                clockSkewProviderSymbolOverride = awsClockSkew,
                retryErrorInfoProviderSymbolOverride = awsRetryErrorInfo,
            ),
            AWSJSON1_1ProtocolGenerator(
                customizations = AWSJSONCustomizations(),
                operationEndpointResolverMiddlewareFactory = endpointMiddleware,
                userAgentMiddlewareFactory = userAgentMiddleware,
                xAmzTargetMiddlewareFactory = xAmzTargetMiddleware,
                serviceErrorProtocolSymbolOverride = awsServiceError,
                clockSkewProviderSymbolOverride = awsClockSkew,
                retryErrorInfoProviderSymbolOverride = awsRetryErrorInfo,
            ),
            RestXmlProtocolGenerator(
                customizations = RestXMLCustomizations(),
                operationEndpointResolverMiddlewareFactory = endpointMiddleware,
                userAgentMiddlewareFactory = userAgentMiddleware,
                serviceErrorProtocolSymbolOverride = awsServiceError,
                clockSkewProviderSymbolOverride = awsClockSkew,
                retryErrorInfoProviderSymbolOverride = awsRetryErrorInfo,
            ),
            AWSQueryProtocolGenerator(
                customizations = AWSQueryCustomizations(),
                operationEndpointResolverMiddlewareFactory = endpointMiddleware,
                userAgentMiddlewareFactory = userAgentMiddleware,
                serviceErrorProtocolSymbolOverride = awsServiceError,
                clockSkewProviderSymbolOverride = awsClockSkew,
                retryErrorInfoProviderSymbolOverride = awsRetryErrorInfo,
            ),
            EC2QueryProtocolGenerator(
                customizations = EC2QueryCustomizations(),
                operationEndpointResolverMiddlewareFactory = endpointMiddleware,
                userAgentMiddlewareFactory = userAgentMiddleware,
                serviceErrorProtocolSymbolOverride = awsServiceError,
                clockSkewProviderSymbolOverride = awsClockSkew,
                retryErrorInfoProviderSymbolOverride = awsRetryErrorInfo,
            ),
            RpcV2CborProtocolGenerator(
                customizations = AWSRpcV2CborCustomizations(),
                operationEndpointResolverMiddlewareFactory = endpointMiddleware,
                userAgentMiddlewareFactory = userAgentMiddleware,
                serviceErrorProtocolSymbolOverride = awsServiceError,
                clockSkewProviderSymbolOverride = awsClockSkew,
                retryErrorInfoProviderSymbolOverride = awsRetryErrorInfo,
            ),
        )

    companion object {
        private val awsServiceError: Symbol = AWSClientRuntimeTypes.Core.AWSServiceError
        private val awsClockSkew: Symbol = AWSClientRuntimeTypes.Core.AWSClockSkewProvider
        private val awsRetryErrorInfo: Symbol = AWSClientRuntimeTypes.Core.AWSRetryErrorInfoProvider

        private val endpointMiddleware: (ProtocolGenerator.GenerationContext, Symbol) -> MiddlewareRenderable =
            { ctx, sym -> AWSOperationEndpointResolverMiddleware(ctx, sym) }

        private val userAgentMiddleware: (ProtocolGenerator.GenerationContext) -> MiddlewareRenderable =
            { ctx -> UserAgentMiddleware(ctx.settings) }

        private val xAmzTargetMiddleware: (ProtocolGenerator.GenerationContext) -> MiddlewareRenderable =
            { ctx -> AWSXAmzTargetMiddleware(ctx.model, ctx.symbolProvider, ctx.service) }
    }
}
