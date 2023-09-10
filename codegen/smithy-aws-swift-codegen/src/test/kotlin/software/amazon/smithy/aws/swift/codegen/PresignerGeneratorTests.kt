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
                                  .withCredentialsProvider(value: config.credentialsProvider)
                                  .withRegion(value: config.region)
                                  .withSigningName(value: "example-signing-name")
                                  .withSigningRegion(value: config.signingRegion)
                                  .build()
                    var operation = ClientRuntime.OperationStack<GetFooInput, GetFooOutputResponse, GetFooOutputError>(id: "getFoo")
                    operation.initializeStep.intercept(position: .after, middleware: ClientRuntime.URLPathMiddleware<GetFooInput, GetFooOutputResponse, GetFooOutputError>())
                    operation.initializeStep.intercept(position: .after, middleware: ClientRuntime.URLHostMiddleware<GetFooInput, GetFooOutputResponse>())
                    let endpointParams = EndpointParams()
                    operation.buildStep.intercept(position: .before, middleware: EndpointResolverMiddleware<GetFooOutputResponse, GetFooOutputError>(endpointResolver: config.serviceSpecific.endpointResolver, endpointParams: endpointParams))
                    operation.buildStep.intercept(position: .before, middleware: AWSClientRuntime.UserAgentMiddleware(metadata: AWSClientRuntime.AWSUserAgentMetadata.fromConfig(serviceID: serviceName, version: "1.0.0", config: config)))
                    operation.finalizeStep.intercept(position: .after, middleware: ClientRuntime.RetryMiddleware<ClientRuntime.DefaultRetryStrategy, AWSClientRuntime.AWSRetryErrorInfoProvider, GetFooOutputResponse, GetFooOutputError>(options: config.retryStrategyOptions))
                    let sigv4Config = AWSClientRuntime.SigV4Config(expiration: expiration, unsignedBody: false, signingAlgorithm: .sigv4)
                    operation.finalizeStep.intercept(position: .before, middleware: AWSClientRuntime.SigV4Middleware<GetFooOutputResponse, GetFooOutputError>(config: sigv4Config))
                    operation.deserializeStep.intercept(position: .after, middleware: ClientRuntime.DeserializeMiddleware<GetFooOutputResponse, GetFooOutputError>())
                    operation.deserializeStep.intercept(position: .after, middleware: ClientRuntime.LoggerMiddleware<GetFooOutputResponse, GetFooOutputError>(clientLogMode: config.clientLogMode))
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
                                  .withCredentialsProvider(value: config.credentialsProvider)
                                  .withRegion(value: config.region)
                                  .withSigningName(value: "example-signing-name")
                                  .withSigningRegion(value: config.signingRegion)
                                  .build()
                    var operation = ClientRuntime.OperationStack<PostFooInput, PostFooOutputResponse, PostFooOutputError>(id: "postFoo")
                    operation.initializeStep.intercept(position: .after, middleware: ClientRuntime.URLPathMiddleware<PostFooInput, PostFooOutputResponse, PostFooOutputError>())
                    operation.initializeStep.intercept(position: .after, middleware: ClientRuntime.URLHostMiddleware<PostFooInput, PostFooOutputResponse>())
                    let endpointParams = EndpointParams()
                    operation.buildStep.intercept(position: .before, middleware: EndpointResolverMiddleware<PostFooOutputResponse, PostFooOutputError>(endpointResolver: config.serviceSpecific.endpointResolver, endpointParams: endpointParams))
                    operation.buildStep.intercept(position: .before, middleware: AWSClientRuntime.UserAgentMiddleware(metadata: AWSClientRuntime.AWSUserAgentMetadata.fromConfig(serviceID: serviceName, version: "1.0.0", config: config)))
                    operation.serializeStep.intercept(position: .after, middleware: ContentTypeMiddleware<PostFooInput, PostFooOutputResponse>(contentType: "application/json"))
                    operation.serializeStep.intercept(position: .after, middleware: ClientRuntime.SerializableBodyMiddleware<PostFooInput, PostFooOutputResponse>(xmlName: "GetFooInput"))
                    operation.finalizeStep.intercept(position: .before, middleware: ClientRuntime.ContentLengthMiddleware())
                    operation.finalizeStep.intercept(position: .after, middleware: ClientRuntime.RetryMiddleware<ClientRuntime.DefaultRetryStrategy, AWSClientRuntime.AWSRetryErrorInfoProvider, PostFooOutputResponse, PostFooOutputError>(options: config.retryStrategyOptions))
                    let sigv4Config = AWSClientRuntime.SigV4Config(expiration: expiration, unsignedBody: false, signingAlgorithm: .sigv4)
                    operation.finalizeStep.intercept(position: .before, middleware: AWSClientRuntime.SigV4Middleware<PostFooOutputResponse, PostFooOutputError>(config: sigv4Config))
                    operation.deserializeStep.intercept(position: .after, middleware: ClientRuntime.DeserializeMiddleware<PostFooOutputResponse, PostFooOutputError>())
                    operation.deserializeStep.intercept(position: .after, middleware: ClientRuntime.LoggerMiddleware<PostFooOutputResponse, PostFooOutputError>(clientLogMode: config.clientLogMode))
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
                                  .withCredentialsProvider(value: config.credentialsProvider)
                                  .withRegion(value: config.region)
                                  .withSigningName(value: "example-signing-name")
                                  .withSigningRegion(value: config.signingRegion)
                                  .build()
                    var operation = ClientRuntime.OperationStack<PutFooInput, PutFooOutputResponse, PutFooOutputError>(id: "putFoo")
                    operation.initializeStep.intercept(position: .after, middleware: ClientRuntime.URLPathMiddleware<PutFooInput, PutFooOutputResponse, PutFooOutputError>())
                    operation.initializeStep.intercept(position: .after, middleware: ClientRuntime.URLHostMiddleware<PutFooInput, PutFooOutputResponse>())
                    let endpointParams = EndpointParams()
                    operation.buildStep.intercept(position: .before, middleware: EndpointResolverMiddleware<PutFooOutputResponse, PutFooOutputError>(endpointResolver: config.serviceSpecific.endpointResolver, endpointParams: endpointParams))
                    operation.buildStep.intercept(position: .before, middleware: AWSClientRuntime.UserAgentMiddleware(metadata: AWSClientRuntime.AWSUserAgentMetadata.fromConfig(serviceID: serviceName, version: "1.0.0", config: config)))
                    operation.serializeStep.intercept(position: .after, middleware: ContentTypeMiddleware<PutFooInput, PutFooOutputResponse>(contentType: "application/json"))
                    operation.serializeStep.intercept(position: .after, middleware: ClientRuntime.SerializableBodyMiddleware<PutFooInput, PutFooOutputResponse>(xmlName: "GetFooInput"))
                    operation.finalizeStep.intercept(position: .before, middleware: ClientRuntime.ContentLengthMiddleware())
                    operation.finalizeStep.intercept(position: .after, middleware: ClientRuntime.RetryMiddleware<ClientRuntime.DefaultRetryStrategy, AWSClientRuntime.AWSRetryErrorInfoProvider, PutFooOutputResponse, PutFooOutputError>(options: config.retryStrategyOptions))
                    let sigv4Config = AWSClientRuntime.SigV4Config(expiration: expiration, unsignedBody: false, signingAlgorithm: .sigv4)
                    operation.finalizeStep.intercept(position: .before, middleware: AWSClientRuntime.SigV4Middleware<PutFooOutputResponse, PutFooOutputError>(config: sigv4Config))
                    operation.deserializeStep.intercept(position: .after, middleware: ClientRuntime.DeserializeMiddleware<PutFooOutputResponse, PutFooOutputError>())
                    operation.deserializeStep.intercept(position: .after, middleware: ClientRuntime.LoggerMiddleware<PutFooOutputResponse, PutFooOutputError>(clientLogMode: config.clientLogMode))
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
                                  .withCredentialsProvider(value: config.credentialsProvider)
                                  .withRegion(value: config.region)
                                  .withSigningName(value: "s3")
                                  .withSigningRegion(value: config.signingRegion)
                                  .build()
                    var operation = ClientRuntime.OperationStack<PutObjectInput, PutObjectOutputResponse, PutObjectOutputError>(id: "putObject")
                    operation.initializeStep.intercept(position: .after, middleware: ClientRuntime.URLPathMiddleware<PutObjectInput, PutObjectOutputResponse, PutObjectOutputError>())
                    operation.initializeStep.intercept(position: .after, middleware: ClientRuntime.URLHostMiddleware<PutObjectInput, PutObjectOutputResponse>())
                    let endpointParams = EndpointParams()
                    operation.buildStep.intercept(position: .before, middleware: EndpointResolverMiddleware<PutObjectOutputResponse, PutObjectOutputError>(endpointResolver: config.serviceSpecific.endpointResolver, endpointParams: endpointParams))
                    operation.buildStep.intercept(position: .before, middleware: AWSClientRuntime.UserAgentMiddleware(metadata: AWSClientRuntime.AWSUserAgentMetadata.fromConfig(serviceID: serviceName, version: "1.0.0", config: config)))
                    operation.serializeStep.intercept(position: .after, middleware: ContentTypeMiddleware<PutObjectInput, PutObjectOutputResponse>(contentType: "application/json"))
                    operation.serializeStep.intercept(position: .after, middleware: ClientRuntime.SerializableBodyMiddleware<PutObjectInput, PutObjectOutputResponse>(xmlName: "PutObjectInput"))
                    operation.finalizeStep.intercept(position: .before, middleware: ClientRuntime.ContentLengthMiddleware())
                    operation.finalizeStep.intercept(position: .after, middleware: ClientRuntime.RetryMiddleware<ClientRuntime.DefaultRetryStrategy, AWSClientRuntime.AWSRetryErrorInfoProvider, PutObjectOutputResponse, PutObjectOutputError>(options: config.retryStrategyOptions))
                    let sigv4Config = AWSClientRuntime.SigV4Config(useDoubleURIEncode: false, shouldNormalizeURIPath: false, expiration: expiration, signedBodyHeader: .contentSha256, unsignedBody: false, signingAlgorithm: .sigv4)
                    operation.finalizeStep.intercept(position: .before, middleware: AWSClientRuntime.SigV4Middleware<PutObjectOutputResponse, PutObjectOutputError>(config: sigv4Config))
                    operation.deserializeStep.intercept(position: .after, middleware: ClientRuntime.DeserializeMiddleware<PutObjectOutputResponse, PutObjectOutputError>())
                    operation.deserializeStep.intercept(position: .after, middleware: ClientRuntime.LoggerMiddleware<PutObjectOutputResponse, PutObjectOutputError>(clientLogMode: config.clientLogMode))
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
