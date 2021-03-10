package software.amazon.smithy.aws.swift.codegen.awsjson

import software.amazon.smithy.aws.swift.codegen.AWSHttpProtocolCustomizations
import software.amazon.smithy.aws.swift.codegen.AWSHttpRequestJsonEncoder
import software.amazon.smithy.aws.swift.codegen.AWSHttpResponseJsonDecoder
import software.amazon.smithy.aws.swift.codegen.AWSSwiftDependency
import software.amazon.smithy.aws.swift.codegen.middleware.AWSSigningMiddleware
import software.amazon.smithy.aws.swift.codegen.middleware.AWSXAmzTargetMiddleware
import software.amazon.smithy.codegen.core.Symbol
import software.amazon.smithy.model.shapes.OperationShape
import software.amazon.smithy.protocoltests.traits.HttpRequestTestCase
import software.amazon.smithy.swift.codegen.SwiftWriter
import software.amazon.smithy.swift.codegen.defaultName
import software.amazon.smithy.swift.codegen.integration.ClientProperty
import software.amazon.smithy.swift.codegen.integration.ProtocolGenerator

class AWSHttpProtocolJson11Customizations : AWSHttpProtocolCustomizations() {
    override fun renderMiddlewares(ctx: ProtocolGenerator.GenerationContext, writer: SwiftWriter, op: OperationShape, operationStackName: String) {
        writer.write("$operationStackName.buildStep.intercept(position: .before, middleware: EndpointResolverMiddleware(endpointResolver: config.endpointResolver, serviceId: serviceName))")

        val signingMiddleware = AWSSigningMiddleware()
        val serviceShape = ctx.service
        if (signingMiddleware.needsSigningMiddleware(serviceShape)) {
            signingMiddleware.renderSigningMiddleware(writer, serviceShape, op, operationStackName)
        }

        val xAmzTargetMiddleware = AWSXAmzTargetMiddleware()
        val inputShape = ctx.model.expectShape(op.input.get())
        val inputShapeName = ctx.symbolProvider.toSymbol(inputShape).name
        val outputShape = ctx.model.expectShape(op.output.get())
        val outputShapeName = ctx.symbolProvider.toSymbol(outputShape).name
        val outputErrorName = "${op.defaultName()}Error"
        xAmzTargetMiddleware.xAmzTargetMiddleware(writer, serviceShape, op, operationStackName, inputShapeName, outputShapeName, outputErrorName)
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
