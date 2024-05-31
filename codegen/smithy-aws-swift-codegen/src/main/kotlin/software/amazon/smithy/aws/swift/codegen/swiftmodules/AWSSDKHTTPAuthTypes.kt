package software.amazon.smithy.aws.swift.codegen.swiftmodules

import software.amazon.smithy.aws.swift.codegen.AWSSwiftDependency
import software.amazon.smithy.codegen.core.Symbol
import software.amazon.smithy.swift.codegen.model.buildSymbol

object AWSSDKHTTPAuthTypes {
    var SigningPropertyKeys = runtimeSymbol("SigningPropertyKeys")
}

private fun runtimeSymbol(name: String): Symbol = buildSymbol {
    this.name = name
    this.namespace = AWSSwiftDependency.AWS_SDK_HTTP_AUTH.target
    dependency(AWSSwiftDependency.AWS_SDK_HTTP_AUTH)
}
