package software.amazon.smithy.aws.swift.codegen

import io.kotest.matchers.string.shouldContainOnlyOnce
import org.junit.jupiter.api.Test
import software.amazon.smithy.aws.swift.codegen.restjson.AWSRestJson1ProtocolGenerator
import software.amazon.smithy.aws.traits.protocols.RestJson1Trait
import software.amazon.smithy.swift.codegen.core.GenerationContext
import software.amazon.smithy.swift.codegen.integration.ProtocolGenerator

class PresignerGeneratorTests {

    @Test
    fun `001 presignable on getFooInput`() {
        val context = setupTests("awsrestjson1/presignable.smithy", "smithy.swift.traits#Example")
        val contents = TestContextGenerator.getFileContents(context.manifest, "/Example/models/GetFooInput+Presigner.swift")
        contents.shouldSyntacticSanityCheck()
        val expectedContents =
            """
            import AWSClientRuntime
            import ClientRuntime
            import typealias Foundation.TimeInterval
            
            extension GetFooInput {
                public func presign(config: ExampleClient.ExampleClientConfiguration, expiration: Foundation.TimeInterval) async throws -> ClientRuntime.SdkHttpRequest? {
                    let serviceName = "example"
                    let input = self
                    let encoder = ClientRuntime.JSONEncoder()
                    encoder.dateEncodingStrategy = .secondsSince1970
                    encoder.nonConformingFloatEncodingStrategy = .convertToString(positiveInfinity: "Infinity", negativeInfinity: "-Infinity", nan: "NaN")
                    let decoder = ClientRuntime.JSONDecoder()
                    decoder.dateDecodingStrategy = .secondsSince1970
                    decoder.nonConformingFloatDecodingStrategy = .convertFromString(positiveInfinity: "Infinity", negativeInfinity: "-Infinity", nan: "NaN")
                    let context = ClientRuntime.HttpContextBuilder()
                                  .withEncoder(value: encoder)
                                  .withDecoder(value: decoder)
                                  .withMethod(value: .get)
                                  .withServiceName(value: serviceName)
                                  .withOperation(value: "getFoo")
                                  .withIdempotencyTokenGenerator(value: config.idempotencyTokenGenerator)
                                  .withLogger(value: config.logger)
                                  .withPartitionID(value: config.partitionID)
                                  .withAuthSchemes(value: config.serviceSpecific.authSchemes)
                                  .withAuthSchemeResolver(value: config.serviceSpecific.authSchemeResolver)
                                  .withCredentialsProvider(value: config.credentialsProvider)
                                  .withIdentityResolver(value: config.credentialsProvider, type: IdentityKind.aws)
                                  .withRegion(value: config.region)
                                  .withSigningName(value: "example-signing-name")
                                  .withSigningRegion(value: config.signingRegion)
                                  .build()
                    var operation = ClientRuntime.OperationStack<GetFooInput, GetFooOutput, GetFooOutputError>(id: "getFoo")
                    operation.initializeStep.intercept(position: .after, middleware: ClientRuntime.URLPathMiddleware<GetFooInput, GetFooOutput, GetFooOutputError>())
                    operation.initializeStep.intercept(position: .after, middleware: ClientRuntime.URLHostMiddleware<GetFooInput, GetFooOutput>())
                    let endpointParams = EndpointParams()
                    operation.buildStep.intercept(position: .before, middleware: EndpointResolverMiddleware<GetFooOutput, GetFooOutputError>(endpointResolver: config.serviceSpecific.endpointResolver, endpointParams: endpointParams))
                    operation.buildStep.intercept(position: .before, middleware: AWSClientRuntime.UserAgentMiddleware(metadata: AWSClientRuntime.AWSUserAgentMetadata.fromConfig(serviceID: serviceName, version: "1.0.0", config: config)))
                    operation.buildStep.intercept(position: .before, middleware: ClientRuntime.AuthSchemeMiddleware<GetFooOutput, GetFooOutputError>())
                    operation.finalizeStep.intercept(position: .after, middleware: ClientRuntime.RetryMiddleware<ClientRuntime.DefaultRetryStrategy, AWSClientRuntime.AWSRetryErrorInfoProvider, GetFooOutput, GetFooOutputError>(options: config.retryStrategyOptions))
                    operation.finalizeStep.intercept(position: .before, middleware: ClientRuntime.SignerMiddleware<GetFooOutput, GetFooOutputError>())
                    let sigv4Config = AWSClientRuntime.SigV4Config(expiration: expiration, unsignedBody: false, signingAlgorithm: .sigv4)
                    operation.finalizeStep.intercept(position: .before, middleware: AWSClientRuntime.SigV4Middleware<GetFooOutput, GetFooOutputError>(config: sigv4Config))
                    operation.deserializeStep.intercept(position: .after, middleware: ClientRuntime.DeserializeMiddleware<GetFooOutput, GetFooOutputError>())
                    operation.deserializeStep.intercept(position: .after, middleware: ClientRuntime.LoggerMiddleware<GetFooOutput, GetFooOutputError>(clientLogMode: config.clientLogMode))
                    let presignedRequestBuilder = try await operation.presignedRequest(context: context, input: input, next: ClientRuntime.NoopHandler())
                    guard let builtRequest = presignedRequestBuilder?.build() else {
                        return nil
                    }
                    return builtRequest
                }
            }
            """.trimIndent()
        contents.shouldContainOnlyOnce(expectedContents)
    }

