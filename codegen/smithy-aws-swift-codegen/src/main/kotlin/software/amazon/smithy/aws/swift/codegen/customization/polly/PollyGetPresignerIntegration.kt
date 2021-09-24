package software.amazon.smithy.aws.swift.codegen.customization.polly

import software.amazon.smithy.aws.swift.codegen.AWSClientRuntimeTypes
import software.amazon.smithy.aws.swift.codegen.PresignableOperation
import software.amazon.smithy.aws.swift.codegen.middleware.AWSSigningMiddleware
import software.amazon.smithy.model.Model
import software.amazon.smithy.model.shapes.OperationShape
import software.amazon.smithy.model.shapes.ServiceShape
import software.amazon.smithy.swift.codegen.ClientRuntimeTypes
import software.amazon.smithy.swift.codegen.SwiftDelegator
import software.amazon.smithy.swift.codegen.SwiftSettings
import software.amazon.smithy.swift.codegen.SwiftTypes
import software.amazon.smithy.swift.codegen.SwiftWriter
import software.amazon.smithy.swift.codegen.core.CodegenContext
import software.amazon.smithy.swift.codegen.core.toProtocolGenerationContext
import software.amazon.smithy.swift.codegen.integration.ProtocolGenerator
import software.amazon.smithy.swift.codegen.integration.SwiftIntegration
import software.amazon.smithy.swift.codegen.middleware.MiddlewareExecutionGenerator
import software.amazon.smithy.swift.codegen.middleware.MiddlewareRenderableExecutionContext
import software.amazon.smithy.swift.codegen.middleware.MiddlewareStep
import software.amazon.smithy.swift.codegen.middleware.OperationMiddleware
import software.amazon.smithy.swift.codegen.model.expectShape

internal val PRESIGNABLE_GET_OPERATIONS: Map<String, Set<String>> = mapOf(
    "com.amazonaws.polly#Parrot_v1" to setOf(
        "com.amazonaws.polly#SynthesizeSpeech"
    )
)

class PollyGetPresignerIntegration(private val presignedOperations: Map<String, Set<String>> = PRESIGNABLE_GET_OPERATIONS) : SwiftIntegration {
    override fun enabledForService(model: Model, settings: SwiftSettings): Boolean {
        val currentServiceId = model.expectShape<ServiceShape>(settings.service).id.toString()

        return presignedOperations.keys.contains(currentServiceId)
    }

