package software.amazon.smithy.aws.swift.codegen

import software.amazon.smithy.codegen.core.SymbolProvider
import software.amazon.smithy.model.Model
import software.amazon.smithy.model.shapes.Shape
import software.amazon.smithy.model.shapes.ShapeType
import software.amazon.smithy.swift.codegen.SwiftSettings
import software.amazon.smithy.swift.codegen.SwiftWriter
import software.amazon.smithy.swift.codegen.appendWithDelimiter
import software.amazon.smithy.swift.codegen.integration.SECTION_CLIENT_INIT_SERDE
import software.amazon.smithy.swift.codegen.integration.SECTION_CONFIG_INHERITANCE
import software.amazon.smithy.swift.codegen.integration.SwiftIntegration
import software.amazon.smithy.swift.codegen.withState

class AWSServiceConfigIntegration: SwiftIntegration {
    override fun onShapeWriterUse(
        settings: SwiftSettings,
        model: Model,
        symbolProvider: SymbolProvider,
        writer: SwiftWriter,
        definedShape: Shape
    ) {
        writer.onSection(SECTION_CLIENT_INIT_SERDE) {
            writer.write("self.encoder = config.encoder ?? encoder")
            writer.write("self.decoder = config.decoder ?? decoder")
        }

        writer.onSection(SECTION_CONFIG_INHERITANCE) { text ->
            writer.addImport("AWSClientRuntime")
            writer.appendWithDelimiter(text, "AWSServiceConfiguration")
        }

        super.onShapeWriterUse(settings, model, symbolProvider, writer, definedShape)
    }
}