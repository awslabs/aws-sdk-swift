package software.amazon.smithy.aws.swift.codegen

import software.amazon.smithy.aws.swift.codegen.AWSClientRuntimeTypes.Core.AWSClientConfiguration
import software.amazon.smithy.aws.swift.codegen.middleware.AWSSigningMiddleware
import software.amazon.smithy.aws.swift.codegen.model.traits.Presignable
import software.amazon.smithy.model.knowledge.OperationIndex
import software.amazon.smithy.model.shapes.OperationShape
import software.amazon.smithy.model.shapes.ServiceShape
import software.amazon.smithy.swift.codegen.ClientRuntimeTypes.Http.SdkHttpRequest
import software.amazon.smithy.swift.codegen.ClientRuntimeTypes.Middleware.NoopHandler
import software.amazon.smithy.swift.codegen.SwiftDelegator
import software.amazon.smithy.swift.codegen.SwiftWriter
import software.amazon.smithy.swift.codegen.core.CodegenContext
import software.amazon.smithy.swift.codegen.core.toProtocolGenerationContext
import software.amazon.smithy.swift.codegen.integration.SwiftIntegration
import software.amazon.smithy.swift.codegen.middleware.MiddlewareExecutionGenerator
import software.amazon.smithy.swift.codegen.model.expectShape

data class PresignableOperation(
    val serviceId: String,
    val operationId: String,
    // TODO ~ Implementation of embedded presigned URLs is TBD
    // val presignedParameterId: String?
)

class PresignerGenerator : SwiftIntegration {
    override fun writeAdditionalFiles(ctx: CodegenContext, delegator: SwiftDelegator) {
        val service = ctx.model.expectShape<ServiceShape>(ctx.settings.service)

        if (!AWSSigningMiddleware.isSupportedAuthentication(ctx.model, service)) return
        val presignOperations = service.allOperations
            .map { ctx.model.expectShape<OperationShape>(it) }
            .filter { operationShape -> operationShape.hasTrait(Presignable.ID) }
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

        writer.addImport(AWSClientConfiguration)
        writer.addImport(SdkHttpRequest)

        val operationsIndex = OperationIndex.of(ctx.model)
        val httpBindingResolver = protocolGenerator.getProtocolHttpBindingResolver(protocolGeneratorContext)

        writer.openBlock("extension $inputType {", "}") {
            writer.openBlock("public func presign(config: \$N) -> \$T {", "}", AWSClientConfiguration, SdkHttpRequest) {
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
                    protocolGenerator.defaultContentType,
                    protocolGenerator.httpProtocolCustomizable,
                    protocolGenerator.operationMiddleware,
                    operationStackName
                )
                generator.render(operationsIndex, op) { writer, _ ->
                    writer.write("return nil")
                }

                val requestBuilderName = "presignedRequestBuilder"
                val builtRequestName = "builtRequest"
                writer.write("let $requestBuilderName = $operationStackName.presignedRequest(context: context.build(), input: input, next: \$N())", NoopHandler)
                writer.openBlock("guard let $builtRequestName = $requestBuilderName?.build() else {", "}") {
                    writer.write("return nil")
                }
                writer.write("return $builtRequestName")
            }
        }
    }
}
