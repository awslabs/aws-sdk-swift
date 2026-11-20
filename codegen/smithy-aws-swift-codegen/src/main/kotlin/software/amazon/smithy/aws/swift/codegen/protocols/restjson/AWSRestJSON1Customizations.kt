/*
 * Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
 * SPDX-License-Identifier: Apache-2.0.
 */

package software.amazon.smithy.aws.swift.codegen.protocols.restjson

import software.amazon.smithy.aws.swift.codegen.AWSHTTPProtocolCustomizations
import software.amazon.smithy.aws.swift.codegen.plugins.UnknownAWSHTTPServiceErrorPlugin
import software.amazon.smithy.codegen.core.Symbol
import software.amazon.smithy.swift.codegen.SwiftWriter
import software.amazon.smithy.swift.codegen.integration.Plugin
import software.amazon.smithy.swift.codegen.swiftmodules.ClientRuntimeTypes
import software.amazon.smithy.swift.codegen.swiftmodules.SmithyRestJson1Types

class AWSRestJSON1Customizations : AWSHTTPProtocolCustomizations() {
    override val baseErrorSymbol: Symbol = ClientRuntimeTypes.RestJSON.RestJSONError

    override val plugins: List<Plugin> = listOf(UnknownAWSHTTPServiceErrorPlugin())

    override fun renderClientProtocol(writer: SwiftWriter): String = writer.format("\$N()", SmithyRestJson1Types.HTTPClientProtocol)
}
