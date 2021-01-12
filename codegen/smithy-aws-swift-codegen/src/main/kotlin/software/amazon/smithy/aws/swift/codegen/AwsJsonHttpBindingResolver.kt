package software.amazon.smithy.aws.swift.codegen

import software.amazon.smithy.model.knowledge.HttpBinding
import software.amazon.smithy.model.knowledge.HttpBindingIndex
import software.amazon.smithy.model.knowledge.TopDownIndex
import software.amazon.smithy.model.pattern.UriPattern
import software.amazon.smithy.model.shapes.*
import software.amazon.smithy.model.traits.HttpTrait
import software.amazon.smithy.swift.codegen.integration.HttpBindingDescriptor
import software.amazon.smithy.swift.codegen.integration.HttpBindingResolver
import software.amazon.smithy.swift.codegen.integration.ProtocolGenerator

class AwsJsonHttpBindingResolver(
        private val generationContext: ProtocolGenerator.GenerationContext,
        private val topDownIndex: TopDownIndex = TopDownIndex.of(generationContext.model),
        private val bindingIndex: HttpBindingIndex = HttpBindingIndex.of(generationContext.model)
) : HttpBindingResolver {

    companion object {
        private val awsJsonHttpTrait: HttpTrait = HttpTrait
                .builder()
                .code(200)
                .method("POST")
                .uri(UriPattern.parse("/"))
                .build()
    }

    override fun httpTrait(operationShape: OperationShape): HttpTrait = awsJsonHttpTrait

    override fun responseBindings(shape: Shape): List<HttpBindingDescriptor> {
        return when (shape) {
            is OperationShape -> {
                if (!shape.output.isPresent) return emptyList()
                val outputs = generationContext.model.expectShape(shape.output.get())
                outputs.members().map { member ->
                    HttpBindingDescriptor(member, HttpBinding.Location.DOCUMENT, "") }.toList()
            }
            is StructureShape -> {
                val outputs = shape.members()
                outputs.map { member ->
                    HttpBindingDescriptor(member, HttpBinding.Location.DOCUMENT, "") }.toList()
            }
            else -> {
                error("Unimplemented shape type for http response bindings: $shape")
            }
        }
    }

    override fun requestBindings(operationShape: OperationShape): List<HttpBindingDescriptor> {
        if (!operationShape.input.isPresent) return emptyList()
        val inputs = generationContext.model.expectShape(operationShape.input.get())
        return inputs.members().map { member ->
            HttpBindingDescriptor(member, HttpBinding.Location.DOCUMENT, "") }.toList()
    }
}