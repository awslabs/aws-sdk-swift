package software.amazon.smithy.aws.swift.codegen

import software.amazon.smithy.codegen.core.Symbol
import software.amazon.smithy.model.shapes.OperationShape
import software.amazon.smithy.model.shapes.StructureShape
import software.amazon.smithy.swift.codegen.ServiceGenerator
import software.amazon.smithy.swift.codegen.SwiftDependency
import software.amazon.smithy.swift.codegen.integration.ErrorFromHttpResponseGenerator
import software.amazon.smithy.swift.codegen.integration.ProtocolGenerator

class AWSErrorFromHttpAwsJSONResponseGenerator : ErrorFromHttpResponseGenerator {
    override fun generateInitOperationFromHttpResponse(ctx: ProtocolGenerator.GenerationContext, op: OperationShape, unknownServiceErrorSymbol: Symbol) {
        // Initialize operation error given the errorType which is like a rawValue of error case encountered
        val errorShapes = op.errors.map { ctx.model.expectShape(it) as StructureShape }.toSet().sorted()
        val operationErrorName = ServiceGenerator.getOperationErrorShapeName(op)
        val rootNamespace = ctx.settings.moduleName
        val httpBindingSymbol = Symbol.builder()
            .definitionFile("./$rootNamespace/models/$operationErrorName+ResponseInit.swift")
            .name(operationErrorName)
            .build()

        ctx.delegator.useShapeWriter(httpBindingSymbol) { writer ->
            writer.addImport(SwiftDependency.CLIENT_RUNTIME.namespace)
            writer.addImport(unknownServiceErrorSymbol)
            val unknownServiceErrorType = unknownServiceErrorSymbol.name

            writer.openBlock("extension \$L {", "}", operationErrorName) {
                writer.openBlock("public init(errorType: String?, httpResponse: HttpResponse, decoder: ResponseDecoder? = nil, message: String? = nil, requestID: String? = nil) throws {", "}") {
                    writer.write("switch errorType {")
                    for (errorShape in errorShapes) {
                        val errorShapeName = ctx.symbolProvider.toSymbol(errorShape).name
                        writer.write("case \$S : self = .\$L(try \$L(httpResponse: httpResponse, decoder: decoder, message: message, requestID: requestID))", errorShapeName, errorShapeName.decapitalize(), errorShapeName)
                    }
                    writer.write("default : self = .unknown($unknownServiceErrorType(httpResponse: httpResponse, message: message))")
                    writer.write("}")
                }
            }
        }
    }
}
