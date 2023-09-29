/*
 * Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
 * SPDX-License-Identifier: Apache-2.0.
 */

package software.amazon.smithy.aws.swift.codegen.ec2query.httpResponse

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

class AWSEc2QueryHttpResponseBindingErrorGenerator : HttpResponseBindingErrorGeneratable {
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
                        "static func makeServiceError(_ httpResponse: \$N, _ decoder: \$D, _ error: \$N) async throws -> \$N? {",
                        "}",
                        ClientRuntimeTypes.Http.HttpResponse,
                        ClientRuntimeTypes.Serde.ResponseDecoder,
                        AWSClientRuntimeTypes.EC2Query.Ec2QueryError,
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

                openBlock(
                    "enum \$L: \$N {",
                    "}",
                    operationErrorName,
                    ClientRuntimeTypes.Http.HttpResponseErrorBinding
                ) {
                    openBlock(
                        "static func makeError(httpResponse: \$N, decoder: \$D) async throws -> \$N {", "}",
                        ClientRuntimeTypes.Http.HttpResponse,
                        ClientRuntimeTypes.Serde.ResponseDecoder,
                        SwiftTypes.Error
                    ) {
                        write("let ec2QueryError = try await Ec2QueryError(httpResponse: httpResponse)")

                        if (ctx.service.errors.isNotEmpty()) {
                            write("let serviceError = try await ${ctx.symbolProvider.toSymbol(ctx.service).name}Types.makeServiceError(httpResponse, decoder, ec2QueryError)")
                            write("if let error = serviceError { return error }")
                        }

                        openBlock("switch ec2QueryError.errorCode {", "}") {
                            val errorShapes = op.errors
                                .map { ctx.model.expectShape(it) as StructureShape }
                                .toSet()
                                .sorted()
                            errorShapes.forEach { errorShape ->
                                var errorShapeName = errorShape.errorShapeName(ctx.symbolProvider)
                                var errorShapeType = ctx.symbolProvider.toSymbol(errorShape).name
                                write(
                                    "case \$S: return try await \$L(httpResponse: httpResponse, decoder: decoder, message: ec2QueryError.message, requestID: ec2QueryError.requestId)",
                                    errorShapeName,
                                    errorShapeType
                                )
                            }
                            write(
                                "default: return try await \$N.makeError(httpResponse: httpResponse, message: ec2QueryError.message, requestID: ec2QueryError.requestId, typeName: ec2QueryError.errorCode)",
                                unknownServiceErrorSymbol
                            )
                        }
                    }
                }
            }
        }
    }
}
