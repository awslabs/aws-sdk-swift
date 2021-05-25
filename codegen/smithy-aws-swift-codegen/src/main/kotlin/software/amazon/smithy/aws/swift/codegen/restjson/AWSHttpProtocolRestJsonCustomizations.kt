package software.amazon.smithy.aws.swift.codegen.restjson

import software.amazon.smithy.aws.swift.codegen.AWSHttpProtocolCustomizations
import software.amazon.smithy.aws.swift.codegen.AWSHttpRequestJsonEncoder
import software.amazon.smithy.aws.swift.codegen.AWSHttpResponseJsonDecoder
import software.amazon.smithy.aws.swift.codegen.middleware.AWSSigningMiddleware
import software.amazon.smithy.aws.swift.codegen.middleware.AWSXAmzTargetMiddleware
import software.amazon.smithy.aws.swift.codegen.middleware.EndpointResolverMiddleware
import software.amazon.smithy.aws.swift.codegen.needsSigning
import software.amazon.smithy.model.shapes.OperationShape
import software.amazon.smithy.swift.codegen.SwiftWriter
import software.amazon.smithy.swift.codegen.integration.ClientProperty
import software.amazon.smithy.swift.codegen.integration.ProtocolGenerator
import software.amazon.smithy.swift.codegen.integration.ProtocolMiddleware

class AWSHttpProtocolRestJsonCustomizations : AWSHttpProtocolCustomizations() {

    override fun getDefaultProtocolMiddlewares(ctx: ProtocolGenerator.GenerationContext): List<ProtocolMiddleware> {
        val defaultMiddlewares = super.getDefaultProtocolMiddlewares(ctx)
        val protocolMiddlewares = mutableListOf<ProtocolMiddleware>()
        protocolMiddlewares.add(EndpointResolverMiddleware())

        if(ctx.service.needsSigning) {
            protocolMiddlewares.add(AWSSigningMiddleware())
        }

        return defaultMiddlewares + protocolMiddlewares
    }

    override fun getClientProperties(ctx: ProtocolGenerator.GenerationContext): List<ClientProperty> {
        val properties = mutableListOf<ClientProperty>()
        val requestEncoderOptions = mutableMapOf<String, String>()
        val responseDecoderOptions = mutableMapOf<String, String>()
        // TODO:: Subject to change if Foundation dependency is removed
        requestEncoderOptions["dateEncodingStrategy"] = ".secondsSince1970"
        responseDecoderOptions["dateDecodingStrategy"] = ".secondsSince1970"
        properties.add(AWSHttpRequestJsonEncoder(requestEncoderOptions))
        properties.add(AWSHttpResponseJsonDecoder(responseDecoderOptions))
        return properties
    }
}
