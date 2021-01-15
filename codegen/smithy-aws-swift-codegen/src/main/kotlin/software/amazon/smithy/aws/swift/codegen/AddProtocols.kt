/*
 * Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
 * SPDX-License-Identifier: Apache-2.0.
 */
package software.amazon.smithy.aws.swift.codegen

import software.amazon.smithy.aws.swift.codegen.awsjson.AwsJson1_0_ProtocolGenerator
import software.amazon.smithy.aws.swift.codegen.restjson.AWSRestJson1ProtocolGenerator
import software.amazon.smithy.swift.codegen.integration.SwiftIntegration
import software.amazon.smithy.swift.codegen.integration.ProtocolGenerator

/**
 * Integration that registers protocol generators this package provides
 */
class AddProtocols : SwiftIntegration {
    /**
     * Gets the sort order of the customization from -128 to 127, with lowest
     * executed first.
     *
     * @return Returns the sort order, defaults to -10.
     */
    override val order: Byte = -10

    override val protocolGenerators: List<ProtocolGenerator> = listOf(AWSRestJson1ProtocolGenerator(),
            AwsJson1_0_ProtocolGenerator())
}
