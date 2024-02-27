/*
 * Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
 * SPDX-License-Identifier: Apache-2.0.
 */

package software.amazon.smithy.aws.swift.codegen.config

import software.amazon.smithy.aws.swift.codegen.AWSClientRuntimeTypes
import software.amazon.smithy.aws.swift.codegen.AWSSwiftDependency
import software.amazon.smithy.codegen.core.Symbol
import software.amazon.smithy.swift.codegen.SwiftTypes
import software.amazon.smithy.swift.codegen.config.ClientConfiguration
import software.amazon.smithy.swift.codegen.config.ClientConfiguration.Companion.runtimeSymbol
import software.amazon.smithy.swift.codegen.config.ConfigProperty
import software.amazon.smithy.swift.codegen.model.toNullable

class AWSDefaultClientConfiguration : ClientConfiguration {
    override val swiftProtocolName: Symbol
        get() = runtimeSymbol("AWSDefaultClientConfiguration", AWSSwiftDependency.AWS_CLIENT_RUNTIME)

    override val properties: Set<ConfigProperty>
        get() = setOf(
            ConfigProperty("useFIPS", SwiftTypes.Bool.toNullable()),
            ConfigProperty("useDualStack", SwiftTypes.Bool.toNullable()),
            ConfigProperty("appID", SwiftTypes.String.toNullable(), "AWSClientConfigDefaultsProvider.appID()", true),
            ConfigProperty("awsCredentialIdentityResolver", AWSClientRuntimeTypes.Core.AWSCredentialIdentityResolver, "AWSClientConfigDefaultsProvider.awsCredentialIdentityResolver(awsCredentialIdentityResolver)", true),
            ConfigProperty("awsRetryMode", AWSClientRuntimeTypes.Core.AWSRetryMode, "AWSClientConfigDefaultsProvider.retryMode()", true),
        )
}
