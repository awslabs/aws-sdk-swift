/*
 * Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
 * SPDX-License-Identifier: Apache-2.0.
 */

package software.amazon.smithy.aws.swift.codegen.protocols.awsquery

import software.amazon.smithy.aws.swift.codegen.middleware.AWSOperationEndpointResolverMiddleware
import software.amazon.smithy.aws.swift.codegen.middleware.UserAgentMiddleware
import software.amazon.smithy.aws.swift.codegen.swiftmodules.AWSClientRuntimeTypes

open class AWSQueryProtocolGenerator :
    software.amazon.smithy.swift.codegen.aws.protocols.awsquery.AWSQueryProtocolGenerator(
        customizations = AWSQueryCustomizations(),
        operationEndpointResolverMiddlewareFactory = { ctx, sym -> AWSOperationEndpointResolverMiddleware(ctx, sym) },
        userAgentMiddlewareFactory = { ctx -> UserAgentMiddleware(ctx.settings) },
        serviceErrorProtocolSymbolOverride = AWSClientRuntimeTypes.Core.AWSServiceError,
        clockSkewProviderSymbolOverride = AWSClientRuntimeTypes.Core.AWSClockSkewProvider,
        retryErrorInfoProviderSymbolOverride = AWSClientRuntimeTypes.Core.AWSRetryErrorInfoProvider,
    )
