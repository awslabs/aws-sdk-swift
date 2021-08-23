package software.amazon.smithy.aws.swift.codegen.customization.s3

import software.amazon.smithy.aws.swift.codegen.AWSClientRuntimeTypes
import software.amazon.smithy.aws.swift.codegen.restxml.AWSRestXMLHttpResponseBindingErrorGenerator
import software.amazon.smithy.codegen.core.Symbol
import software.amazon.smithy.model.Model
import software.amazon.smithy.model.shapes.ServiceShape
import software.amazon.smithy.model.shapes.StructureShape
import software.amazon.smithy.swift.codegen.ClientRuntimeTypes
import software.amazon.smithy.swift.codegen.StructureGenerator
import software.amazon.smithy.swift.codegen.SwiftSettings
import software.amazon.smithy.swift.codegen.SwiftTypes
import software.amazon.smithy.swift.codegen.integration.ProtocolGenerator
import software.amazon.smithy.swift.codegen.integration.SectionWriter
import software.amazon.smithy.swift.codegen.integration.SectionWriterBinding
import software.amazon.smithy.swift.codegen.integration.SwiftIntegration
import software.amazon.smithy.swift.codegen.integration.httpResponse.HttpResponseBindingErrorInitGenerator
import software.amazon.smithy.swift.codegen.integration.httpResponse.HttpResponseBindingErrorNarrowGenerator
import software.amazon.smithy.swift.codegen.model.expectShape

class S3ErrorIntegration : SwiftIntegration {
    override val order: Byte
        get() = 127

    override fun enabledForService(model: Model, settings: SwiftSettings): Boolean {
        return model.expectShape<ServiceShape>(settings.service).isS3
    }
    override val sectionWriters: List<SectionWriterBinding>
        get() = listOf(
            SectionWriterBinding(HttpResponseBindingErrorInitGenerator.HttpResponseBindingErrorInit, s3MembersParams),
            SectionWriterBinding(HttpResponseBindingErrorInitGenerator.HttpResponseBindingErrorInitMemberAssignment, s3MembersAssignment),
            SectionWriterBinding(StructureGenerator.AdditionalErrorMembers, s3Members),
            SectionWriterBinding(HttpResponseBindingErrorNarrowGenerator.HttpResponseBindingErrorNarrowGeneratorSectionId, httpResponseBindingErrorNarrow),
            SectionWriterBinding(AWSRestXMLHttpResponseBindingErrorGenerator.RestXMLResponseBindingSectionId, httpResponseBinding)

        )

    private val s3MembersParams = SectionWriter { writer, _ ->
        writer.write(
            "public init (httpResponse: \$N, decoder: \$D, message: \$D, requestID: \$D, requestID2: \$D) throws {",
            ClientRuntimeTypes.Http.HttpResponse,
            ClientRuntimeTypes.Serde.ResponseDecoder,
            SwiftTypes.String,
            SwiftTypes.String,
            SwiftTypes.String
        )
    }

    private val s3MembersAssignment = SectionWriter { writer, _ ->
        writer.write("self._requestID2 = requestID2")
    }

    private val s3Members = SectionWriter { writer, _ ->
        writer.write("public var _requestID2: \$T", SwiftTypes.String)
    }

    private val httpResponseBinding = SectionWriter { writer, _ ->
        val operationErrorName = writer.getContext("operationErrorName") as String
        writer.write("let errorDetails = $operationErrorName.isNotFoundAndEmptyBody(httpResponse: httpResponse)")
        writer.write("    ? $operationErrorName.constructRestXMLError(httpResponse: httpResponse)")
        writer.write("    : try \$N(httpResponse: httpResponse)", AWSClientRuntimeTypes.RestXML.RestXMLError)
        writer.write("let requestID2 = $operationErrorName.getRequestId2(httpResponse: httpResponse)")
        writer.write("try self.init(errorType: errorDetails.errorCode, httpResponse: httpResponse, decoder: decoder, message: errorDetails.message, requestID: errorDetails.requestId, requestID2: requestID2)")
    }

    private val httpResponseBindingErrorNarrow = SectionWriter { writer, _ ->
        val ctx = writer.getContext("ctx") as ProtocolGenerator.GenerationContext
        val unknownServiceErrorType = writer.getContext("unknownServiceErrorType") as String
        val operationErrorName = writer.getContext("operationErrorName") as String
        val errorShapes = writer.getContext("errorShapes") as List<StructureShape>

        writer.openBlock("extension \$L {", "}", operationErrorName) {
            writer.write(
                "public init(errorType: \$T, httpResponse: \$N, decoder: \$D, message: \$D, requestID: \$D, requestID2: \$D) throws {",
                SwiftTypes.String,
                ClientRuntimeTypes.Http.HttpResponse,
                ClientRuntimeTypes.Serde.ResponseDecoder,
                SwiftTypes.String,
                SwiftTypes.String,
                SwiftTypes.String
            )
            writer.indent()
            writer.write("switch errorType {")
            for (errorShape in errorShapes) {
                var errorShapeName = ctx.symbolProvider.toSymbol(errorShape).name
                var errorShapeType = ctx.symbolProvider.toSymbol(errorShape).name
                var errorShapeEnumCase = errorShapeType.decapitalize()
                writer.write("case \$S : self = .\$L(try \$L(httpResponse: httpResponse, decoder: decoder, message: message, requestID: requestID, requestID2: requestID2))", errorShapeName, errorShapeEnumCase, errorShapeType)
            }
            writer.write("default : self = .unknown($unknownServiceErrorType(httpResponse: httpResponse, message: message, requestID: requestID))")
            writer.write("}")
            writer.dedent()
            writer.write("}")
        }

        writer.openBlock("extension $operationErrorName {", "}") {
            writer.openBlock("static func isNotFoundAndEmptyBody(httpResponse: HttpResponse) -> Bool {", "}") {
                writer.write("if case .none = httpResponse.body {")
                writer.indent()
                writer.write("return httpResponse.statusCode == .notFound")
                writer.dedent()
                writer.write("} else if case .empty = httpResponse.body {")
                writer.indent()
                writer.write("return httpResponse.statusCode == .notFound")
                writer.dedent()
                writer.write("}")
                writer.write("return false")
            }

            writer.openBlock("static func constructRestXMLError(httpResponse: HttpResponse) -> AWSClientRuntime.RestXMLError {", "}") {
                writer.write("return RestXMLError(errorCode: \"NotFound\", requestId: httpResponse.headers.value(for: \"x-amz-request-id\"))")
            }
            writer.openBlock("static func getRequestId2(httpResponse: HttpResponse) -> String? {", "}") {
                writer.write("return httpResponse.headers.value(for: \"x-amz-id-2\")")
            }
        }
    }

    override fun serviceErrorProtocolSymbol(): Symbol? {
        return AWSClientRuntimeTypes.RestXML.S3.S3HttpServiceError
    }
}
