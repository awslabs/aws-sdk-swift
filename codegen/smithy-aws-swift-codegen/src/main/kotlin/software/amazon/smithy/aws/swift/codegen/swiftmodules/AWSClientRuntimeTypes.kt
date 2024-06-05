package software.amazon.smithy.aws.swift.codegen.swiftmodules

import software.amazon.smithy.aws.swift.codegen.AWSSwiftDependency
import software.amazon.smithy.codegen.core.Symbol
import software.amazon.smithy.swift.codegen.SwiftDeclaration
import software.amazon.smithy.swift.codegen.model.buildSymbol
import software.amazon.smithy.swift.codegen.model.toInternalSPI
import software.amazon.smithy.swift.codegen.swiftmodules.SwiftSymbol

object AWSClientRuntimeTypes {

    object AWSQuery {
        val AWSQueryError = runtimeSymbol("AWSQueryError")
    }
    object EC2Query {
        val EC2QueryError = runtimeSymbol("EC2QueryError")
    }
    object AWSJSON {
        val AWSJSONError = runtimeSymbol("AWSJSONError")
        val XAmzTargetMiddleware = runtimeSymbol("XAmzTargetMiddleware")
    }
    object RestJSON {
        val RestJSONError = runtimeSymbol("RestJSONError")
    }

    object RestXML {
        val RestXMLError = runtimeSymbol("RestXMLError")
        object S3 {
            val AWSS3ServiceError = runtimeSymbol("AWSS3ServiceError")
            val AWSS3ErrorWith200StatusXMLMiddleware = runtimeSymbol("AWSS3ErrorWith200StatusXMLMiddleware")
        }
    }

    object Core {
        val AWSUserAgentMetadata = runtimeSymbol("AWSUserAgentMetadata")
        val UserAgentMiddleware = runtimeSymbol("UserAgentMiddleware")
        val EndpointResolverMiddleware = runtimeSymbol("EndpointResolverMiddleware", SwiftDeclaration.STRUCT)
        val FrameworkMetadata = runtimeSymbol("FrameworkMetadata")
        val AWSClientConfiguration = runtimeSymbol("AWSClientConfiguration")
        val AWSEndpoint = runtimeSymbol("AWSEndpoint", SwiftDeclaration.STRUCT)
        val Partition = runtimeSymbol("Partition")
        val ServiceEndpointMetadata = runtimeSymbol("ServiceEndpointMetadata")
        val CredentialScope = runtimeSymbol("CredentialScope")
        val UnknownAWSHTTPServiceError = runtimeSymbol("UnknownAWSHTTPServiceError", SwiftDeclaration.STRUCT)
            .toInternalSPI("UnknownAWSHTTPServiceError")
        val AWSServiceError = runtimeSymbol("AWSServiceError")
        val RegionResolver = runtimeSymbol("RegionResolver")
        val Sha256TreeHashMiddleware = runtimeSymbol("Sha256TreeHashMiddleware")
        val AWSEndpointsRuleEngine = runtimeSymbol("AWSEndpointsRuleEngine")
        val AWSEndpointsRequestContext = runtimeSymbol("AWSEndpointsRequestContext")
        val AuthSchemeResolver = runtimeSymbol("AuthSchemeResolver")
        val DefaultAuthSchemeResolver = runtimeSymbol("DefaultAuthSchemeResolver")
        val AWSRetryErrorInfoProvider = runtimeSymbol("AWSRetryErrorInfoProvider")
        val AWSRetryMode = runtimeSymbol("AWSRetryMode")
        val AWSPartitionDefinition = runtimeSymbol("awsPartitionJSON", SwiftDeclaration.LET)
    }

    object CRT {
        val CommonRuntimeKit = buildSymbol {
            this.name = "CommonRuntimeKit"
            this.namespace = AWSSwiftDependency.AWS_COMMON_RUNTIME.target
            dependency(AWSSwiftDependency.AWS_COMMON_RUNTIME)
        }
    }
}

private fun runtimeSymbol(name: String, declaration: SwiftDeclaration? = null): Symbol = SwiftSymbol.make(
    name,
    declaration,
    AWSSwiftDependency.AWS_CLIENT_RUNTIME,
)