    @Test
    fun `002 presignable on postFooInput`() {
        val context = setupTests("awsrestjson1/presignable.smithy", "smithy.swift.traits#Example")
        val contents = TestContextGenerator.getFileContents(context.manifest, "/Example/models/PostFooInput+Presigner.swift")
        contents.shouldSyntacticSanityCheck()
        val expectedContents =
            """
            import AWSClientRuntime
            import ClientRuntime
            import typealias Foundation.TimeInterval
            
            extension PostFooInput {
                public func presign(config: ExampleClient.ExampleClientConfiguration, expiration: Foundation.TimeInterval) async throws -> ClientRuntime.SdkHttpRequest? {
                    let serviceName = "example"
                    let input = self
                    let encoder = ClientRuntime.JSONEncoder()
                    encoder.dateEncodingStrategy = .secondsSince1970
                    encoder.nonConformingFloatEncodingStrategy = .convertToString(positiveInfinity: "Infinity", negativeInfinity: "-Infinity", nan: "NaN")
                    let decoder = ClientRuntime.JSONDecoder()
                    decoder.dateDecodingStrategy = .secondsSince1970
                    decoder.nonConformingFloatDecodingStrategy = .convertFromString(positiveInfinity: "Infinity", negativeInfinity: "-Infinity", nan: "NaN")
                    let context = ClientRuntime.HttpContextBuilder()
                                  .withEncoder(value: encoder)
                                  .withDecoder(value: decoder)
                                  .withMethod(value: .post)
                                  .withServiceName(value: serviceName)
                                  .withOperation(value: "postFoo")
                                  .withIdempotencyTokenGenerator(value: config.idempotencyTokenGenerator)
                                  .withLogger(value: config.logger)
                                  .withPartitionID(value: config.partitionID)
                                  .withAuthSchemes(value: config.serviceSpecific.authSchemes)
                                  .withAuthSchemeResolver(value: config.serviceSpecific.authSchemeResolver)
                                  .withCredentialsProvider(value: config.credentialsProvider)
                                  .withIdentityResolver(value: config.credentialsProvider, type: IdentityKind.aws)
                                  .withRegion(value: config.region)
                                  .withSigningName(value: "example-signing-name")
                                  .withSigningRegion(value: config.signingRegion)
                                  .build()
                    var operation = ClientRuntime.OperationStack<PostFooInput, PostFooOutput, PostFooOutputError>(id: "postFoo")
                    operation.initializeStep.intercept(position: .after, middleware: ClientRuntime.URLPathMiddleware<PostFooInput, PostFooOutput, PostFooOutputError>())
                    operation.initializeStep.intercept(position: .after, middleware: ClientRuntime.URLHostMiddleware<PostFooInput, PostFooOutput>())
                    let endpointParams = EndpointParams()
                    operation.buildStep.intercept(position: .before, middleware: EndpointResolverMiddleware<PostFooOutput, PostFooOutputError>(endpointResolver: config.serviceSpecific.endpointResolver, endpointParams: endpointParams))
                    operation.buildStep.intercept(position: .before, middleware: AWSClientRuntime.UserAgentMiddleware(metadata: AWSClientRuntime.AWSUserAgentMetadata.fromConfig(serviceID: serviceName, version: "1.0.0", config: config)))
                    operation.buildStep.intercept(position: .before, middleware: ClientRuntime.AuthSchemeMiddleware<PostFooOutput, PostFooOutputError>())
                    operation.serializeStep.intercept(position: .after, middleware: ContentTypeMiddleware<PostFooInput, PostFooOutput>(contentType: "application/json"))
                    operation.serializeStep.intercept(position: .after, middleware: ClientRuntime.SerializableBodyMiddleware<PostFooInput, PostFooOutput>(xmlName: "GetFooInput"))
                    operation.finalizeStep.intercept(position: .before, middleware: ClientRuntime.ContentLengthMiddleware())
                    operation.finalizeStep.intercept(position: .after, middleware: ClientRuntime.RetryMiddleware<ClientRuntime.DefaultRetryStrategy, AWSClientRuntime.AWSRetryErrorInfoProvider, PostFooOutput, PostFooOutputError>(options: config.retryStrategyOptions))
                    operation.finalizeStep.intercept(position: .before, middleware: ClientRuntime.SignerMiddleware<PostFooOutput, PostFooOutputError>())
                    let sigv4Config = AWSClientRuntime.SigV4Config(expiration: expiration, unsignedBody: false, signingAlgorithm: .sigv4)
                    operation.finalizeStep.intercept(position: .before, middleware: AWSClientRuntime.SigV4Middleware<PostFooOutput, PostFooOutputError>(config: sigv4Config))
                    operation.deserializeStep.intercept(position: .after, middleware: ClientRuntime.DeserializeMiddleware<PostFooOutput, PostFooOutputError>())
                    operation.deserializeStep.intercept(position: .after, middleware: ClientRuntime.LoggerMiddleware<PostFooOutput, PostFooOutputError>(clientLogMode: config.clientLogMode))
                    let presignedRequestBuilder = try await operation.presignedRequest(context: context, input: input, next: ClientRuntime.NoopHandler())
                    guard let builtRequest = presignedRequestBuilder?.build() else {
                        return nil
                    }
                    return builtRequest
                }
            }
            """.trimIndent()
        contents.shouldContainOnlyOnce(expectedContents)
    }

