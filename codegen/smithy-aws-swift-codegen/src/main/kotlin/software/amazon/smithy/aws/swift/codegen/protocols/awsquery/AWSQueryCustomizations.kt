/*
 * Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
 * SPDX-License-Identifier: Apache-2.0.
 */

package software.amazon.smithy.aws.swift.codegen.protocols.awsquery

import software.amazon.smithy.aws.swift.codegen.AWSHTTPProtocolCustomizations
import software.amazon.smithy.aws.swift.codegen.plugins.UnknownAWSHTTPServiceErrorPlugin
import software.amazon.smithy.codegen.core.Symbol
import software.amazon.smithy.model.shapes.Shape
import software.amazon.smithy.model.traits.TimestampFormatTrait
import software.amazon.smithy.protocoltests.traits.HttpRequestTestCase
import software.amazon.smithy.swift.codegen.SwiftWriter
import software.amazon.smithy.swift.codegen.aws.protocols.awsquery.AWSQueryPlugin
import software.amazon.smithy.swift.codegen.integration.Plugin
import software.amazon.smithy.swift.codegen.integration.ProtocolGenerator
import software.amazon.smithy.swift.codegen.swiftmodules.ClientRuntimeTypes
import software.amazon.smithy.swift.codegen.swiftmodules.SmithyAWSQueryTypes

class AWSQueryCustomizations : AWSHTTPProtocolCustomizations() {
    override fun customRenderBodyComparison(
        test: HttpRequestTestCase,
    ): ((SwiftWriter, HttpRequestTestCase, Symbol, Shape, String, String) -> Unit)? = this::renderFormURLBodyComparison

    private fun renderFormURLBodyComparison(
        writer: SwiftWriter,
        test: HttpRequestTestCase,
        symbol: Symbol,
        shape: Shape,
        expectedData: String,
        actualData: String,
    ) {
        writer.write("self.assertEqualFormURLBody($expectedData, $actualData)")
    }

    override fun alwaysHasHttpBody(): Boolean = true

    override val baseErrorSymbol: Symbol = ClientRuntimeTypes.AWSQuery.AWSQueryError

    override val defaultTimestampFormat = TimestampFormatTrait.Format.DATE_TIME

    override val plugins: List<Plugin> = listOf(AWSQueryPlugin(), UnknownAWSHTTPServiceErrorPlugin())

    // Every request carries the service's version.
    override fun renderClientProtocol(
        ctx: ProtocolGenerator.GenerationContext,
        writer: SwiftWriter,
    ): String = writer.format("\$N(version: \$S)", SmithyAWSQueryTypes.HTTPClientProtocol, ctx.service.version)
}
