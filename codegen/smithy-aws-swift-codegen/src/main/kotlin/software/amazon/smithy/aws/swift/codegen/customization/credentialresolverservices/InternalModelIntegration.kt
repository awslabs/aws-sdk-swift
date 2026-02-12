package software.amazon.smithy.aws.swift.codegen.customization.credentialresolverservices

import software.amazon.smithy.model.Model
import software.amazon.smithy.model.shapes.OperationShape
import software.amazon.smithy.model.transform.ModelTransformer
import software.amazon.smithy.swift.codegen.SwiftSettings
import software.amazon.smithy.swift.codegen.integration.SwiftIntegration
import java.util.function.Predicate

class InternalModelIntegration : SwiftIntegration {
    override fun enabledForService(
        model: Model,
        settings: SwiftSettings,
    ): Boolean = settings.internalClient

    override fun preprocessModel(
        model: Model,
        settings: SwiftSettings,
    ): Model {
        val ops = settings.operations
        if (ops.isEmpty()) return model
        return ModelTransformer.create().removeShapesIf(
            model,
            Predicate { shape ->
                when (shape) {
                    is OperationShape -> shape.id.toString() !in ops
                    else -> false
                }
            },
        )
    }
}
