/*
 * Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
 * SPDX-License-Identifier: Apache-2.0.
 */

package software.amazon.smithy.aws.swift.codegen.protocols.ec2query

import software.amazon.smithy.aws.swift.codegen.middleware.AWSOperationEndpointResolverMiddleware
import software.amazon.smithy.aws.swift.codegen.middleware.UserAgentMiddleware
import software.amazon.smithy.aws.swift.codegen.swiftmodules.AWSClientRuntimeTypes

class EC2QueryProtocolGenerator : software.amazon.smithy.swift.codegen.aws.protocols.ec2query.EC2QueryProtocolGenerator(
    customizations = EC2QueryCustomizations(),
    operationEndpointResolverMiddlewareFactory = { ctx, sym -> AWSOperationEndpointResolverMiddleware(ctx, sym) },
    userAgentMiddlewareFactory = { ctx -> UserAgentMiddleware(ctx.settings) },
    serviceErrorProtocolSymbolOverride = AWSClientRuntimeTypes.Core.AWSServiceError,
    clockSkewProviderSymbolOverride = AWSClientRuntimeTypes.Core.AWSClockSkewProvider,
    retryErrorInfoProviderSymbolOverride = AWSClientRuntimeTypes.Core.AWSRetryErrorInfoProvider,
)