    override fun writeAdditionalFiles(ctx: CodegenContext, delegator: SwiftDelegator) {
        val service = ctx.model.expectShape<ServiceShape>(ctx.settings.service)

        if (!AWSSigningMiddleware.isSupportedAuthentication(ctx.model, service)) return

        val operationsToGenerate = presignedOperations.getOrDefault(service.id.toString(), setOf())

        val presignOperations = service.allOperations
            .map { ctx.model.expectShape<OperationShape>(it) }
            .filter { operationShape -> operationsToGenerate.contains(operationShape.id.toString()) }
            .map { operationShape ->
                check(AWSSigningMiddleware.hasSigV4AuthScheme(ctx.model, service, operationShape)) { "Operation does not have valid auth trait" }
                PresignableOperation(service.id.toString(), operationShape.id.toString())
            }
        presignOperations.forEach { presignableOperation ->
            val op = ctx.model.expectShape<OperationShape>(presignableOperation.operationId)
            val inputType = op.input.get().getName()
            delegator.useFileWriter("${ctx.settings.moduleName}/models/$inputType+Presigner.swift") { writer ->
                renderPresigner(writer, ctx, delegator, op, inputType)
            }
        }
    }
    private fun renderPresigner(
        writer: SwiftWriter,
        ctx: CodegenContext,
        delegator: SwiftDelegator,
        op: OperationShape,
        inputType: String
    ) {
        val serviceShape = ctx.model.expectShape<ServiceShape>(ctx.settings.service)
        val protocolGenerator = ctx.protocolGenerator?.let { it } ?: run { return }
        val protocolGeneratorContext = ctx.toProtocolGenerationContext(serviceShape, delegator)?.let { it } ?: run { return }
        val operationMiddleware = resolveOperationMiddleware(protocolGenerator, op)

        writer.addImport(AWSClientRuntimeTypes.Core.AWSClientConfiguration)
        writer.addImport(ClientRuntimeTypes.Http.SdkHttpRequest)

        val httpBindingResolver = protocolGenerator.getProtocolHttpBindingResolver(protocolGeneratorContext, protocolGenerator.defaultContentType)

        writer.openBlock("extension $inputType {", "}") {
            // TODO: CREATE TYPE FOR URL IN CLIENTRUNTIME
            writer.openBlock(
                "public func presignURL(config: \$N, expiration: \$N) -> \$T {", "}",
                AWSClientRuntimeTypes.Core.AWSClientConfiguration,
                SwiftTypes.Int64,
                ClientRuntimeTypes.Core.URL
            ) {
                writer.write("let serviceName = \"${ctx.settings.sdkId}\"")
                writer.write("let input = self")
                val operationStackName = "operation"
                for (prop in protocolGenerator.httpProtocolCustomizable.getClientProperties()) {
                    prop.addImportsAndDependencies(writer)
                    prop.renderInstantiation(writer)
                    prop.renderConfiguration(writer)
                }

                val generator = MiddlewareExecutionGenerator(
                    protocolGeneratorContext,
                    writer,
                    httpBindingResolver,
                    protocolGenerator.httpProtocolCustomizable,
                    operationMiddleware,
                    operationStackName,
                    MiddlewareRenderableExecutionContext.PRESIGNER_POLLY_GET_REQUEST
                )
                generator.render(op) { writer, _ ->
                    writer.write("return nil")
                }

                val requestBuilderName = "presignedRequestBuilder"
                val builtRequestName = "builtRequest"
                val presignedURL = "presignedURL"
                writer.write(
                    "let $requestBuilderName = $operationStackName.presignedRequest(context: context.build(), input: input, next: \$N())",
                    ClientRuntimeTypes.Middleware.NoopHandler
                )
                writer.openBlock("guard let $builtRequestName = $requestBuilderName?.build(), let $presignedURL = $builtRequestName.endpoint.url else {", "}") {
                    writer.write("return nil")
                }
                writer.write("return $presignedURL")
            }
        }
    }
    private fun resolveOperationMiddleware(protocolGenerator: ProtocolGenerator, op: OperationShape): OperationMiddleware {
        val operationMiddlewareCopy = protocolGenerator.operationMiddleware.clone()
        operationMiddlewareCopy.removeMiddleware(op, MiddlewareStep.BUILDSTEP, "UserAgentMiddleware")
        operationMiddlewareCopy.removeMiddleware(op, MiddlewareStep.SERIALIZESTEP, "ContentTypeMiddleware")
        operationMiddlewareCopy.removeMiddleware(op, MiddlewareStep.SERIALIZESTEP, "OperationInputBodyMiddleware")
        operationMiddlewareCopy.removeMiddleware(op, MiddlewareStep.SERIALIZESTEP, "OperationInputQueryItemMiddleware")
        operationMiddlewareCopy.removeMiddleware(op, MiddlewareStep.SERIALIZESTEP, "OperationInputHeadersMiddleware")
        operationMiddlewareCopy.removeMiddleware(op, MiddlewareStep.FINALIZESTEP, "ContentLengthMiddleware")

        return operationMiddlewareCopy
    }

    /*
    override fun writeAdditionalFiles(ctx: CodegenContext, delegator: SwiftDelegator) {
        val serviceShape = ctx.model.expectShape<ServiceShape>(ctx.settings.service)
        val protocolGenerator = ctx.protocolGenerator?.let { it } ?: run { return }
        val protocolGeneratorContext = ctx.toProtocolGenerationContext(serviceShape, delegator)?.let { it } ?: run { return }

        val operationMiddlewareCopy = protocolGenerator.operationMiddleware.clone()
        operationMiddlewareCopy.removeMiddleware()
    }*/
}
