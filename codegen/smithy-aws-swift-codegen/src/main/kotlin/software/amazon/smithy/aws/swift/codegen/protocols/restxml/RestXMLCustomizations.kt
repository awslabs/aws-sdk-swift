/*
 * Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
 * SPDX-License-Identifier: Apache-2.0.
 */

package software.amazon.smithy.aws.swift.codegen.protocols.restxml

import software.amazon.smithy.aws.swift.codegen.AWSHTTPProtocolCustomizations
import software.amazon.smithy.aws.swift.codegen.customization.s3.isS3
import software.amazon.smithy.aws.swift.codegen.plugins.UnknownAWSHTTPServiceErrorPlugin
import software.amazon.smithy.aws.traits.protocols.RestXmlTrait
import software.amazon.smithy.codegen.core.Symbol
import software.amazon.smithy.swift.codegen.SwiftWriter
import software.amazon.smithy.swift.codegen.aws.protocols.restxml.RestXMLPlugin
import software.amazon.smithy.swift.codegen.integration.Plugin
import software.amazon.smithy.swift.codegen.integration.ProtocolGenerator
import software.amazon.smithy.swift.codegen.model.getTrait
import software.amazon.smithy.swift.codegen.swiftmodules.ClientRuntimeTypes
import software.amazon.smithy.swift.codegen.swiftmodules.SmithyRestXMLTypes

class RestXMLCustomizations : AWSHTTPProtocolCustomizations() {
    override val baseErrorSymbol: Symbol = ClientRuntimeTypes.RestXML.RestXMLError

    private var isS3Service: Boolean = false
    private var noErrorWrapping: Boolean = false

    override fun renderInternals(ctx: ProtocolGenerator.GenerationContext) {
        super.renderInternals(ctx)
        isS3Service = ctx.service.isS3
        noErrorWrapping = ctx.service.getTrait<RestXmlTrait>()?.isNoErrorWrapping ?: false
    }

    override fun renderClientProtocol(writer: SwiftWriter): String {
        if (isS3Service) {
            return writer.format(
                "\$N(noErrorWrapping: \$L, handleEmpty404: true)" +
                    ".withCustomErrorResolver(s3CustomErrorResolver)" +
                    ".withErrorPostProcessor(s3ErrorPostProcessor)",
                SmithyRestXMLTypes.HTTPClientProtocol,
                noErrorWrapping,
            )
        }
        if (noErrorWrapping) {
            return writer.format(
                "\$N(noErrorWrapping: true)",
                SmithyRestXMLTypes.HTTPClientProtocol,
            )
        }
        return writer.format("\$N()", SmithyRestXMLTypes.HTTPClientProtocol)
    }

    override val plugins: List<Plugin> = listOf(RestXMLPlugin(), UnknownAWSHTTPServiceErrorPlugin())
}