    @Test
    fun `003 presignable on putFooInput`() {
        val context = setupTests("awsrestjson1/presignable.smithy", "smithy.swift.traits#Example")
        val contents = TestContextGenerator.getFileContents(context.manifest, "/Example/models/PutFooInput+Presigner.swift")
        contents.shouldSyntacticSanityCheck()
        val expectedContents =
            """
            import AWSClientRuntime
            import ClientRuntime
            import typealias Foundation.TimeInterval
            
            extension PutFooInput {
                public func presign(config: ExampleClient.ExampleClientConfiguration, expiration: Foundation.TimeInterval) async throws -> ClientRuntime.SdkHttpRequest? {
                    let serviceName = "example"
                    let input = self
                    let encoder = ClientRuntime.JSONEncoder()
                    encoder.dateEncodingStrategy = .secondsSince1970
                    encoder.nonConformingFloatEncodingStrategy = .convertToString(positiveInfinity: "Infinity", negativeInfinity: "-Infinity", nan: "NaN")
                    let decoder = ClientRuntime.JSONDecoder()
                    decoder.dateDecodingStrategy = .secondsSince1970
                    decoder.nonConformingFloatDecodingStrategy = .convertFromString(positiveInfinity: "Infinity", negativeInfinity: "-Infinity", nan: "NaN")
                    let context = ClientRuntime.HttpContextBuilder()
                                  .withEncoder(value: encoder)
                                  .withDecoder(value: decoder)
                                  .withMethod(value: .put)
                                  .withServiceName(value: serviceName)
                                  .withOperation(value: "putFoo")
                                  .withIdempotencyTokenGenerator(value: config.idempotencyTokenGenerator)
                                  .withLogger(value: config.logger)
                                  .withPartitionID(value: config.partitionID)
                                  .withAuthSchemes(value: config.serviceSpecific.authSchemes)
                                  .withAuthSchemeResolver(value: config.serviceSpecific.authSchemeResolver)
                                  .withCredentialsProvider(value: config.credentialsProvider)
                                  .withIdentityResolver(value: config.credentialsProvider, type: IdentityKind.aws)
                                  .withRegion(value: config.region)
                                  .withSigningName(value: "example-signing-name")
                                  .withSigningRegion(value: config.signingRegion)
                                  .build()
                    var operation = ClientRuntime.OperationStack<PutFooInput, PutFooOutput, PutFooOutputError>(id: "putFoo")
                    operation.initializeStep.intercept(position: .after, middleware: ClientRuntime.URLPathMiddleware<PutFooInput, PutFooOutput, PutFooOutputError>())
                    operation.initializeStep.intercept(position: .after, middleware: ClientRuntime.URLHostMiddleware<PutFooInput, PutFooOutput>())
                    let endpointParams = EndpointParams()
                    operation.buildStep.intercept(position: .before, middleware: EndpointResolverMiddleware<PutFooOutput, PutFooOutputError>(endpointResolver: config.serviceSpecific.endpointResolver, endpointParams: endpointParams))
                    operation.buildStep.intercept(position: .before, middleware: AWSClientRuntime.UserAgentMiddleware(metadata: AWSClientRuntime.AWSUserAgentMetadata.fromConfig(serviceID: serviceName, version: "1.0.0", config: config)))
                    operation.buildStep.intercept(position: .before, middleware: ClientRuntime.AuthSchemeMiddleware<PutFooOutput, PutFooOutputError>())
                    operation.serializeStep.intercept(position: .after, middleware: ContentTypeMiddleware<PutFooInput, PutFooOutput>(contentType: "application/json"))
                    operation.serializeStep.intercept(position: .after, middleware: ClientRuntime.SerializableBodyMiddleware<PutFooInput, PutFooOutput>(xmlName: "GetFooInput"))
                    operation.finalizeStep.intercept(position: .before, middleware: ClientRuntime.ContentLengthMiddleware())
                    operation.finalizeStep.intercept(position: .after, middleware: ClientRuntime.RetryMiddleware<ClientRuntime.DefaultRetryStrategy, AWSClientRuntime.AWSRetryErrorInfoProvider, PutFooOutput, PutFooOutputError>(options: config.retryStrategyOptions))
                    operation.finalizeStep.intercept(position: .before, middleware: ClientRuntime.SignerMiddleware<PutFooOutput, PutFooOutputError>())
                    let sigv4Config = AWSClientRuntime.SigV4Config(expiration: expiration, unsignedBody: false, signingAlgorithm: .sigv4)
                    operation.finalizeStep.intercept(position: .before, middleware: AWSClientRuntime.SigV4Middleware<PutFooOutput, PutFooOutputError>(config: sigv4Config))
                    operation.deserializeStep.intercept(position: .after, middleware: ClientRuntime.DeserializeMiddleware<PutFooOutput, PutFooOutputError>())
                    operation.deserializeStep.intercept(position: .after, middleware: ClientRuntime.LoggerMiddleware<PutFooOutput, PutFooOutputError>(clientLogMode: config.clientLogMode))
                    let presignedRequestBuilder = try await operation.presignedRequest(context: context, input: input, next: ClientRuntime.NoopHandler())
                    guard let builtRequest = presignedRequestBuilder?.build() else {
                        return nil
                    }
                    return builtRequest
                }
            }
            """.trimIndent()
        contents.shouldContainOnlyOnce(expectedContents)
    }

