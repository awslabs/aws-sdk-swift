package software.amazon.smithy.aws.swift.codegen

import software.amazon.smithy.codegen.core.Symbol
import software.amazon.smithy.swift.codegen.model.buildSymbol

object AWSRuntimeTypes {
    object Core {
        val EndpointResolver = runtimeSymbol("EndpointResolver", AWSSwiftDependency.AWS_CLIENT_RUNTIME)
        val CredentialsProvider = runtimeSymbol("AWSCredentialsProvider", AWSSwiftDependency.AWS_CLIENT_RUNTIME)
    }
}

private fun runtimeSymbol(name: String, dependency: AWSSwiftDependency): Symbol = buildSymbol {
    this.name = name
    dependency(dependency)
}
