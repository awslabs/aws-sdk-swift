package software.amazon.smithy.aws.swift.codegen.customization.s3

import software.amazon.smithy.aws.swift.codegen.AWSClientRuntimeTypes
import software.amazon.smithy.aws.swift.codegen.restxml.AWSRestXMLHttpResponseBindingErrorGenerator
import software.amazon.smithy.aws.traits.protocols.RestXmlTrait
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
import software.amazon.smithy.swift.codegen.model.getTrait
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
        val noErrorWrapping = ctx.service.getTrait<RestXmlTrait>()?.let { it.isNoErrorWrapping } ?: false
        writer.write("let responseReader = try await responseDocumentClosure(httpResponse)")
        if (errorShapes.isNotEmpty() || ctx.service.errors.isNotEmpty()) {
            writer.write(
                "let errorBodyReader = \$N.errorBodyReader(responseReader: responseReader, noErrorWrapping: \$L)",
                AWSClientRuntimeTypes.RestXML.RestXMLError,
                noErrorWrapping
            )
        }
        if (ctx.service.errors.isNotEmpty()) {
            writer.openBlock(
                "if let serviceError = try await \$NTypes.responseErrorServiceBinding(httpResponse, errorBodyReader)",
                "}",
                ctx.symbolProvider.toSymbol(ctx.service)
            ) {
                writer.write("return serviceError")
            }
        }
        writer.write("let restXMLError = try await \$N.makeError(from: httpResponse, responseReader: responseReader, noErrorWrapping: \$L)", AWSClientRuntimeTypes.RestXML.RestXMLError, noErrorWrapping)
        writer.openBlock("switch restXMLError.code {", "}") {
            for (errorShape in errorShapes) {
                var errorShapeName = errorShape.errorShapeName(ctx.symbolProvider)
                var errorShapeType = ctx.symbolProvider.toSymbol(errorShape).name
                writer.write(
                    "case \$S: return try await \$L.responseErrorBinding(httpResponse: httpResponse, reader: errorBodyReader, message: restXMLError.message, requestID: restXMLError.requestID, requestID2: httpResponse.requestId2)",
                    errorShapeName,
                    errorShapeType
                )
            }
            writer.write("default: return try await \$unknownServiceErrorSymbol:N.makeError(httpResponse: httpResponse, message: restXMLError.message, requestID: restXMLError.requestID, requestID2: httpResponse.requestId2, typeName: restXMLError.code)")
        }
    }

    override fun serviceErrorProtocolSymbol(): Symbol? {
        return AWSClientRuntimeTypes.RestXML.S3.AWSS3ServiceError
    }
}
