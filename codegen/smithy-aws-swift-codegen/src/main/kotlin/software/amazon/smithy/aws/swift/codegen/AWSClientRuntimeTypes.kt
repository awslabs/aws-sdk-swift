/*
 * Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
 * SPDX-License-Identifier: Apache-2.0.
 */

package software.amazon.smithy.aws.swift.codegen

import software.amazon.smithy.codegen.core.Symbol
import software.amazon.smithy.swift.codegen.model.buildSymbol

object AWSClientRuntimeTypes {

    object EC2Query {
        val Ec2NarrowedResponse = runtimeSymbol("Ec2NarrowedResponse")
        val Ec2QueryError = runtimeSymbol("Ec2QueryError")
    }
    object AWSJSON {
        val XAmzTargetMiddleware = runtimeSymbol("XAmzTargetMiddleware")
    }
    object RestJSON {
        val RestJSONError = runtimeSymbol("RestJSONError")
    }

    object RestXML {
        val RestXMLError = runtimeSymbol("RestXMLError")
        val ErrorResponseContainer = runtimeSymbol("ErrorResponseContainer")
        object S3 {
            val AWSS3ServiceError = runtimeSymbol("AWSS3ServiceError")
            val AWSS3ErrorWith200StatusXMLMiddleware = runtimeSymbol("AWSS3ErrorWith200StatusXMLMiddleware")
        }
    }

    object Signing {
        val SigV4Config = runtimeSymbol("SigV4Config")
        val SigV4Middleware = runtimeSymbol("SigV4Middleware")
    }

    object Core {
        val AWSUserAgentMetadata = runtimeSymbol("AWSUserAgentMetadata")
        val UserAgentMiddleware = runtimeSymbol("UserAgentMiddleware")
        val EndpointResolverMiddleware = runtimeSymbol("EndpointResolverMiddleware")
        val FrameworkMetadata = runtimeSymbol("FrameworkMetadata")
        val CredentialsProviding = runtimeSymbol("CredentialsProviding")
        val AWSClientConfiguration = runtimeSymbol("AWSClientConfiguration")
        val AWSEndpoint = runtimeSymbol("AWSEndpoint")
        val Partition = runtimeSymbol("Partition")
        val ServiceEndpointMetadata = runtimeSymbol("ServiceEndpointMetadata")
        val CredentialScope = runtimeSymbol("CredentialScope")
        val UnknownAWSHTTPServiceError = runtimeSymbol("UnknownAWSHTTPServiceError")
        val AWSServiceError = runtimeSymbol("AWSServiceError")
        val RegionResolver = runtimeSymbol("RegionResolver")
        val Sha256TreeHashMiddleware = runtimeSymbol("Sha256TreeHashMiddleware")
        val AWSEndpointsRuleEngine = runtimeSymbol("AWSEndpointsRuleEngine")
        val AWSEndpointsRequestContext = runtimeSymbol("AWSEndpointsRequestContext")
        val AuthSchemeResolver = runtimeSymbol("AuthSchemeResolver")
        val DefaultAuthSchemeResolver = runtimeSymbol("DefaultAuthSchemeResolver")
        val AWSRetryErrorInfoProvider = runtimeSymbol("AWSRetryErrorInfoProvider")
    }

    object CRT {
        val CommonRuntimeKit = buildSymbol {
            this.name = "CommonRuntimeKit"
            this.namespace = AWSSwiftDependency.AWS_COMMON_RUNTIME.target
            dependency(AWSSwiftDependency.AWS_COMMON_RUNTIME)
        }
    }

    object AWSEventStream {

        val AWSMessageDecoder = runtimeSymbol("AWSEventStream.AWSMessageDecoder")
        val AWSMessageSigner = runtimeSymbol("AWSEventStream.AWSMessageSigner")
        val AWSMessageEncoder = runtimeSymbol("AWSEventStream.AWSMessageEncoder")
    }
}

private fun runtimeSymbol(name: String): Symbol = buildSymbol {
    this.name = name
    this.namespace = AWSSwiftDependency.AWS_CLIENT_RUNTIME.target
    dependency(AWSSwiftDependency.AWS_CLIENT_RUNTIME)
}
