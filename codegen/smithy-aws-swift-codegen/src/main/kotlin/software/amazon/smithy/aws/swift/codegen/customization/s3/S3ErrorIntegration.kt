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
        val ctx = writer.getContext("ctx") as ProtocolGenerator.GenerationContext
        val errorShapes = writer.getContext("errorShapes") as List<StructureShape>
        val unknownServiceErrorType = writer.getContext("unknownServiceErrorType") as String
        writer.write("let restXMLError = try \$N.makeError(from: httpResponse)", AWSClientRuntimeTypes.RestXML.RestXMLError)
        writer.openBlock("switch restXMLError.errorCode {", "}") {
            for (errorShape in errorShapes) {
                var errorShapeName = ctx.symbolProvider.toSymbol(errorShape).name
                var errorShapeType = ctx.symbolProvider.toSymbol(errorShape).name
                writer.write("case \$S: return try \$L(httpResponse: httpResponse, decoder: decoder, message: restXMLError.message, requestID: restXMLError.requestId, requestID2: httpResponse.requestId2)", errorShapeName, errorShapeType)
            }
            writer.write("default: return $unknownServiceErrorType(httpResponse: httpResponse, message: restXMLError.message, requestID: restXMLError.requestId)")
        }

    }

    override fun serviceErrorProtocolSymbol(): Symbol? {
        return AWSClientRuntimeTypes.RestXML.S3.S3HttpServiceError
    }
}
