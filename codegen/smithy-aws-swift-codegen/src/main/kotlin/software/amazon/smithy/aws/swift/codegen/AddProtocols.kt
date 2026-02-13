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
import software.amazon.smithy.swift.codegen.aws.protocols.awsjson.AWSJSON1_0ProtocolGenerator
import software.amazon.smithy.swift.codegen.aws.protocols.awsjson.AWSJSON1_1ProtocolGenerator
import software.amazon.smithy.swift.codegen.aws.protocols.awsquery.AWSQueryProtocolGenerator
import software.amazon.smithy.swift.codegen.aws.protocols.ec2query.EC2QueryProtocolGenerator
import software.amazon.smithy.swift.codegen.aws.protocols.restjson.RestJson1ProtocolGenerator
import software.amazon.smithy.swift.codegen.aws.protocols.restxml.RestXmlProtocolGenerator
import software.amazon.smithy.swift.codegen.integration.ProtocolGenerator
import software.amazon.smithy.swift.codegen.integration.SwiftIntegration
import software.amazon.smithy.swift.codegen.protocols.rpcv2cbor.RpcV2CborProtocolGenerator

/**
 * Integration that registers protocol generators this package provides
 */
class AddProtocols : SwiftIntegration {
    override val order: Byte = -10

    override val protocolGenerators: List<ProtocolGenerator> =
        listOf(
            RestJson1ProtocolGenerator(
                customizations = RestJSONCustomizations(),
                operationEndpointResolverMiddlewareFactory = ::awsEndpointResolverMiddleware,
                userAgentMiddlewareFactory = ::awsUserAgentMiddleware,
                serviceErrorProtocolSymbolOverride = AWSClientRuntimeTypes.Core.AWSServiceError,
                clockSkewProviderSymbolOverride = AWSClientRuntimeTypes.Core.AWSClockSkewProvider,
                retryErrorInfoProviderSymbolOverride = AWSClientRuntimeTypes.Core.AWSRetryErrorInfoProvider,
            ),
            AWSJSON1_0ProtocolGenerator(
                customizations = AWSJSONCustomizations(),
                operationEndpointResolverMiddlewareFactory = ::awsEndpointResolverMiddleware,
                userAgentMiddlewareFactory = ::awsUserAgentMiddleware,
                xAmzTargetMiddlewareFactory = ::awsXAmzTargetMiddleware,
                serviceErrorProtocolSymbolOverride = AWSClientRuntimeTypes.Core.AWSServiceError,
                clockSkewProviderSymbolOverride = AWSClientRuntimeTypes.Core.AWSClockSkewProvider,
                retryErrorInfoProviderSymbolOverride = AWSClientRuntimeTypes.Core.AWSRetryErrorInfoProvider,
            ),
            AWSJSON1_1ProtocolGenerator(
                customizations = AWSJSONCustomizations(),
                operationEndpointResolverMiddlewareFactory = ::awsEndpointResolverMiddleware,
                userAgentMiddlewareFactory = ::awsUserAgentMiddleware,
                xAmzTargetMiddlewareFactory = ::awsXAmzTargetMiddleware,
                serviceErrorProtocolSymbolOverride = AWSClientRuntimeTypes.Core.AWSServiceError,
                clockSkewProviderSymbolOverride = AWSClientRuntimeTypes.Core.AWSClockSkewProvider,
                retryErrorInfoProviderSymbolOverride = AWSClientRuntimeTypes.Core.AWSRetryErrorInfoProvider,
            ),
            RestXmlProtocolGenerator(
                customizations = RestXMLCustomizations(),
                operationEndpointResolverMiddlewareFactory = ::awsEndpointResolverMiddleware,
                userAgentMiddlewareFactory = ::awsUserAgentMiddleware,
                serviceErrorProtocolSymbolOverride = AWSClientRuntimeTypes.Core.AWSServiceError,
                clockSkewProviderSymbolOverride = AWSClientRuntimeTypes.Core.AWSClockSkewProvider,
                retryErrorInfoProviderSymbolOverride = AWSClientRuntimeTypes.Core.AWSRetryErrorInfoProvider,
            ),
            AWSQueryProtocolGenerator(
                customizations = AWSQueryCustomizations(),
                operationEndpointResolverMiddlewareFactory = ::awsEndpointResolverMiddleware,
                userAgentMiddlewareFactory = ::awsUserAgentMiddleware,
                serviceErrorProtocolSymbolOverride = AWSClientRuntimeTypes.Core.AWSServiceError,
                clockSkewProviderSymbolOverride = AWSClientRuntimeTypes.Core.AWSClockSkewProvider,
                retryErrorInfoProviderSymbolOverride = AWSClientRuntimeTypes.Core.AWSRetryErrorInfoProvider,
            ),
            EC2QueryProtocolGenerator(
                customizations = EC2QueryCustomizations(),
                operationEndpointResolverMiddlewareFactory = ::awsEndpointResolverMiddleware,
                userAgentMiddlewareFactory = ::awsUserAgentMiddleware,
                serviceErrorProtocolSymbolOverride = AWSClientRuntimeTypes.Core.AWSServiceError,
                clockSkewProviderSymbolOverride = AWSClientRuntimeTypes.Core.AWSClockSkewProvider,
                retryErrorInfoProviderSymbolOverride = AWSClientRuntimeTypes.Core.AWSRetryErrorInfoProvider,
            ),
            RpcV2CborProtocolGenerator(
                customizations = AWSRpcV2CborCustomizations(),
                operationEndpointResolverMiddlewareFactory = ::awsEndpointResolverMiddleware,
                userAgentMiddlewareFactory = ::awsUserAgentMiddleware,
                serviceErrorProtocolSymbolOverride = AWSClientRuntimeTypes.Core.AWSServiceError,
                clockSkewProviderSymbolOverride = AWSClientRuntimeTypes.Core.AWSClockSkewProvider,
                retryErrorInfoProviderSymbolOverride = AWSClientRuntimeTypes.Core.AWSRetryErrorInfoProvider,
            ),
        )

    companion object {
        private fun awsEndpointResolverMiddleware(
            ctx: ProtocolGenerator.GenerationContext,
            endpointMiddlewareSymbol: software.amazon.smithy.codegen.core.Symbol,
        ) = AWSOperationEndpointResolverMiddleware(ctx, endpointMiddlewareSymbol)

        private fun awsUserAgentMiddleware(
            ctx: ProtocolGenerator.GenerationContext,
        ) = UserAgentMiddleware(ctx.settings)

        private fun awsXAmzTargetMiddleware(
            ctx: ProtocolGenerator.GenerationContext,
        ) = AWSXAmzTargetMiddleware(ctx.model, ctx.symbolProvider, ctx.service)
    }
}
