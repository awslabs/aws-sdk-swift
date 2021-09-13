package software.amazon.smithy.aws.swift.codegen

import software.amazon.smithy.aws.swift.codegen.AWSClientRuntimeTypes.Core.AWSClientConfiguration
import software.amazon.smithy.aws.swift.codegen.model.traits.Presignable
import software.amazon.smithy.aws.traits.auth.SigV4Trait
import software.amazon.smithy.model.knowledge.OperationIndex
import software.amazon.smithy.model.shapes.OperationShape
import software.amazon.smithy.model.shapes.ServiceShape
import software.amazon.smithy.swift.codegen.ClientRuntimeTypes.Http.SdkHttpRequest
import software.amazon.smithy.swift.codegen.SwiftDelegator
import software.amazon.smithy.swift.codegen.SwiftWriter
import software.amazon.smithy.swift.codegen.core.CodegenContext
import software.amazon.smithy.swift.codegen.core.toProtocolGenerationContext
import software.amazon.smithy.swift.codegen.integration.HttpBindingResolver
import software.amazon.smithy.swift.codegen.integration.HttpTraitResolver
import software.amazon.smithy.swift.codegen.integration.MiddlewareExecutionGenerator
import software.amazon.smithy.swift.codegen.integration.ProtocolGenerator
import software.amazon.smithy.swift.codegen.integration.SwiftIntegration
import software.amazon.smithy.swift.codegen.model.expectShape
import software.amazon.smithy.swift.codegen.model.expectTrait

data class PresignableOperation(
    val serviceId: String,
    val operationId: String,
    // TODO ~ Implementation of embedded presigned URLs is TBD
    val presignedParameterId: String?,
    val hasBody: Boolean,
)

class PresignerGenerator : SwiftIntegration {
    override fun writeAdditionalFiles(ctx: CodegenContext, delegator: SwiftDelegator) {
        val service = ctx.model.expectShape<ServiceShape>(ctx.settings.service)

        // if (!AwsSignatureVersion4.isSupportedAuthentication(ctx.model, service)) return
        val presignOperations = service.allOperations
            .map { ctx.model.expectShape<OperationShape>(it) }
            .filter { operationShape -> operationShape.hasTrait(Presignable.ID) }
            .map { operationShape ->
                // check(AwsSignatureVersion4.hasSigV4AuthScheme(ctx.model, service, operationShape)) { "Operation does not have valid auth trait" }
                // val resolver: HttpBindingResolver = getProtocolHttpBindingResolver(ctx, service)
                // val hasBody = resolver.hasHttpBody(operationShape)

                // TODO: update this to get the http binding resolver
                val hasBody = true
                PresignableOperation(service.id.toString(), operationShape.id.toString(), null, hasBody)
            }

        // If presignable operations found for this service, generate a Presigner file
        if (presignOperations.isNotEmpty()) {
            // tdo:
            //            delegator.useFileWriter("Presigner.kt", ctx.settings.pkg.name) { writer ->

            delegator.useFileWriter("${ctx.settings.moduleName}/models/Presigner.swift") { writer ->
                renderPresigner(writer, ctx, delegator, service.expectTrait<SigV4Trait>().name, presignOperations)
            }
        }
    }

    private fun renderPresigner(
        writer: SwiftWriter,
        ctx: CodegenContext,
        delegator: SwiftDelegator,
        sigv4ServiceName: String,
        presignOperations: List<PresignableOperation>
    ) {
        val serviceShape = ctx.model.expectShape<ServiceShape>(ctx.settings.service)
        val httpProtocolCustomizable = ctx.protocolGenerator?.let { it.httpProtocolCustomizable } ?: run { return }
        val protocolGeneratorContext = ctx.toProtocolGenerationContext(serviceShape, delegator)?.let { it } ?: run { return }

        val serviceSymbol = ctx.symbolProvider.toSymbol(serviceShape)
        /*
        val defaultEndpointResolverSymbol = buildSymbol {
            namespace = "${ctx.settings.pkg.name}.internal"
            name = EndpointResolverGenerator.typeName
        }
        val presignConfigTypeName = "${ctx.settings.sdkId}PresignConfig"
        writer.addImport(presignerRuntimeSymbols)

        // import generated SDK types
        writer.addImport(serviceSymbol)
        writer.addImport(defaultEndpointResolverSymbol)
        */

        val operationsIndex = OperationIndex.of(ctx.model)

        presignOperations.forEach { presignableOp ->
            val op = ctx.model.expectShape<OperationShape>(presignableOp.operationId)
            val inputType = op.input.get().getName()
            val httpBindingResolver = getProtocolHttpBindingResolver(protocolGeneratorContext)
            writer.openBlock("extension $inputType {", "}") {
                writer.addImport(AWSClientConfiguration)
                writer.addImport(SdkHttpRequest)
                writer.openBlock("func presign(config: \$N) -> \$T {", "}", AWSClientConfiguration, SdkHttpRequest) {
                    writer.write("let serviceName = \"${ctx.settings.sdkId}\"")
                    writer.write("let input = self")
                    // ctx.protocolGenerator?.serdecontxt
                    val operationStackName = "operation"
                    for (prop in httpProtocolCustomizable.getClientProperties()) {
                        if (prop.name == "encoder" || prop.name == "decoder") {
                            prop.addImportsAndDependencies(writer)
                            prop.renderInstantiation(writer)
                            prop.renderConfiguration(writer)
                        }
                    }

                    val generator = MiddlewareExecutionGenerator(protocolGeneratorContext, writer, httpBindingResolver, "content-type", httpProtocolCustomizable, operationStackName)
                    generator.render(operationsIndex, op) { writer, _ ->
                        writer.write("return nil")
                    }
                    writer.write("let result = $operationStackName.presignedRequest(context: context.build(), input: self, next: ClientRuntime.NoopHandler())")
                    writer.openBlock("guard let request = result?.build() else {", "}") {
                        writer.write("return nil")
                    }
                    writer.write("return request")
                }
            }
        }
    }

    private fun getProtocolHttpBindingResolver(ctx: ProtocolGenerator.GenerationContext): HttpBindingResolver {
        // TODO
//        when (requireNotNull(ctx.protocolGenerator).protocol) {
//            AwsQueryTrait.ID -> QueryBindingResolver(ctx.model, service)
//            RestJson1Trait.ID -> HttpTraitResolver(ctx.model, service, "application/json")
//            RestXmlTrait.ID -> HttpTraitResolver(ctx.model, service, "application/xml")
//            else -> throw CodegenException("Unable to create HttpBindingResolver for unhandled protocol ${ctx.protocolGenerator?.protocol}")
//        }
        return HttpTraitResolver(ctx)
    }
}
