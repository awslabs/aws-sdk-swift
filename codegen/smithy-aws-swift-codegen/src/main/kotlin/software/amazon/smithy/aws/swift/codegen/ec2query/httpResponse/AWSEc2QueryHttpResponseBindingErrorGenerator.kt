/*
 * Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
 * SPDX-License-Identifier: Apache-2.0.
 */

package software.amazon.smithy.aws.swift.codegen.ec2query.httpResponse

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
                    writer.write("let ec2QueryError = try await Ec2QueryError(httpResponse: httpResponse)")
                    writer.openBlock("switch ec2QueryError.errorCode {", "}") {
                        val errorShapes = op.errors.map { ctx.model.expectShape(it) as StructureShape }.toSet().sorted()
                        for (errorShape in errorShapes) {
                            var errorShapeName = errorShape.errorShapeName(ctx.symbolProvider)
                            var errorShapeType = ctx.symbolProvider.toSymbol(errorShape).name
                            writer.write("case \$S: return try await \$L(httpResponse: httpResponse, decoder: decoder, message: ec2QueryError.message, requestID: ec2QueryError.requestId)", errorShapeName, errorShapeType)
                        }
                        writer.write("default: return try await \$N.makeError(httpResponse: httpResponse, message: ec2QueryError.message, requestID: ec2QueryError.requestId, typeName: ec2QueryError.errorCode)", unknownServiceErrorSymbol)
                    }
                }
            }
        }
    }
}
