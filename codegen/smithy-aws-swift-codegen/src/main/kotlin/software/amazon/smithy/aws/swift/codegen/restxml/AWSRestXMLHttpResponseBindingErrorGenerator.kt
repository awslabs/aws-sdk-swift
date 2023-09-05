/*
 * Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
 * SPDX-License-Identifier: Apache-2.0.
 */

package software.amazon.smithy.aws.swift.codegen.restxml

import software.amazon.smithy.aws.swift.codegen.AWSClientRuntimeTypes
import software.amazon.smithy.aws.swift.codegen.AWSSwiftDependency
import software.amazon.smithy.codegen.core.Symbol
import software.amazon.smithy.model.shapes.OperationShape
import software.amazon.smithy.model.shapes.StructureShape
import software.amazon.smithy.swift.codegen.ClientRuntimeTypes
import software.amazon.smithy.swift.codegen.SwiftDependency
import software.amazon.smithy.swift.codegen.SwiftTypes
import software.amazon.smithy.swift.codegen.declareSection
import software.amazon.smithy.swift.codegen.integration.ProtocolGenerator
import software.amazon.smithy.swift.codegen.integration.SectionId
import software.amazon.smithy.swift.codegen.integration.httpResponse.HttpResponseBindingErrorGeneratable
import software.amazon.smithy.swift.codegen.model.toUpperCamelCase
import software.amazon.smithy.swift.codegen.utils.errorShapeName

class AWSRestXMLHttpResponseBindingErrorGenerator : HttpResponseBindingErrorGeneratable {
    override fun renderServiceError(ctx: ProtocolGenerator.GenerationContext) {
        val serviceShape = ctx.service
        val serviceName = ctx.service.id.name
        val rootNamespace = ctx.settings.moduleName

        ctx.delegator.useFileWriter("./$rootNamespace/models/$serviceName+ServiceErrorHelperMethod.swift") { writer ->
            writer.addImport(AWSSwiftDependency.AWS_CLIENT_RUNTIME.target)
            writer.addImport(SwiftDependency.CLIENT_RUNTIME.target)

            writer.openBlock(
                "func makeServiceError(_ httpResponse: \$N, _ decoder: \$D, _ error: \$N) async throws -> \$N? {", "}",
                ClientRuntimeTypes.Http.HttpResponse,
                ClientRuntimeTypes.Serde.ResponseDecoder,
                AWSClientRuntimeTypes.RestXML.RestXMLError,
                SwiftTypes.Error
            ) {
                writer.openBlock("switch error.errorCode {", "}") {
                    val serviceErrorShapes = serviceShape.errors.map { ctx.model.expectShape(it) as StructureShape }.toSet().sorted()
                    for (errorShape in serviceErrorShapes) {
                        val errorShapeName = errorShape.errorShapeName(ctx.symbolProvider)
                        val errorShapeType = ctx.symbolProvider.toSymbol(errorShape).name
                        writer.write(
                            "case \$S: return try await \$L(httpResponse: httpResponse, decoder: decoder, message: error.errorMessage, requestID: restXMLError.requestId)",
                            errorShapeName,
                            errorShapeType
                        )
                    }
                    writer.write("default: return nil")
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
            writer.addImport(AWSSwiftDependency.AWS_CLIENT_RUNTIME.target)
            writer.addImport(SwiftDependency.CLIENT_RUNTIME.target)

            writer.openBlock("public enum \$L: \$N {", "}", operationErrorName, ClientRuntimeTypes.Http.HttpResponseErrorBinding) {
                writer.openBlock(
                    "public static func makeError(httpResponse: \$N, decoder: \$D) async throws -> \$N {", "}",
                    ClientRuntimeTypes.Http.HttpResponse,
                    ClientRuntimeTypes.Serde.ResponseDecoder,
                    SwiftTypes.Error
                ) {
                    val errorShapes = op.errors.map { ctx.model.expectShape(it) as StructureShape }.toSet().sorted()
                    val context = mapOf<String, Any>(
                        "operationErrorName" to operationErrorName,
                        "ctx" to ctx,
                        "unknownServiceErrorSymbol" to unknownServiceErrorSymbol,
                        "errorShapes" to errorShapes
                    )

                    writer.declareSection(RestXMLResponseBindingSectionId, context) {
                        writer.write("let restXMLError = try await \$N(httpResponse: httpResponse)", AWSClientRuntimeTypes.RestXML.RestXMLError)

                        writer.write("let serviceError = try await makeServiceError(httpResponse, decoder, restXMLError)")
                        writer.write("if let error = serviceError { return error }")

                        writer.openBlock("switch restXMLError.errorCode {", "}") {
                            for (errorShape in errorShapes) {
                                var errorShapeName = errorShape.errorShapeName(ctx.symbolProvider)
                                var errorShapeType = ctx.symbolProvider.toSymbol(errorShape).name
                                writer.write("case \$S: return try await \$L(httpResponse: httpResponse, decoder: decoder, message: restXMLError.message, requestID: restXMLError.requestId)", errorShapeName, errorShapeType)
                            }
                            writer.write("default: return try await \$unknownServiceErrorSymbol:N.makeError(httpResponse: httpResponse, message: restXMLError.message, requestID: restXMLError.requestId, typeName: restXMLError.errorCode)")
                        }
                    }
                }
            }
        }
    }
}
