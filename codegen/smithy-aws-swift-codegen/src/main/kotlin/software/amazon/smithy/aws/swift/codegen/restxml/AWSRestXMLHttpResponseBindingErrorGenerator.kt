/*
 * Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
 * SPDX-License-Identifier: Apache-2.0.
 */

package software.amazon.smithy.aws.swift.codegen.restxml

import software.amazon.smithy.aws.swift.codegen.AWSClientRuntimeTypes
import software.amazon.smithy.aws.swift.codegen.AWSSwiftDependency
import software.amazon.smithy.aws.traits.protocols.AwsQueryErrorTrait
import software.amazon.smithy.codegen.core.Symbol
import software.amazon.smithy.model.shapes.OperationShape
import software.amazon.smithy.model.shapes.StructureShape
import software.amazon.smithy.swift.codegen.ClientRuntimeTypes
import software.amazon.smithy.swift.codegen.SmithyXMLTypes
import software.amazon.smithy.swift.codegen.SwiftDependency
import software.amazon.smithy.swift.codegen.SwiftTypes
import software.amazon.smithy.swift.codegen.declareSection
import software.amazon.smithy.swift.codegen.integration.ProtocolGenerator
import software.amazon.smithy.swift.codegen.integration.SectionId
import software.amazon.smithy.swift.codegen.integration.httpResponse.HttpResponseBindingErrorGeneratable
import software.amazon.smithy.swift.codegen.model.getTrait
import software.amazon.smithy.swift.codegen.model.toUpperCamelCase
import software.amazon.smithy.swift.codegen.utils.errorShapeName

class AWSRestXMLHttpResponseBindingErrorGenerator : HttpResponseBindingErrorGeneratable {
    override fun renderServiceError(ctx: ProtocolGenerator.GenerationContext) {
        val serviceShape = ctx.service
        val serviceName = ctx.service.id.name
        val rootNamespace = ctx.settings.moduleName
        val fileName = "./$rootNamespace/models/$serviceName+ServiceErrorHelperMethod.swift"

        ctx.delegator.useFileWriter(fileName) { writer ->
            with(writer) {
                addImport(AWSSwiftDependency.AWS_CLIENT_RUNTIME.target)
                addImport(SwiftDependency.CLIENT_RUNTIME.target)

                openBlock("extension ${ctx.symbolProvider.toSymbol(ctx.service).name}Types {", "}") {
                    openBlock(
                        "static func responseServiceErrorBinding(httpResponse: \$N, reader: \$N) async throws -> \$N? {", "}",
                        ClientRuntimeTypes.Http.HttpResponse,
                        SmithyXMLTypes.Reader,
                        SwiftTypes.Error
                    ) {
                        openBlock("switch error.errorCode {", "}") {
                            val serviceErrorShapes =
                                serviceShape.errors
                                    .map { ctx.model.expectShape(it) as StructureShape }
                                    .toSet()
                                    .sorted()
                            serviceErrorShapes.forEach { errorShape ->
                                val errorShapeName = errorShape.errorShapeName(ctx.symbolProvider)
                                val errorShapeType = ctx.symbolProvider.toSymbol(errorShape).name
                                write(
                                    "case \$S: return try await \$L(httpResponse: httpResponse, decoder: decoder, message: error.message, requestID: error.requestId)",
                                    errorShapeName,
                                    errorShapeType
                                )
                            }
                            write("default: return nil")
                        }
                    }
                }
            }
        }
    }

    object RestXMLResponseBindingSectionId : SectionId

    override fun renderOperationError(ctx: ProtocolGenerator.GenerationContext, op: OperationShape, unknownServiceErrorSymbol: Symbol) {
        val operationErrorName = "${op.toUpperCamelCase()}OutputError"
        val rootNamespace = ctx.settings.moduleName
        val httpBindingSymbol = Symbol.builder()
            .definitionFile("./$rootNamespace/models/$operationErrorName+HttpResponseErrorBinding.swift")
            .name(operationErrorName)
            .build()

        ctx.delegator.useShapeWriter(httpBindingSymbol) { writer ->
            with(writer) {
                addImport(AWSSwiftDependency.AWS_CLIENT_RUNTIME.target)
                addImport(SwiftDependency.CLIENT_RUNTIME.target)
                addImport(SwiftDependency.SMITHY_XML.target)
                openBlock(
                    "enum \$L {",
                    "}",
                    operationErrorName
                ) {
                    openBlock(
                        "static func responseErrorBinding(httpResponse: \$N, reader: \$N) async throws -> \$N {", "}",
                        ClientRuntimeTypes.Http.HttpResponse,
                        SmithyXMLTypes.Reader,
                        SwiftTypes.Error
                    ) {
                        val errorShapes = op.errors
                            .map { ctx.model.expectShape(it) as StructureShape }
                            .toSet()
                            .sorted()
                        val context = mapOf<String, Any>(
                            "operationErrorName" to operationErrorName,
                            "ctx" to ctx,
                            "unknownServiceErrorSymbol" to unknownServiceErrorSymbol,
                            "errorShapes" to errorShapes
                        )
                        declareSection(RestXMLResponseBindingSectionId, context) {
                            write("let errorBodyReader = reader[\"Error\"]")

                            if (ctx.service.errors.isNotEmpty()) {
                                write("let serviceError = try await ${ctx.symbolProvider.toSymbol(ctx.service).name}Types.responseErrorServiceBinding(httpResponse, errorBodyReader)")
                                write("if let error = serviceError { return error }")
                            }
                            writer.write("let errorCode: String? = try errorBodyReader[\"Code\"].readIfPresent()")
                            writer.write("let message: String? = try errorBodyReader[\"Message\"].readIfPresent()")
                            writer.write("let requestID: String? = try errorBodyReader[\"RequestId\"].readIfPresent() ?? reader[\"RequestId\"].readIfPresent()")
                            openBlock("switch errorCode {", "}") {
                                errorShapes.forEach { errorShape ->
                                    val errorShapeName = errorShape.id.name
                                    val errorShapeType = ctx.symbolProvider.toSymbol(errorShape).name
                                    write(
                                        "case \$S: return try await \$L.responseErrorBinding(httpResponse: httpResponse, reader: errorBodyReader, message: message, requestID: requestID)",
                                        errorShapeName,
                                        errorShapeType
                                    )
                                }
                                write("default: return try await \$unknownServiceErrorSymbol:N.makeError(httpResponse: httpResponse, message: message, requestID: requestID, typeName: errorCode)")
                            }
                        }
                    }
                }
            }
        }
    }
}
