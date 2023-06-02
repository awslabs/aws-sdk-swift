/*
 * Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
 * SPDX-License-Identifier: Apache-2.0.
 */

package software.amazon.smithy.aws.swift.codegen.awsjson

import software.amazon.smithy.aws.swift.codegen.AWSClientRuntimeTypes
import software.amazon.smithy.aws.swift.codegen.AWSSwiftDependency
import software.amazon.smithy.codegen.core.Symbol
import software.amazon.smithy.model.shapes.OperationShape
import software.amazon.smithy.model.shapes.StructureShape
import software.amazon.smithy.swift.codegen.ClientRuntimeTypes
import software.amazon.smithy.swift.codegen.SwiftDependency
import software.amazon.smithy.swift.codegen.SwiftTypes
import software.amazon.smithy.swift.codegen.integration.ProtocolGenerator
import software.amazon.smithy.swift.codegen.integration.httpResponse.HttpResponseBindingErrorGeneratable
import software.amazon.smithy.swift.codegen.model.toUpperCamelCase
import software.amazon.smithy.swift.codegen.utils.errorShapeName

class AWSJsonHttpResponseBindingErrorGenerator : HttpResponseBindingErrorGeneratable {
    override fun render(ctx: ProtocolGenerator.GenerationContext, op: OperationShape, unknownServiceErrorSymbol: Symbol) {
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
                    writer.write(
                        "let restJSONError = try await \$N(httpResponse: httpResponse)",
                        AWSClientRuntimeTypes.RestJSON.RestJSONError
                    )
                    writer.write("let requestID = httpResponse.requestId")
                    writer.openBlock("switch restJSONError.errorType {", "}") {
                        val errorShapes = op.errors.map { ctx.model.expectShape(it) as StructureShape }.toSet().sorted()
                        for (errorShape in errorShapes) {
                            var errorShapeName = errorShape.errorShapeName(ctx.symbolProvider)
                            var errorShapeType = ctx.symbolProvider.toSymbol(errorShape).name
                            writer.write(
                                "case \$S: return try await \$L(httpResponse: httpResponse, decoder: decoder, message: restJSONError.errorMessage, requestID: requestID)",
                                errorShapeName,
                                errorShapeType
                            )
                        }
                        writer.write("default: return try await \$N.makeError(httpResponse: httpResponse, message: restJSONError.errorMessage, requestID: requestID, typeName: restJSONError.errorType)", unknownServiceErrorSymbol)
                    }
                }
            }
        }
    }
}
