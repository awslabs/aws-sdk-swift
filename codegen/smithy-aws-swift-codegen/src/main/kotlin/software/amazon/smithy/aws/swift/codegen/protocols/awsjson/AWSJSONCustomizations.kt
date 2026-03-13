/*
 * Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
 * SPDX-License-Identifier: Apache-2.0.
 */

package software.amazon.smithy.aws.swift.codegen.protocols.awsjson

import software.amazon.smithy.aws.swift.codegen.AWSHTTPProtocolCustomizations
import software.amazon.smithy.codegen.core.Symbol
import software.amazon.smithy.model.traits.TimestampFormatTrait
import software.amazon.smithy.swift.codegen.SwiftWriter
import software.amazon.smithy.swift.codegen.integration.Plugin
import software.amazon.smithy.swift.codegen.swiftmodules.AWSJSONTypes
import software.amazon.smithy.swift.codegen.swiftmodules.ClientRuntimeTypes

class AWSJSONCustomizations(
    private val version: String,
) : AWSHTTPProtocolCustomizations() {
    override val baseErrorSymbol: Symbol = ClientRuntimeTypes.AWSJSON.AWSJSONError

    override val defaultTimestampFormat = TimestampFormatTrait.Format.EPOCH_SECONDS

    override val plugins: List<Plugin> = listOf(AWSJSONPlugin())

    override fun renderClientProtocol(writer: SwiftWriter): String =
        writer.format("\$N(version: .v\$L)", AWSJSONTypes.HTTPClientProtocol, version)
}
