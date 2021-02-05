/*
 * Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
 * SPDX-License-Identifier: Apache-2.0.
 */
package software.amazon.smithy.aws.swift.codegen

import software.amazon.smithy.codegen.core.Symbol
import software.amazon.smithy.model.shapes.MemberShape
import software.amazon.smithy.model.shapes.OperationShape
import software.amazon.smithy.model.traits.JsonNameTrait
import software.amazon.smithy.model.traits.TimestampFormatTrait
import software.amazon.smithy.swift.codegen.SwiftDependency
import software.amazon.smithy.swift.codegen.SwiftWriter
import software.amazon.smithy.swift.codegen.defaultName
import software.amazon.smithy.swift.codegen.integration.ClientProperty
import software.amazon.smithy.swift.codegen.integration.HttpProtocolTestGenerator
import software.amazon.smithy.swift.codegen.integration.HttpProtocolUnitTestErrorGenerator
import software.amazon.smithy.swift.codegen.integration.HttpProtocolUnitTestRequestGenerator
import software.amazon.smithy.swift.codegen.integration.HttpProtocolUnitTestResponseGenerator
import software.amazon.smithy.swift.codegen.integration.ProtocolGenerator

/**
 * Shared base protocol generator for all AWS JSON protocol variants
 */
abstract class AWSHttpBindingJsonProtocolGenerator : AWSHttpBindingProtocolGenerator() {

    override fun generateCodingKeysForMembers(ctx: ProtocolGenerator.GenerationContext, writer: SwiftWriter, members: List<MemberShape>) {
        val membersSortedByName: List<MemberShape> = members.sortedBy { it.memberName }
        if (membersSortedByName.isNotEmpty()) {
            writer.openBlock("private enum CodingKeys: String, CodingKey {", "}") {
                for (member in membersSortedByName) {
                    val originalMemberName = member.memberName
                    val modifiedMemberName = ctx.symbolProvider.toMemberName(member)

                    /* If we have modified the member name to make it idiomatic to the language
                       like handling reserved keyword with appending an underscore or lowercasing the first letter,
                       we need to change the coding key accordingly so that during encoding and decoding, the modified member
                       name is transformed back to original name or specified JsonName before it hits the service.
                     */
                    when {
                        member.hasTrait(JsonNameTrait::class.java) -> {
                            val jsonName = member.getTrait(JsonNameTrait::class.java).get().value
                            writer.write("case $modifiedMemberName = \"$jsonName\"")
                        }
                        originalMemberName == modifiedMemberName -> {
                            writer.write("case $modifiedMemberName")
                        }
                        else -> {
                            writer.write("case \$L = \$S", modifiedMemberName, originalMemberName)
                        }
                    }
                }
            }
        }
    }

    override fun getClientProperties(ctx: ProtocolGenerator.GenerationContext): List<ClientProperty> {
        val features = mutableListOf<ClientProperty>()
        val requestEncoderOptions = mutableMapOf<String, String>()
        val responseDecoderOptions = mutableMapOf<String, String>()
        // TODO:: Subject to change if Foundation dependency is removed
        requestEncoderOptions["dateEncodingStrategy"] = ".secondsSince1970"
        responseDecoderOptions["dateDecodingStrategy"] = ".secondsSince1970"
        features.add(AWSHttpRequestJsonEncoder(requestEncoderOptions))
        features.add(AWSHttpResponseJsonDecoder(responseDecoderOptions))
        return features
    }

    override fun renderInitOperationErrorFromHttpResponse(
        ctx: ProtocolGenerator.GenerationContext,
        op: OperationShape
    ) {
        val operationErrorName = "${op.defaultName()}Error"
        val rootNamespace = ctx.settings.moduleName
        val httpBindingSymbol = Symbol.builder()
            .definitionFile("./$rootNamespace/models/$operationErrorName+ResponseInit.swift")
            .name(operationErrorName)
            .build()

        ctx.delegator.useShapeWriter(httpBindingSymbol) { writer ->
            writer.addImport(AWSSwiftDependency.AWS_CLIENT_RUNTIME.namespace)
            writer.addImport(SwiftDependency.CLIENT_RUNTIME.namespace)

            writer.openBlock("extension \$L: HttpResponseBinding {", "}", operationErrorName) {
                writer.openBlock("public init(httpResponse: HttpResponse, decoder: ResponseDecoder? = nil) throws {", "}") {
                    writer.write("let errorDetails = try RestJSONError(httpResponse: httpResponse)")
                    writer.write("let requestID = httpResponse.headers.value(for: X_AMZN_REQUEST_ID_HEADER)")
                    writer.write("try self.init(errorType: errorDetails.errorType, httpResponse: httpResponse, decoder: decoder, message: errorDetails.errorMessage, requestID: requestID)")
                }
            }
        }
    }
}
