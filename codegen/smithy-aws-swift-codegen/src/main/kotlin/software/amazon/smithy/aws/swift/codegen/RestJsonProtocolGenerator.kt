/*
 * Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
 * SPDX-License-Identifier: Apache-2.0.
 */
package software.amazon.smithy.aws.swift.codegen

import software.amazon.smithy.codegen.core.Symbol
import software.amazon.smithy.model.shapes.*
import software.amazon.smithy.model.traits.JsonNameTrait
import software.amazon.smithy.model.traits.TimestampFormatTrait
import software.amazon.smithy.swift.codegen.SwiftDependency
import software.amazon.smithy.swift.codegen.SwiftWriter
import software.amazon.smithy.swift.codegen.defaultName
import software.amazon.smithy.swift.codegen.integration.*

/**
 * Shared base protocol generator for all AWS JSON protocol variants
 */
abstract class RestJsonProtocolGenerator : AWSHttpBindingProtocolGenerator() {
    override val defaultTimestampFormat: TimestampFormatTrait.Format = TimestampFormatTrait.Format.EPOCH_SECONDS

    override fun generateProtocolUnitTests(ctx: ProtocolGenerator.GenerationContext) {

        val requestTestBuilder = HttpProtocolUnitTestRequestGenerator.Builder()
        val responseTestBuilder = HttpProtocolUnitTestResponseGenerator.Builder()
        val errorTestBuilder = HttpProtocolUnitTestErrorGenerator.Builder()

        HttpProtocolTestGenerator(
                ctx,
                requestTestBuilder,
                responseTestBuilder,
                errorTestBuilder
        ).generateProtocolTests()
    }

    override fun generateCodingKeysForMembers(ctx: ProtocolGenerator.GenerationContext, writer: SwiftWriter, members: List<MemberShape>) {
        val membersSortedByName: List<MemberShape> = members.sortedBy { it.memberName }
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

    override fun getHttpFeatures(ctx: ProtocolGenerator.GenerationContext): List<HttpFeature> {
        val features = mutableListOf<HttpFeature>()
        val requestEncoderOptions = mutableMapOf<String, String>()
        val responseDecoderOptions = mutableMapOf<String, String>()
        // TODO:: Subject to change if Foundation dependency is removed
        requestEncoderOptions["dateEncodingStrategy"] = ".secondsSince1970"
        responseDecoderOptions["dateDecodingStrategy"] = ".secondsSince1970"
        features.add(JSONRequestEncoder(requestEncoderOptions))
        features.add(JSONResponseDecoder(responseDecoderOptions))
        return features
    }

    override fun getConfigClass(writer: SwiftWriter): ServiceConfig = AWSServiceConfig(writer)

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

class JSONRequestEncoder(
    private val requestEncoderOptions: MutableMap<String, String> = mutableMapOf()
) : HttpRequestEncoder("JSONEncoder", requestEncoderOptions) {
    override fun renderInitialization(writer: SwiftWriter, nameOfConfigObject: String) {
        writer.write("self.encoder = \$L.encoder ?? \$L", nameOfConfigObject, name)
    }
}
class JSONResponseDecoder(
    private val responseDecoderOptions: MutableMap<String, String> = mutableMapOf()
) : HttpResponseDecoder("JSONDecoder", responseDecoderOptions) {
    override fun renderInitialization(writer: SwiftWriter, nameOfConfigObject: String) {
        writer.write("self.decoder = \$L.decoder ?? \$L", nameOfConfigObject, name)
    }
}
