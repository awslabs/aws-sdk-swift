/*
 * Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
 * SPDX-License-Identifier: Apache-2.0.
 */

package software.amazon.smithy.aws.swift.codegen.config

import software.amazon.smithy.aws.swift.codegen.swiftmodules.AWSClientRuntimeTypes
import software.amazon.smithy.aws.swift.codegen.AWSSwiftDependency
import software.amazon.smithy.codegen.core.Symbol
import software.amazon.smithy.swift.codegen.SwiftTypes
import software.amazon.smithy.swift.codegen.config.ClientConfiguration
import software.amazon.smithy.swift.codegen.config.ClientConfiguration.Companion.runtimeSymbol
import software.amazon.smithy.swift.codegen.config.ConfigProperty
import software.amazon.smithy.swift.codegen.integration.ProtocolGenerator
import software.amazon.smithy.swift.codegen.model.toGeneric
import software.amazon.smithy.swift.codegen.model.toOptional
import software.amazon.smithy.swift.codegen.swiftmodules.SmithyIdentityAPITypes

class AWSDefaultClientConfiguration : ClientConfiguration {
    override val swiftProtocolName: Symbol
        get() = runtimeSymbol("AWSDefaultClientConfiguration", AWSSwiftDependency.AWS_CLIENT_RUNTIME)

    override fun getProperties(ctx: ProtocolGenerator.GenerationContext): Set<ConfigProperty> = setOf(
        ConfigProperty("useFIPS", SwiftTypes.Bool.toOptional()),
        ConfigProperty("useDualStack", SwiftTypes.Bool.toOptional()),
        ConfigProperty(
            "appID",
            SwiftTypes.String.toOptional(),
            "AWSClientConfigDefaultsProvider.appID()",
            true
        ),
        ConfigProperty(
            "awsCredentialIdentityResolver",
            SmithyIdentityAPITypes.AWSCredentialIdentityResolver.toGeneric(),
            "AWSClientConfigDefaultsProvider.awsCredentialIdentityResolver(awsCredentialIdentityResolver)",
            true
        ),
        ConfigProperty(
            "awsRetryMode",
            AWSClientRuntimeTypes.Core.AWSRetryMode,
            "AWSClientConfigDefaultsProvider.retryMode()",
            true
        ),
    )
}
