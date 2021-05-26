package software.amazon.smithy.aws.swift.codegen.awsjson

import software.amazon.smithy.aws.swift.codegen.AWSHttpProtocolCustomizations
import software.amazon.smithy.aws.swift.codegen.AWSHttpRequestJsonEncoder
import software.amazon.smithy.aws.swift.codegen.AWSHttpResponseJsonDecoder
import software.amazon.smithy.aws.swift.codegen.AWSSwiftDependency
import software.amazon.smithy.aws.swift.codegen.middleware.AWSXAmzTargetMiddleware
import software.amazon.smithy.codegen.core.Symbol
import software.amazon.smithy.protocoltests.traits.HttpRequestTestCase
import software.amazon.smithy.swift.codegen.SwiftWriter
import software.amazon.smithy.swift.codegen.integration.ClientProperty
import software.amazon.smithy.swift.codegen.integration.OperationMiddlewareRenderable
import software.amazon.smithy.swift.codegen.integration.ProtocolGenerator.GenerationContext

class AWSHttpProtocolJson10Customizations : AWSHttpProtocolCustomizations() {

    override fun baseMiddlewares(ctx: GenerationContext): List<OperationMiddlewareRenderable> {
        val defaultMiddlewares = super.baseMiddlewares(ctx)
        val protocolMiddlewares = mutableListOf<OperationMiddlewareRenderable>()
        protocolMiddlewares.add(AWSXAmzTargetMiddleware())
        return defaultMiddlewares + protocolMiddlewares
    }

    override fun renderMiddlewareForGeneratedRequestTests(
        writer: SwiftWriter,
        test: HttpRequestTestCase,
        operationStack: String,
        inputSymbol: Symbol,
        outputSymbol: Symbol,
        outputErrorName: String,
        hasHttpBody: Boolean
    ) {
        writer.addImport(AWSSwiftDependency.AWS_CLIENT_RUNTIME.target)
        if (test.headers.keys.contains("X-Amz-Target")) {
            val XAmzTargetValue = test.headers["X-Amz-Target"]
            writer.write("$operationStack.serializeStep.intercept(position: .before, middleware: XAmzTargetMiddleware<${inputSymbol.name}, $outputSymbol, $outputErrorName>(xAmzTarget: \"${XAmzTargetValue}\"))")
        }
    }

    override fun getClientProperties(ctx: GenerationContext): List<ClientProperty> {
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
