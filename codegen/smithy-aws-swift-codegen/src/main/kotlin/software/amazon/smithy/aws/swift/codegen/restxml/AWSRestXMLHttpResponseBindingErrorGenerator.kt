package software.amazon.smithy.aws.swift.codegen.restxml

import software.amazon.smithy.aws.swift.codegen.AWSSwiftDependency
import software.amazon.smithy.codegen.core.Symbol
import software.amazon.smithy.model.shapes.OperationShape
import software.amazon.smithy.swift.codegen.SwiftDependency
import software.amazon.smithy.swift.codegen.capitalizedName
import software.amazon.smithy.swift.codegen.integration.ProtocolGenerator
import software.amazon.smithy.swift.codegen.integration.httpResponse.HttpResponseBindingErrorGeneratable

class AWSRestXMLHttpResponseBindingErrorGenerator : HttpResponseBindingErrorGeneratable {
    override fun render(ctx: ProtocolGenerator.GenerationContext, op: OperationShape) {
        val operationErrorName = "${op.capitalizedName()}OutputError"
        val rootNamespace = ctx.settings.moduleName
        val httpBindingSymbol = Symbol.builder()
            .definitionFile("./$rootNamespace/models/Models.swift")
            .name(operationErrorName)
            .build()

        ctx.delegator.useShapeWriter(httpBindingSymbol) { writer ->
            writer.addImport(AWSSwiftDependency.AWS_CLIENT_RUNTIME.packageName)
            writer.addImport(SwiftDependency.CLIENT_RUNTIME.packageName)

            writer.openBlock("extension \$L: HttpResponseBinding {", "}", operationErrorName) {
                writer.openBlock("public init(httpResponse: HttpResponse, decoder: ResponseDecoder? = nil) throws {", "}") {
                    writer.write("let errorDetails = try RestXMLError(httpResponse: httpResponse)")
                    writer.write("try self.init(errorType: errorDetails.errorCode, httpResponse: httpResponse, decoder: decoder, message: errorDetails.message, requestID: errorDetails.requestId)")
                }
            }
        }
    }
}
