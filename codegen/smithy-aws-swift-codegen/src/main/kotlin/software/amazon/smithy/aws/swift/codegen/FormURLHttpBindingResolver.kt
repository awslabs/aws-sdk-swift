package software.amazon.smithy.aws.swift.codegen

import software.amazon.smithy.model.pattern.UriPattern
import software.amazon.smithy.model.traits.HttpTrait
import software.amazon.smithy.swift.codegen.integration.ProtocolGenerator
import software.amazon.smithy.swift.codegen.integration.protocols.core.StaticHttpBindingResolver

class FormURLHttpBindingResolver(
    private val context: ProtocolGenerator.GenerationContext,
) : StaticHttpBindingResolver(context, httpTrait) {

    companion object {
        private val httpTrait: HttpTrait = HttpTrait
            .builder()
            .code(200)
            .method("POST")
            .uri(UriPattern.parse("/"))
            .build()
    }
}
