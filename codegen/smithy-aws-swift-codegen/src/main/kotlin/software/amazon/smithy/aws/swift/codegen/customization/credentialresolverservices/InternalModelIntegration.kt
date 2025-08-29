package software.amazon.smithy.aws.swift.codegen.customization.credentialresolverservices

import software.amazon.smithy.model.Model
import software.amazon.smithy.model.shapes.OperationShape
import software.amazon.smithy.model.transform.ModelTransformer
import software.amazon.smithy.swift.codegen.SwiftSettings
import software.amazon.smithy.swift.codegen.integration.SwiftIntegration
import java.util.function.Predicate

class InternalModelIntegration : SwiftIntegration {
    private val stsOps =
        listOf(
            "com.amazonaws.sts#AssumeRole",
            "com.amazonaws.sts#AssumeRoleWithWebIdentity",
        )
    private val ssoOps =
        listOf(
            "com.amazonaws.sso#GetRoleCredentials",
        )
    private val ssoOIDCOps =
        listOf(
            "com.amazonaws.ssooidc#CreateToken",
        )
    private val cognitoOps =
        listOf(
            "com.amazonaws.cognitoidentity#GetId",
            "com.amazonaws.cognitoidentity#GetCredentialsForIdentity",
        )

    override fun enabledForService(
        model: Model,
        settings: SwiftSettings,
    ): Boolean = settings.internalClient

    override fun preprocessModel(
        model: Model?,
        settings: SwiftSettings?,
    ): Model {
        val ops = neededOpsForService(settings?.sdkId)
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

    private fun neededOpsForService(sdkId: String?): List<String> =
        when (sdkId) {
            "STS" -> stsOps
            "SSO" -> ssoOps
            "SSO OIDC" -> ssoOIDCOps
            "Cognito Identity" -> cognitoOps
            else -> emptyList()
        }
}
