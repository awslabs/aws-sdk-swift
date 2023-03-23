package software.amazon.smithy.aws.swift.codegen.customization

import software.amazon.smithy.aws.swift.codegen.AWSClientRuntimeTypes
import software.amazon.smithy.aws.swift.codegen.AWSSwiftDependency
import software.amazon.smithy.swift.codegen.integration.SectionWriter
import software.amazon.smithy.swift.codegen.integration.SectionWriterBinding
import software.amazon.smithy.swift.codegen.integration.SwiftIntegration
import software.amazon.smithy.swift.codegen.integration.httpResponse.bindingTraits.HttpResponseTraitWithHttpPayload

class MessageEncoderIntegration : SwiftIntegration {
    private val messageDecoder: SectionWriter = SectionWriter { writer, _ ->
        writer.addImport(AWSSwiftDependency.AWS_CLIENT_RUNTIME.target)
        writer.write("let messageDecoder = \$N()", AWSClientRuntimeTypes.AWSEventStream.AWSMessageDecoder)
    }
    override val sectionWriters: List<SectionWriterBinding>
        get() = listOf(
            SectionWriterBinding(HttpResponseTraitWithHttpPayload.MessageDecoderSectionId, messageDecoder)
        )
}
