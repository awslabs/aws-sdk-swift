/*
 * Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
 * SPDX-License-Identifier: Apache-2.0.
 */

package software.amazon.smithy.aws.swift.codegen.awsjson

import software.amazon.smithy.aws.swift.codegen.AWSClientRuntimeTypes
import software.amazon.smithy.aws.swift.codegen.AWSSwiftDependency
import software.amazon.smithy.codegen.core.Symbol
import software.amazon.smithy.model.shapes.OperationShape
import software.amazon.smithy.swift.codegen.ClientRuntimeTypes
import software.amazon.smithy.swift.codegen.SwiftDependency
import software.amazon.smithy.swift.codegen.integration.ProtocolGenerator
import software.amazon.smithy.swift.codegen.integration.httpResponse.HttpResponseBindingErrorGeneratable
import software.amazon.smithy.swift.codegen.model.capitalizedName

/*
 * TODO: The code below is not valid for AWS Json 1.0/1.1.
 *       This code was lifted from restJson to make tests compile and run for Json 1.0/1.1
 */
class AWSJsonHttpResponseBindingErrorGenerator : HttpResponseBindingErrorGeneratable {
    override fun render(ctx: ProtocolGenerator.GenerationContext, op: OperationShape) {
        val operationErrorName = "${op.capitalizedName()}OutputError"
        val rootNamespace = ctx.settings.moduleName
        val httpBindingSymbol = Symbol.builder()
            .definitionFile("./$rootNamespace/models/$operationErrorName+HttpResponseBinding.swift")
            .name(operationErrorName)
            .build()

        ctx.delegator.useShapeWriter(httpBindingSymbol) { writer ->
            writer.addImport(AWSSwiftDependency.AWS_CLIENT_RUNTIME.target)
            writer.addImport(SwiftDependency.CLIENT_RUNTIME.target)

            writer.openBlock("extension \$L: \$N {", "}", operationErrorName, ClientRuntimeTypes.Http.HttpResponseBinding) {
                writer.openBlock("public init(httpResponse: \$N, decoder: \$D) throws {", "}", ClientRuntimeTypes.Http.HttpResponse, ClientRuntimeTypes.Serde.ResponseDecoder) {
                    writer.write("let errorDetails = try \$N(httpResponse: httpResponse)", AWSClientRuntimeTypes.RestJSON.RestJSONError)
                    writer.write("let requestID = httpResponse.headers.value(for: X_AMZN_REQUEST_ID_HEADER)")
                    writer.write("try self.init(errorType: errorDetails.errorType, httpResponse: httpResponse, decoder: decoder, message: errorDetails.errorMessage, requestID: requestID)")
                }
            }
        }
    }
}
