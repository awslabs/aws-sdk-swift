package software.amazon.smithy.aws.swift.codegen
import io.kotest.matchers.string.shouldContainOnlyOnce
import org.junit.jupiter.api.Test
import software.amazon.smithy.aws.swift.codegen.protocols.restjson.AWSRestJson1ProtocolGenerator
import software.amazon.smithy.aws.traits.protocols.RestJson1Trait
import software.amazon.smithy.swift.codegen.core.GenerationContext
import software.amazon.smithy.swift.codegen.integration.ProtocolGenerator
class PresignerGeneratorTests {
    @Test
    fun `001 presignable on getFooInput`() {
        val context = setupTests("awsrestjson1/presignable.smithy", "smithy.swift.traits#Example")
        val contents = TestUtils.getFileContents(context.manifest, "/Example/models/GetFooInput+Presigner.swift")
        contents.shouldSyntacticSanityCheck()
        val expectedContents = """
extension GetFooInput {
    public func presign(config: ExampleClient.ExampleClientConfiguration, expiration: Foundation.TimeInterval) async throws -> ClientRuntime.SdkHttpRequest? {
        let serviceName = "example"
        let input = self
        let context = ClientRuntime.HttpContextBuilder()
                      .withMethod(value: .get)
                      .withServiceName(value: serviceName)
                      .withOperation(value: "getFoo")
                      .withIdempotencyTokenGenerator(value: config.idempotencyTokenGenerator)
                      .withLogger(value: config.logger)
                      .withPartitionID(value: config.partitionID)
                      .withAuthSchemes(value: config.authSchemes ?? [])
                      .withAuthSchemeResolver(value: config.authSchemeResolver)
                      .withUnsignedPayloadTrait(value: false)
                      .withSocketTimeout(value: config.httpClientConfiguration.socketTimeout)
                      .withFlowType(value: .PRESIGN_REQUEST)
                      .withExpiration(value: expiration)
                      .withIdentityResolver(value: config.awsCredentialIdentityResolver, schemeID: "aws.auth#sigv4")
                      .withIdentityResolver(value: config.awsCredentialIdentityResolver, schemeID: "aws.auth#sigv4a")
                      .withRegion(value: config.region)
                      .withSigningName(value: "example-signing-name")
                      .withSigningRegion(value: config.signingRegion)
                      .build()
        var operation = ClientRuntime.OperationStack<GetFooInput, GetFooOutput>(id: "getFoo")
        operation.initializeStep.intercept(position: .after, middleware: ClientRuntime.URLPathMiddleware<GetFooInput, GetFooOutput>(GetFooInput.urlPathProvider(_:)))
        operation.initializeStep.intercept(position: .after, middleware: ClientRuntime.URLHostMiddleware<GetFooInput, GetFooOutput>())
        let endpointParams = EndpointParams()
        operation.buildStep.intercept(position: .before, middleware: EndpointResolverMiddleware<GetFooOutput>(endpointResolver: config.endpointResolver, endpointParams: endpointParams))
        operation.buildStep.intercept(position: .before, middleware: AWSClientRuntime.UserAgentMiddleware<GetFooInput, GetFooOutput>(metadata: AWSClientRuntime.AWSUserAgentMetadata.fromConfig(serviceID: serviceName, version: "1.0.0", config: config)))
        operation.buildStep.intercept(position: .before, middleware: ClientRuntime.AuthSchemeMiddleware<GetFooOutput>())
        operation.finalizeStep.intercept(position: .after, middleware: ClientRuntime.RetryMiddleware<ClientRuntime.DefaultRetryStrategy, AWSClientRuntime.AWSRetryErrorInfoProvider, GetFooOutput>(options: config.retryStrategyOptions))
        operation.finalizeStep.intercept(position: .before, middleware: ClientRuntime.SignerMiddleware<GetFooOutput>())
        operation.deserializeStep.intercept(position: .after, middleware: ClientRuntime.DeserializeMiddleware<GetFooOutput>(GetFooOutput.httpOutput(from:), GetFooOutputError.httpError(from:)))
        operation.deserializeStep.intercept(position: .after, middleware: ClientRuntime.LoggerMiddleware<GetFooInput, GetFooOutput>(clientLogMode: config.clientLogMode))
        let presignedRequestBuilder = try await operation.presignedRequest(context: context, input: input, output: GetFooOutput(), next: ClientRuntime.NoopHandler())
        guard let builtRequest = presignedRequestBuilder?.build() else {
            return nil
        }
        return builtRequest
    }
}
"""
        contents.shouldContainOnlyOnce(expectedContents)
    }
    @Test
    fun `002 presignable on postFooInput`() {
        val context = setupTests("awsrestjson1/presignable.smithy", "smithy.swift.traits#Example")
        val contents = TestUtils.getFileContents(context.manifest, "/Example/models/PostFooInput+Presigner.swift")
        contents.shouldSyntacticSanityCheck()
        val expectedContents = """
extension PostFooInput {
    public func presign(config: ExampleClient.ExampleClientConfiguration, expiration: Foundation.TimeInterval) async throws -> ClientRuntime.SdkHttpRequest? {
        let serviceName = "example"
        let input = self
        let context = ClientRuntime.HttpContextBuilder()
                      .withMethod(value: .post)
                      .withServiceName(value: serviceName)
                      .withOperation(value: "postFoo")
                      .withIdempotencyTokenGenerator(value: config.idempotencyTokenGenerator)
                      .withLogger(value: config.logger)
                      .withPartitionID(value: config.partitionID)
                      .withAuthSchemes(value: config.authSchemes ?? [])
                      .withAuthSchemeResolver(value: config.authSchemeResolver)
                      .withUnsignedPayloadTrait(value: false)
                      .withSocketTimeout(value: config.httpClientConfiguration.socketTimeout)
                      .withFlowType(value: .PRESIGN_REQUEST)
                      .withExpiration(value: expiration)
                      .withIdentityResolver(value: config.awsCredentialIdentityResolver, schemeID: "aws.auth#sigv4")
                      .withIdentityResolver(value: config.awsCredentialIdentityResolver, schemeID: "aws.auth#sigv4a")
                      .withRegion(value: config.region)
                      .withSigningName(value: "example-signing-name")
                      .withSigningRegion(value: config.signingRegion)
                      .build()
        var operation = ClientRuntime.OperationStack<PostFooInput, PostFooOutput>(id: "postFoo")
        operation.initializeStep.intercept(position: .after, middleware: ClientRuntime.URLPathMiddleware<PostFooInput, PostFooOutput>(PostFooInput.urlPathProvider(_:)))
        operation.initializeStep.intercept(position: .after, middleware: ClientRuntime.URLHostMiddleware<PostFooInput, PostFooOutput>())
        let endpointParams = EndpointParams()
        operation.buildStep.intercept(position: .before, middleware: EndpointResolverMiddleware<PostFooOutput>(endpointResolver: config.endpointResolver, endpointParams: endpointParams))
        operation.buildStep.intercept(position: .before, middleware: AWSClientRuntime.UserAgentMiddleware<PostFooInput, PostFooOutput>(metadata: AWSClientRuntime.AWSUserAgentMetadata.fromConfig(serviceID: serviceName, version: "1.0.0", config: config)))
        operation.buildStep.intercept(position: .before, middleware: ClientRuntime.AuthSchemeMiddleware<PostFooOutput>())
        operation.serializeStep.intercept(position: .after, middleware: ContentTypeMiddleware<PostFooInput, PostFooOutput>(contentType: "application/json"))
        operation.serializeStep.intercept(position: .after, middleware: ClientRuntime.BodyMiddleware<PostFooInput, PostFooOutput, SmithyJSON.Writer>(rootNodeInfo: "", inputWritingClosure: PostFooInput.write(value:to:)))
        operation.finalizeStep.intercept(position: .before, middleware: ClientRuntime.ContentLengthMiddleware<PostFooInput, PostFooOutput>())
        operation.finalizeStep.intercept(position: .after, middleware: ClientRuntime.RetryMiddleware<ClientRuntime.DefaultRetryStrategy, AWSClientRuntime.AWSRetryErrorInfoProvider, PostFooOutput>(options: config.retryStrategyOptions))
        operation.finalizeStep.intercept(position: .before, middleware: ClientRuntime.SignerMiddleware<PostFooOutput>())
        operation.deserializeStep.intercept(position: .after, middleware: ClientRuntime.DeserializeMiddleware<PostFooOutput>(PostFooOutput.httpOutput(from:), PostFooOutputError.httpError(from:)))
        operation.deserializeStep.intercept(position: .after, middleware: ClientRuntime.LoggerMiddleware<PostFooInput, PostFooOutput>(clientLogMode: config.clientLogMode))
        let presignedRequestBuilder = try await operation.presignedRequest(context: context, input: input, output: PostFooOutput(), next: ClientRuntime.NoopHandler())
        guard let builtRequest = presignedRequestBuilder?.build() else {
            return nil
        }
        return builtRequest
    }
}
"""
        contents.shouldContainOnlyOnce(expectedContents)
    }
    @Test
    fun `003 presignable on putFooInput`() {
        val context = setupTests("awsrestjson1/presignable.smithy", "smithy.swift.traits#Example")
        val contents = TestUtils.getFileContents(context.manifest, "/Example/models/PutFooInput+Presigner.swift")
        contents.shouldSyntacticSanityCheck()
        val expectedContents = """
extension PutFooInput {
    public func presign(config: ExampleClient.ExampleClientConfiguration, expiration: Foundation.TimeInterval) async throws -> ClientRuntime.SdkHttpRequest? {
        let serviceName = "example"
        let input = self
        let context = ClientRuntime.HttpContextBuilder()
                      .withMethod(value: .put)
                      .withServiceName(value: serviceName)
                      .withOperation(value: "putFoo")
                      .withIdempotencyTokenGenerator(value: config.idempotencyTokenGenerator)
                      .withLogger(value: config.logger)
                      .withPartitionID(value: config.partitionID)
                      .withAuthSchemes(value: config.authSchemes ?? [])
                      .withAuthSchemeResolver(value: config.authSchemeResolver)
                      .withUnsignedPayloadTrait(value: false)
                      .withSocketTimeout(value: config.httpClientConfiguration.socketTimeout)
                      .withFlowType(value: .PRESIGN_REQUEST)
                      .withExpiration(value: expiration)
                      .withIdentityResolver(value: config.awsCredentialIdentityResolver, schemeID: "aws.auth#sigv4")
                      .withIdentityResolver(value: config.awsCredentialIdentityResolver, schemeID: "aws.auth#sigv4a")
                      .withRegion(value: config.region)
                      .withSigningName(value: "example-signing-name")
                      .withSigningRegion(value: config.signingRegion)
                      .build()
        var operation = ClientRuntime.OperationStack<PutFooInput, PutFooOutput>(id: "putFoo")
        operation.initializeStep.intercept(position: .after, middleware: ClientRuntime.URLPathMiddleware<PutFooInput, PutFooOutput>(PutFooInput.urlPathProvider(_:)))
        operation.initializeStep.intercept(position: .after, middleware: ClientRuntime.URLHostMiddleware<PutFooInput, PutFooOutput>())
        let endpointParams = EndpointParams()
        operation.buildStep.intercept(position: .before, middleware: EndpointResolverMiddleware<PutFooOutput>(endpointResolver: config.endpointResolver, endpointParams: endpointParams))
        operation.buildStep.intercept(position: .before, middleware: AWSClientRuntime.UserAgentMiddleware<PutFooInput, PutFooOutput>(metadata: AWSClientRuntime.AWSUserAgentMetadata.fromConfig(serviceID: serviceName, version: "1.0.0", config: config)))
        operation.buildStep.intercept(position: .before, middleware: ClientRuntime.AuthSchemeMiddleware<PutFooOutput>())
        operation.serializeStep.intercept(position: .after, middleware: ContentTypeMiddleware<PutFooInput, PutFooOutput>(contentType: "application/json"))
        operation.serializeStep.intercept(position: .after, middleware: ClientRuntime.BodyMiddleware<PutFooInput, PutFooOutput, SmithyJSON.Writer>(rootNodeInfo: "", inputWritingClosure: PutFooInput.write(value:to:)))
        operation.finalizeStep.intercept(position: .before, middleware: ClientRuntime.ContentLengthMiddleware<PutFooInput, PutFooOutput>())
        operation.finalizeStep.intercept(position: .after, middleware: ClientRuntime.RetryMiddleware<ClientRuntime.DefaultRetryStrategy, AWSClientRuntime.AWSRetryErrorInfoProvider, PutFooOutput>(options: config.retryStrategyOptions))
        operation.finalizeStep.intercept(position: .before, middleware: ClientRuntime.SignerMiddleware<PutFooOutput>())
        operation.deserializeStep.intercept(position: .after, middleware: ClientRuntime.DeserializeMiddleware<PutFooOutput>(PutFooOutput.httpOutput(from:), PutFooOutputError.httpError(from:)))
        operation.deserializeStep.intercept(position: .after, middleware: ClientRuntime.LoggerMiddleware<PutFooInput, PutFooOutput>(clientLogMode: config.clientLogMode))
        let presignedRequestBuilder = try await operation.presignedRequest(context: context, input: input, output: PutFooOutput(), next: ClientRuntime.NoopHandler())
        guard let builtRequest = presignedRequestBuilder?.build() else {
            return nil
        }
        return builtRequest
    }
}
"""
        contents.shouldContainOnlyOnce(expectedContents)
    }
    @Test
    fun `004 presignable on S3`() {
        val context = setupTests("presign-urls-s3.smithy", "com.amazonaws.s3#AmazonS3")
        val contents = TestUtils.getFileContents(context.manifest, "/Example/models/PutObjectInput+Presigner.swift")
        contents.shouldSyntacticSanityCheck()
        val expectedContents = """
extension PutObjectInput {
    public func presign(config: S3Client.S3ClientConfiguration, expiration: Foundation.TimeInterval) async throws -> ClientRuntime.SdkHttpRequest? {
        let serviceName = "S3"
        let input = self
        let context = ClientRuntime.HttpContextBuilder()
                      .withMethod(value: .put)
                      .withServiceName(value: serviceName)
                      .withOperation(value: "putObject")
                      .withIdempotencyTokenGenerator(value: config.idempotencyTokenGenerator)
                      .withLogger(value: config.logger)
                      .withPartitionID(value: config.partitionID)
                      .withAuthSchemes(value: config.authSchemes ?? [])
                      .withAuthSchemeResolver(value: config.authSchemeResolver)
                      .withUnsignedPayloadTrait(value: false)
                      .withSocketTimeout(value: config.httpClientConfiguration.socketTimeout)
                      .withFlowType(value: .PRESIGN_REQUEST)
                      .withExpiration(value: expiration)
                      .withIdentityResolver(value: config.awsCredentialIdentityResolver, schemeID: "aws.auth#sigv4")
                      .withIdentityResolver(value: config.awsCredentialIdentityResolver, schemeID: "aws.auth#sigv4a")
                      .withRegion(value: config.region)
                      .withSigningName(value: "s3")
                      .withSigningRegion(value: config.signingRegion)
                      .build()
        var operation = ClientRuntime.OperationStack<PutObjectInput, PutObjectOutput>(id: "putObject")
        operation.initializeStep.intercept(position: .after, middleware: ClientRuntime.URLPathMiddleware<PutObjectInput, PutObjectOutput>(PutObjectInput.urlPathProvider(_:)))
        operation.initializeStep.intercept(position: .after, middleware: ClientRuntime.URLHostMiddleware<PutObjectInput, PutObjectOutput>())
        let endpointParams = EndpointParams()
        context.attributes.set(key: AttributeKey<EndpointParams>(name: "EndpointParams"), value: endpointParams)
        operation.buildStep.intercept(position: .before, middleware: EndpointResolverMiddleware<PutObjectOutput>(endpointResolver: config.endpointResolver, endpointParams: endpointParams))
        operation.buildStep.intercept(position: .before, middleware: AWSClientRuntime.UserAgentMiddleware<PutObjectInput, PutObjectOutput>(metadata: AWSClientRuntime.AWSUserAgentMetadata.fromConfig(serviceID: serviceName, version: "1.0.0", config: config)))
        operation.buildStep.intercept(position: .before, middleware: ClientRuntime.AuthSchemeMiddleware<PutObjectOutput>())
        operation.serializeStep.intercept(position: .after, middleware: ContentTypeMiddleware<PutObjectInput, PutObjectOutput>(contentType: "application/json"))
        operation.serializeStep.intercept(position: .after, middleware: ClientRuntime.BodyMiddleware<PutObjectInput, PutObjectOutput, SmithyXML.Writer>(rootNodeInfo: "PutObjectInput", inputWritingClosure: PutObjectInput.write(value:to:)))
        operation.finalizeStep.intercept(position: .before, middleware: ClientRuntime.ContentLengthMiddleware<PutObjectInput, PutObjectOutput>())
        operation.finalizeStep.intercept(position: .after, middleware: ClientRuntime.RetryMiddleware<ClientRuntime.DefaultRetryStrategy, AWSClientRuntime.AWSRetryErrorInfoProvider, PutObjectOutput>(options: config.retryStrategyOptions))
        operation.finalizeStep.intercept(position: .before, middleware: ClientRuntime.SignerMiddleware<PutObjectOutput>())
        operation.deserializeStep.intercept(position: .after, middleware: ClientRuntime.DeserializeMiddleware<PutObjectOutput>(PutObjectOutput.httpOutput(from:), PutObjectOutputError.httpError(from:)))
        operation.deserializeStep.intercept(position: .after, middleware: ClientRuntime.LoggerMiddleware<PutObjectInput, PutObjectOutput>(clientLogMode: config.clientLogMode))
        let presignedRequestBuilder = try await operation.presignedRequest(context: context, input: input, output: PutObjectOutput(), next: ClientRuntime.NoopHandler())
        guard let builtRequest = presignedRequestBuilder?.build() else {
            return nil
        }
        return builtRequest
    }
}
"""
        contents.shouldContainOnlyOnce(expectedContents)
    }
    private fun setupTests(smithyFile: String, serviceShapeId: String): TestContext {
        val context = TestUtils.executeDirectedCodegen(smithyFile, serviceShapeId, RestJson1Trait.ID)
        val presigner = PresignerGenerator()
        val generator = AWSRestJson1ProtocolGenerator()
        val codegenContext = GenerationContext(context.ctx.model, context.ctx.symbolProvider, context.ctx.settings, context.manifest, generator)
        val protocolGenerationContext = ProtocolGenerator.GenerationContext(context.ctx.settings, context.ctx.model, context.ctx.service, context.ctx.symbolProvider, listOf(), RestJson1Trait.ID, context.ctx.delegator)
        codegenContext.protocolGenerator?.initializeMiddleware(context.ctx)
        presigner.writeAdditionalFiles(codegenContext, protocolGenerationContext, context.ctx.delegator)
        context.ctx.delegator.flushWriters()
        return context
    }
}
