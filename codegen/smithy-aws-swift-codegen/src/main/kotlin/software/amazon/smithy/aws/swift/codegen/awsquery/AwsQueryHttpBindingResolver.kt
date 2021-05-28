package software.amazon.smithy.aws.swift.codegen.awsquery

import software.amazon.smithy.aws.swift.codegen.protocols.core.StaticHttpBindingResolver
import software.amazon.smithy.model.pattern.UriPattern
import software.amazon.smithy.model.traits.HttpTrait
import software.amazon.smithy.swift.codegen.integration.ProtocolGenerator

class AwsQueryHttpBindingResolver(
    private val context: ProtocolGenerator.GenerationContext,
) : StaticHttpBindingResolver(context, awsQueryHttpTrait) {

    companion object {
        private val awsQueryHttpTrait: HttpTrait = HttpTrait
            .builder()
            .code(200)
            .method("POST")
            .uri(UriPattern.parse("/"))
            .build()
    }
}
