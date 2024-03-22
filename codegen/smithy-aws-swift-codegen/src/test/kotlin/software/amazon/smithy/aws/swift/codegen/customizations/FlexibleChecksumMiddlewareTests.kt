package software.amazon.smithy.aws.swift.codegen.customizations

import io.kotest.matchers.string.shouldContainOnlyOnce
import org.junit.jupiter.api.Test
import software.amazon.smithy.aws.swift.codegen.TestContext
import software.amazon.smithy.aws.swift.codegen.TestContextGenerator
import software.amazon.smithy.aws.swift.codegen.restjson.AWSRestJson1ProtocolGenerator
import software.amazon.smithy.aws.swift.codegen.shouldSyntacticSanityCheck
import software.amazon.smithy.aws.traits.protocols.RestJson1Trait

class FlexibleChecksumMiddlewareTests {

    @Test
    fun `Test that FlexibleChecksumsRequestMiddleware and FlexibleChecksumsResponseMiddleware are properly generated`() {
        val context = setupTests("flexible-checksums.smithy", "aws.flex.checks#ChecksumTests")
        val contents = TestContextGenerator.getFileContents(context.manifest, "/Example/ChecksumTestsClient.swift")
        contents.shouldSyntacticSanityCheck()
        val expectedContents = """
extension ChecksumTestsClient {
    /// Performs the `SomeOperation` operation on the `ChecksumTests` service.
    ///
    ///
    /// - Parameter SomeOperationInput : [no documentation found]
    ///
    /// - Returns: `SomeOperationOutput` : [no documentation found]
    public func someOperation(input: SomeOperationInput) async throws -> SomeOperationOutput {
        let context = ClientRuntime.HttpContextBuilder()
                      .withEncoder(value: encoder)
                      .withDecoder(value: decoder)
                      .withMethod(value: .post)
                      .withServiceName(value: serviceName)
                      .withOperation(value: "someOperation")
                      .withIdempotencyTokenGenerator(value: config.idempotencyTokenGenerator)
                      .withLogger(value: config.logger)
                      .withPartitionID(value: config.partitionID)
                      .withAuthSchemes(value: config.authSchemes ?? [])
                      .withAuthSchemeResolver(value: config.authSchemeResolver)
                      .withUnsignedPayloadTrait(value: false)
                      .withIdentityResolver(value: config.awsCredentialIdentityResolver, schemeID: "aws.auth#sigv4")
                      .withIdentityResolver(value: config.awsCredentialIdentityResolver, schemeID: "aws.auth#sigv4a")
                      .withRegion(value: config.region)
                      .build()
        var operation = ClientRuntime.OperationStack<SomeOperationInput, SomeOperationOutput>(id: "someOperation")
        operation.initializeStep.intercept(position: .after, middleware: ClientRuntime.URLPathMiddleware<SomeOperationInput, SomeOperationOutput>(SomeOperationInput.urlPathProvider(_:)))
        operation.initializeStep.intercept(position: .after, middleware: ClientRuntime.URLHostMiddleware<SomeOperationInput, SomeOperationOutput>())
        operation.buildStep.intercept(position: .before, middleware: ClientRuntime.ContentMD5Middleware<SomeOperationOutput>())
        let endpointParams = EndpointParams()
        operation.buildStep.intercept(position: .before, middleware: EndpointResolverMiddleware<SomeOperationOutput>(endpointResolver: config.endpointResolver, endpointParams: endpointParams))
        operation.buildStep.intercept(position: .before, middleware: AWSClientRuntime.UserAgentMiddleware(metadata: AWSClientRuntime.AWSUserAgentMetadata.fromConfig(serviceID: serviceName, version: "1.0.0", config: config)))
        operation.buildStep.intercept(position: .before, middleware: ClientRuntime.AuthSchemeMiddleware<SomeOperationOutput>())
        operation.serializeStep.intercept(position: .after, middleware: ClientRuntime.HeaderMiddleware<SomeOperationInput, SomeOperationOutput>(SomeOperationInput.headerProvider(_:)))
        operation.serializeStep.intercept(position: .after, middleware: ContentTypeMiddleware<SomeOperationInput, SomeOperationOutput>(contentType: "application/octet-stream"))
        operation.serializeStep.intercept(position: .after, middleware: ClientRuntime.BlobBodyMiddleware<SomeOperationInput, SomeOperationOutput>(keyPath: \.content))
        operation.serializeStep.intercept(position: .after, middleware: ClientRuntime.FlexibleChecksumsRequestMiddleware<SomeOperationInput, SomeOperationOutput>(checksumAlgorithm: input.checksumAlgorithm?.rawValue ?? config.checksumAlgorithm?.toString()))
        operation.finalizeStep.intercept(position: .before, middleware: ClientRuntime.ContentLengthMiddleware())
        operation.finalizeStep.intercept(position: .after, middleware: ClientRuntime.RetryMiddleware<ClientRuntime.DefaultRetryStrategy, AWSClientRuntime.AWSRetryErrorInfoProvider, SomeOperationOutput>(options: config.retryStrategyOptions))
        operation.finalizeStep.intercept(position: .before, middleware: ClientRuntime.SignerMiddleware<SomeOperationOutput>())
        operation.deserializeStep.intercept(position: .after, middleware: ClientRuntime.DeserializeMiddleware<SomeOperationOutput>(responseClosure(decoder: decoder), responseErrorClosure(SomeOperationOutputError.self, decoder: decoder)))
        operation.deserializeStep.intercept(position: .after, middleware: ClientRuntime.LoggerMiddleware<SomeOperationOutput>(clientLogMode: config.clientLogMode))
        operation.deserializeStep.intercept(position: .after, middleware: ClientRuntime.FlexibleChecksumsResponseMiddleware<SomeOperationOutput>(validationMode: true))
        let result = try await operation.handleMiddleware(context: context, input: input, next: client.getHandler())
        return result
    }

}
        """.trimIndent()
        contents.shouldContainOnlyOnce(expectedContents)
    }

    private fun setupTests(smithyFile: String, serviceShapeId: String): TestContext {
        val context =
            TestContextGenerator.initContextFrom(smithyFile, serviceShapeId, RestJson1Trait.ID)

        val generator = AWSRestJson1ProtocolGenerator()
        generator.generateProtocolUnitTests(context.ctx)
        context.ctx.delegator.flushWriters()
        return context
    }
}
