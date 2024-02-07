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
import software.amazon.smithy.swift.codegen.SmithyXMLTypes
import software.amazon.smithy.swift.codegen.SwiftDependency
import software.amazon.smithy.swift.codegen.SwiftTypes
import software.amazon.smithy.swift.codegen.integration.ProtocolGenerator
import software.amazon.smithy.swift.codegen.integration.httpResponse.HttpResponseBindingErrorGeneratable
import software.amazon.smithy.swift.codegen.model.toUpperCamelCase
import software.amazon.smithy.swift.codegen.utils.errorShapeName

class AWSQueryHttpResponseBindingErrorGenerator : HttpResponseBindingErrorGeneratable {
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

                openBlock("enum \$L {", "}", operationErrorName) {
                    writer.addImport(SwiftDependency.SMITHY_XML.target)
                    writer.write("")
                    openBlock(
                        "static var httpBinding: \$N<\$N> {", "}",
                        ClientRuntimeTypes.Http.HTTPResponseErrorBinding,
                        SmithyXMLTypes.Reader,
                    ) {
                        writer.openBlock("{ httpResponse, responseDocumentClosure in", "}") {
                            if (ctx.service.errors.isNotEmpty()) {
                                write("let serviceError = try await ${ctx.symbolProvider.toSymbol(ctx.service).name}Types.makeServiceError(httpResponse, decoder, ec2QueryError)")
                                write("if let error = serviceError { return error }")
                            }
                            writer.write("let responseReader = try await responseDocumentClosure(httpResponse)")
                            writer.write("let reader = responseReader[\"Error\"]")
                            writer.write("let requestID: String? = try responseReader[\"RequestId\"].readIfPresent()")
                            writer.write("let code: String? = try reader[\"Code\"].readIfPresent()")
                            writer.write("let message: String? = try reader[\"Message\"].readIfPresent()")
                            openBlock("switch code {", "}") {
                                val errorShapes = op.errors
                                    .map { ctx.model.expectShape(it) as StructureShape }
                                    .toSet()
                                    .sorted()
                                errorShapes.forEach { errorShape ->
                                    var errorShapeName = errorShape.errorShapeName(ctx.symbolProvider)
                                    var errorShapeType = ctx.symbolProvider.toSymbol(errorShape).name
                                    write(
                                        "case \$S: return try await \$L.responseErrorBinding(httpResponse: httpResponse, reader: reader, message: message, requestID: requestID)",
                                        errorShapeName,
                                        errorShapeType
                                    )
                                }
                                write(
                                    "default: return try await \$N.makeError(httpResponse: httpResponse, message: message, requestID: requestID, typeName: code)",
                                    unknownServiceErrorSymbol
                                )
                            }
                        }
                    }
                }
            }
        }
    }
}
