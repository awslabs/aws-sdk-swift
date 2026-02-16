/*
 * Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
 * SPDX-License-Identifier: Apache-2.0.
 */

package software.amazon.smithy.aws.swift.codegen.protocols.awsjson

import software.amazon.smithy.aws.swift.codegen.middleware.AWSOperationEndpointResolverMiddleware
import software.amazon.smithy.aws.swift.codegen.middleware.AWSXAmzTargetMiddleware
import software.amazon.smithy.aws.swift.codegen.middleware.UserAgentMiddleware
import software.amazon.smithy.aws.swift.codegen.swiftmodules.AWSClientRuntimeTypes

@Suppress("ktlint:standard:class-naming")
class AWSJSON1_1ProtocolGenerator :
    software.amazon.smithy.swift.codegen.aws.protocols.awsjson.AWSJSON1_1ProtocolGenerator(
        customizations = AWSJSONCustomizations(),
        operationEndpointResolverMiddlewareFactory = { ctx, sym -> AWSOperationEndpointResolverMiddleware(ctx, sym) },
        userAgentMiddlewareFactory = { ctx -> UserAgentMiddleware(ctx.settings) },
        xAmzTargetMiddlewareFactory = { ctx -> AWSXAmzTargetMiddleware(ctx.model, ctx.symbolProvider, ctx.service) },
        serviceErrorProtocolSymbolOverride = AWSClientRuntimeTypes.Core.AWSServiceError,
        clockSkewProviderSymbolOverride = AWSClientRuntimeTypes.Core.AWSClockSkewProvider,
        retryErrorInfoProviderSymbolOverride = AWSClientRuntimeTypes.Core.AWSRetryErrorInfoProvider,
    )