    @Test
    fun `004 presignable on S3`() {
        val context = setupTests("presign-urls-s3.smithy", "com.amazonaws.s3#AmazonS3")
        val contents = TestContextGenerator.getFileContents(context.manifest, "/Example/models/PutObjectInput+Presigner.swift")
        contents.shouldSyntacticSanityCheck()
        val expectedContents =
            """
            import AWSClientRuntime
            import ClientRuntime
            import typealias Foundation.TimeInterval
            
            extension PutObjectInput {
                public func presign(config: S3Client.S3ClientConfiguration, expiration: Foundation.TimeInterval) async throws -> ClientRuntime.SdkHttpRequest? {
                    let serviceName = "S3"
                    let input = self
                    let encoder = ClientRuntime.JSONEncoder()
                    encoder.dateEncodingStrategy = .secondsSince1970
                    encoder.nonConformingFloatEncodingStrategy = .convertToString(positiveInfinity: "Infinity", negativeInfinity: "-Infinity", nan: "NaN")
                    let decoder = ClientRuntime.JSONDecoder()
                    decoder.dateDecodingStrategy = .secondsSince1970
                    decoder.nonConformingFloatDecodingStrategy = .convertFromString(positiveInfinity: "Infinity", negativeInfinity: "-Infinity", nan: "NaN")
                    let context = ClientRuntime.HttpContextBuilder()
                                  .withEncoder(value: encoder)
                                  .withDecoder(value: decoder)
                                  .withMethod(value: .put)
                                  .withServiceName(value: serviceName)
                                  .withOperation(value: "putObject")
                                  .withIdempotencyTokenGenerator(value: config.idempotencyTokenGenerator)
                                  .withLogger(value: config.logger)
                                  .withPartitionID(value: config.partitionID)
                                  .withAuthSchemes(value: config.serviceSpecific.authSchemes)
                                  .withAuthSchemeResolver(value: config.serviceSpecific.authSchemeResolver)
                                  .withCredentialsProvider(value: config.credentialsProvider)
                                  .withIdentityResolver(value: config.credentialsProvider, type: IdentityKind.aws)
                                  .withRegion(value: config.region)
                                  .withSigningName(value: "s3")
                                  .withSigningRegion(value: config.signingRegion)
                                  .build()
                    var operation = ClientRuntime.OperationStack<PutObjectInput, PutObjectOutput, PutObjectOutputError>(id: "putObject")
                    operation.initializeStep.intercept(position: .after, middleware: ClientRuntime.URLPathMiddleware<PutObjectInput, PutObjectOutput, PutObjectOutputError>())
                    operation.initializeStep.intercept(position: .after, middleware: ClientRuntime.URLHostMiddleware<PutObjectInput, PutObjectOutput>())
                    let endpointParams = EndpointParams()
                    operation.buildStep.intercept(position: .before, middleware: EndpointResolverMiddleware<PutObjectOutput, PutObjectOutputError>(endpointResolver: config.serviceSpecific.endpointResolver, endpointParams: endpointParams))
                    operation.buildStep.intercept(position: .before, middleware: AWSClientRuntime.UserAgentMiddleware(metadata: AWSClientRuntime.AWSUserAgentMetadata.fromConfig(serviceID: serviceName, version: "1.0.0", config: config)))
                    operation.buildStep.intercept(position: .before, middleware: ClientRuntime.AuthSchemeMiddleware<PutObjectOutput, PutObjectOutputError>())
                    operation.serializeStep.intercept(position: .after, middleware: ContentTypeMiddleware<PutObjectInput, PutObjectOutput>(contentType: "application/json"))
                    operation.serializeStep.intercept(position: .after, middleware: ClientRuntime.SerializableBodyMiddleware<PutObjectInput, PutObjectOutput>(xmlName: "PutObjectInput"))
                    operation.finalizeStep.intercept(position: .before, middleware: ClientRuntime.ContentLengthMiddleware())
                    operation.finalizeStep.intercept(position: .after, middleware: ClientRuntime.RetryMiddleware<ClientRuntime.DefaultRetryStrategy, AWSClientRuntime.AWSRetryErrorInfoProvider, PutObjectOutput, PutObjectOutputError>(options: config.retryStrategyOptions))
                    operation.finalizeStep.intercept(position: .before, middleware: ClientRuntime.SignerMiddleware<PutObjectOutput, PutObjectOutputError>())
                    let sigv4Config = AWSClientRuntime.SigV4Config(useDoubleURIEncode: false, shouldNormalizeURIPath: false, expiration: expiration, signedBodyHeader: .contentSha256, unsignedBody: false, signingAlgorithm: .sigv4)
                    operation.finalizeStep.intercept(position: .before, middleware: AWSClientRuntime.SigV4Middleware<PutObjectOutput, PutObjectOutputError>(config: sigv4Config))
                    operation.deserializeStep.intercept(position: .after, middleware: ClientRuntime.DeserializeMiddleware<PutObjectOutput, PutObjectOutputError>())
                    operation.deserializeStep.intercept(position: .after, middleware: ClientRuntime.LoggerMiddleware<PutObjectOutput, PutObjectOutputError>(clientLogMode: config.clientLogMode))
                    let presignedRequestBuilder = try await operation.presignedRequest(context: context, input: input, next: ClientRuntime.NoopHandler())
                    guard let builtRequest = presignedRequestBuilder?.build() else {
                        return nil
                    }
                    return builtRequest
                }
            }
            """.trimIndent()
        contents.shouldContainOnlyOnce(expectedContents)
    }

    private fun setupTests(smithyFile: String, serviceShapeId: String): TestContext {
        val context = TestContextGenerator.initContextFrom(smithyFile, serviceShapeId, RestJson1Trait.ID)
        val presigner = PresignerGenerator()
        val generator = AWSRestJson1ProtocolGenerator()

        val codegenContext = GenerationContext(context.ctx.model, context.ctx.symbolProvider, context.ctx.settings, generator)
        val protocolGenerationContext = ProtocolGenerator.GenerationContext(context.ctx.settings, context.ctx.model, context.ctx.service, context.ctx.symbolProvider, listOf(), RestJson1Trait.ID, context.ctx.delegator)
        codegenContext.protocolGenerator?.initializeMiddleware(context.ctx)
        presigner.writeAdditionalFiles(codegenContext, protocolGenerationContext, context.ctx.delegator)
        context.ctx.delegator.flushWriters()
        return context
    }
}
