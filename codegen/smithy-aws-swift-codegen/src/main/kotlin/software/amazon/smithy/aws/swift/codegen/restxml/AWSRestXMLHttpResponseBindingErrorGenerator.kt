/*
 * Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
 * SPDX-License-Identifier: Apache-2.0.
 */

package software.amazon.smithy.aws.swift.codegen.restxml

import software.amazon.smithy.aws.swift.codegen.AWSClientRuntimeTypes
import software.amazon.smithy.aws.swift.codegen.AWSSwiftDependency
import software.amazon.smithy.aws.traits.protocols.RestXmlTrait
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
                                    "case \$S: return try await \$L(httpResponse: httpResponse, reader: reader, message: error.message, requestID: error.requestId)",
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
                    write("")
                    openBlock(
                        "static var httpBinding: \$N<\$N> {", "}",
                        ClientRuntimeTypes.Http.HTTPResponseErrorBinding,
                        SmithyXMLTypes.Reader,
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
                        writer.openBlock("{ httpResponse, responseDocumentClosure in", "}") {
                            declareSection(RestXMLResponseBindingSectionId, context) {
                                val noErrorWrapping = ctx.service.getTrait<RestXmlTrait>()?.let { it.isNoErrorWrapping } ?: false
                                writer.write("let responseReader = try await responseDocumentClosure(httpResponse)")
                                if (errorShapes.isNotEmpty() || ctx.service.errors.isNotEmpty()) {
                                    writer.write(
                                        "let errorBodyReader = \$N.errorBodyReader(responseReader: responseReader, noErrorWrapping: \$L)",
                                        AWSClientRuntimeTypes.RestXML.RestXMLError,
                                        noErrorWrapping
                                    )
                                }
                                if (ctx.service.errors.isNotEmpty()) {
                                    openBlock(
                                        "if let serviceError = try await \$NTypes.responseServiceErrorBinding(httpResponse, errorBodyReader) {",
                                        "}",
                                        ctx.symbolProvider.toSymbol(ctx.service),
                                    ) {
                                        write("return serviceError")
                                    }
                                }
                                writer.write("let restXMLError = try \$N(responseReader: responseReader, noErrorWrapping: \$L)", AWSClientRuntimeTypes.RestXML.RestXMLError, noErrorWrapping)
                                openBlock("switch restXMLError.code {", "}") {
                                    errorShapes.forEach { errorShape ->
                                        val errorShapeName = errorShape.id.name
                                        val errorShapeType = ctx.symbolProvider.toSymbol(errorShape).name
                                        write(
                                            "case \$S: return try await \$L.responseErrorBinding(httpResponse: httpResponse, reader: errorBodyReader, message: restXMLError.message, requestID: restXMLError.requestID)",
                                            errorShapeName,
                                            errorShapeType
                                        )
                                    }
                                    write("default: return try await \$unknownServiceErrorSymbol:N.makeError(httpResponse: httpResponse, message: restXMLError.message, requestID: restXMLError.requestID, typeName: restXMLError.code)")
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}
