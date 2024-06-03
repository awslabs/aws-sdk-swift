package software.amazon.smithy.aws.swift.codegen.swiftmodules

import software.amazon.smithy.aws.swift.codegen.AWSSwiftDependency
import software.amazon.smithy.codegen.core.Symbol
import software.amazon.smithy.swift.codegen.model.buildSymbol

object AWSSDKIdentityTypes {
    val AWSClientConfiguration = runtimeSymbol("AWSClientConfiguration")
    val AWSEndpoint = runtimeSymbol("AWSEndpoint")
    val Partition = runtimeSymbol("Partition")
    val ServiceEndpointMetadata = runtimeSymbol("ServiceEndpointMetadata")
    val CredentialScope = runtimeSymbol("CredentialScope")
    val AWSServiceError = runtimeSymbol("AWSServiceError")
    val RegionResolver = runtimeSymbol("RegionResolver")
    val Sha256TreeHashMiddleware = runtimeSymbol("Sha256TreeHashMiddleware")
    val AWSEndpointsRuleEngine = runtimeSymbol("AWSEndpointsRuleEngine")
    val AWSEndpointsRequestContext = runtimeSymbol("AWSEndpointsRequestContext")
    val AuthSchemeResolver = runtimeSymbol("AuthSchemeResolver")
    val DefaultAuthSchemeResolver = runtimeSymbol("DefaultAuthSchemeResolver")
}

private fun runtimeSymbol(name: String): Symbol = buildSymbol {
    this.name = name
    this.namespace = AWSSwiftDependency.AWS_SDK_IDENTITY.target
    dependency(AWSSwiftDependency.AWS_SDK_IDENTITY)
}
