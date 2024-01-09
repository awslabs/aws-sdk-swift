package software.amazon.smithy.aws.swift.codegen.customization.s3

import software.amazon.smithy.aws.swift.codegen.AWSClientRuntimeTypes
import software.amazon.smithy.aws.swift.codegen.restxml.AWSRestXMLHttpResponseBindingErrorGenerator
import software.amazon.smithy.codegen.core.Symbol
import software.amazon.smithy.model.Model
import software.amazon.smithy.model.shapes.ServiceShape
import software.amazon.smithy.model.shapes.StructureShape
import software.amazon.smithy.swift.codegen.ClientRuntimeTypes
import software.amazon.smithy.swift.codegen.SmithyXMLTypes
import software.amazon.smithy.swift.codegen.StructureGenerator
import software.amazon.smithy.swift.codegen.SwiftDependency
import software.amazon.smithy.swift.codegen.SwiftSettings
import software.amazon.smithy.swift.codegen.SwiftTypes
import software.amazon.smithy.swift.codegen.integration.ProtocolGenerator
import software.amazon.smithy.swift.codegen.integration.SectionWriter
import software.amazon.smithy.swift.codegen.integration.SectionWriterBinding
import software.amazon.smithy.swift.codegen.integration.SwiftIntegration
import software.amazon.smithy.swift.codegen.integration.httpResponse.XMLHttpResponseBindingErrorInitGenerator
import software.amazon.smithy.swift.codegen.model.expectShape
import software.amazon.smithy.swift.codegen.utils.errorShapeName

class S3ErrorIntegration : SwiftIntegration {
    override val order: Byte
        get() = 127

    override fun enabledForService(model: Model, settings: SwiftSettings): Boolean {
        return model.expectShape<ServiceShape>(settings.service).isS3
    }
    override val sectionWriters: List<SectionWriterBinding>
        get() = listOf(
            SectionWriterBinding(XMLHttpResponseBindingErrorInitGenerator.XMLHttpResponseBindingErrorInit, s3MembersParams),
            SectionWriterBinding(XMLHttpResponseBindingErrorInitGenerator.XMLHttpResponseBindingErrorInitMemberAssignment, s3MembersAssignment),
            SectionWriterBinding(StructureGenerator.AdditionalErrorMembers, s3Members),
            SectionWriterBinding(AWSRestXMLHttpResponseBindingErrorGenerator.RestXMLResponseBindingSectionId, httpResponseBinding)

        )

    private val s3MembersParams = SectionWriter { writer, _ ->
        writer.addImport(SwiftDependency.SMITHY_XML.target)
        writer.write(
            "static func responseErrorBinding(httpResponse: \$N, reader: \$N, message: \$D, requestID: \$D, requestID2: \$D) async throws -> \$N {",
            ClientRuntimeTypes.Http.HttpResponse,
            SmithyXMLTypes.Reader,
            SwiftTypes.String,
            SwiftTypes.String,
            SwiftTypes.String,
            SwiftTypes.Error,
        )
    }

    private val s3MembersAssignment = SectionWriter { writer, _ ->
        writer.write("value.requestID2 = requestID2")
    }

    private val s3Members = SectionWriter { writer, _ ->
        writer.write("public internal(set) var requestID2: \$T", SwiftTypes.String)
    }

    private val httpResponseBinding = SectionWriter { writer, _ ->
        val ctx = writer.getContext("ctx") as ProtocolGenerator.GenerationContext
        val errorShapes = writer.getContext("errorShapes") as List<StructureShape>
        writer.write("let errorBodyReader = reader[\"Error\"]")

        if (ctx.service.errors.isNotEmpty()) {
            writer.write("let serviceError = try await ${ctx.symbolProvider.toSymbol(ctx.service).name}Types.responseErrorServiceBinding(httpResponse, errorBodyReader)")
            writer.write("if let error = serviceError { return error }")
        }
        writer.write("let errorCode: String? = try errorBodyReader[\"Code\"].readIfPresent()")
        writer.write("let message: String? = try errorBodyReader[\"Message\"].readIfPresent()")
        writer.write("let requestID: String? = try errorBodyReader[\"RequestId\"].readIfPresent() ?? reader[\"RequestId\"].readIfPresent()")
        writer.openBlock("switch errorCode {", "}") {
            for (errorShape in errorShapes) {
                var errorShapeName = errorShape.errorShapeName(ctx.symbolProvider)
                var errorShapeType = ctx.symbolProvider.toSymbol(errorShape).name
                writer.write(
                    "case \$S: return try await \$L.responseErrorBinding(httpResponse: httpResponse, reader: errorBodyReader, message: message, requestID: requestID, requestID2: httpResponse.requestId2)",
                    errorShapeName,
                    errorShapeType
                )
            }
            writer.write("default: return try await \$unknownServiceErrorSymbol:N.makeError(httpResponse: httpResponse, message: message, requestID: requestID, requestID2: httpResponse.requestId2, typeName: errorCode)")
        }
    }

    override fun serviceErrorProtocolSymbol(): Symbol? {
        return AWSClientRuntimeTypes.RestXML.S3.AWSS3ServiceError
    }
}
