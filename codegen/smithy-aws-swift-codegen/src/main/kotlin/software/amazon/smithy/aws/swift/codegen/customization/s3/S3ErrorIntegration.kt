package software.amazon.smithy.aws.swift.codegen.customization.s3

import software.amazon.smithy.aws.swift.codegen.AWSClientRuntimeTypes
import software.amazon.smithy.model.Model
import software.amazon.smithy.model.shapes.ServiceShape
import software.amazon.smithy.swift.codegen.SwiftSettings
import software.amazon.smithy.swift.codegen.SwiftTypes
import software.amazon.smithy.swift.codegen.integration.SectionWriter
import software.amazon.smithy.swift.codegen.integration.SectionWriterBinding
import software.amazon.smithy.swift.codegen.integration.SwiftIntegration
import software.amazon.smithy.swift.codegen.integration.httpResponse.HttpResponseBindingErrorInitGenerator
import software.amazon.smithy.swift.codegen.model.expectShape

class S3ErrorIntegration: SwiftIntegration {
    override val order: Byte
        get() = 127

    override fun enabledForService(model: Model, settings: SwiftSettings): Boolean {
        return model.expectShape<ServiceShape>(settings.service).isS3
    }
    override val sectionWriters: List<SectionWriterBinding>
        get() = listOf(
            SectionWriterBinding(HttpResponseBindingErrorInitGenerator.ErrorMembersParams, s3MembersParams),
            SectionWriterBinding(HttpResponseBindingErrorInitGenerator.ErrorMembersAssignment, s3MembersAssignment),
        )

    private val s3MembersParams = SectionWriter { writer, previousValue ->
        if (previousValue != null) {
            for (line in previousValue.lines()) {
                if (line.endsWith(") throws {")) {
                    val firstpart = line.removeSuffix(") throws {")
                    writer.writeInline(firstpart)
                    writer.write(", requestID2: \$D) throws {", SwiftTypes.String)
                } else {
                    writer.write(line)
                }
            }
        }
    }

    private val s3MembersAssignment = SectionWriter { writer, _ ->
        writer.write("self._requestId2 = requestID2")
    }

}