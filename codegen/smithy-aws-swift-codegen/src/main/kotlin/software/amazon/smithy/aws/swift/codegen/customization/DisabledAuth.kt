package software.amazon.smithy.aws.swift.codegen.customization

import software.amazon.smithy.model.Model
import software.amazon.smithy.model.SourceLocation
import software.amazon.smithy.model.shapes.OperationShape
import software.amazon.smithy.model.shapes.ServiceShape
import software.amazon.smithy.model.traits.AuthTrait
import software.amazon.smithy.model.transform.ModelTransformer
import software.amazon.smithy.swift.codegen.SwiftSettings
import software.amazon.smithy.swift.codegen.integration.SwiftIntegration
import software.amazon.smithy.swift.codegen.model.expectShape

internal val DISABLED_AUTH_OPERATIONS: Map<String, Set<String>> = mapOf(
    "com.amazonaws.sts#AWSSecurityTokenServiceV20110615" to setOf(
        "com.amazonaws.sts#AssumeRoleWithSAML",
        "com.amazonaws.sts#AssumeRoleWithWebIdentity"
    ),
)

// TODO: If or when the service team adds this trait to their model, we can remove this customization
class DisabledAuth(private val disabledAuth: Map<String, Set<String>> = DISABLED_AUTH_OPERATIONS) : SwiftIntegration {
    override fun enabledForService(model: Model, settings: SwiftSettings): Boolean {
        val currentServiceId = model.expectShape<ServiceShape>(settings.service).id.toString()
        return disabledAuth.keys.contains(currentServiceId)
    }

    override fun preprocessModel(model: Model, settings: SwiftSettings): Model {
        val currentServiceId = model.expectShape<ServiceShape>(settings.service).id.toString()
        val disabledAuthOperations = disabledAuth[currentServiceId]!!
        return ModelTransformer.create().mapShapes(model) {
            if (disabledAuthOperations.contains(it.id.toString()) && it is OperationShape) {
                it.toBuilder().addTrait(AuthTrait(setOf(), SourceLocation.NONE)).build()
            } else {
                it
            }
        }
    }
}
