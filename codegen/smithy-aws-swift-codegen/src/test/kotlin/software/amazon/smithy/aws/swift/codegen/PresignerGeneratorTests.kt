package software.amazon.smithy.aws.swift.codegen

import io.kotest.matchers.string.shouldContainOnlyOnce
import org.junit.jupiter.api.Test
import software.amazon.smithy.aws.swift.codegen.restjson.AWSRestJson1ProtocolGenerator
import software.amazon.smithy.aws.traits.protocols.RestJson1Trait
import software.amazon.smithy.swift.codegen.core.GenerationContext

class PresignerGeneratorTests {

    @Test
    fun `001 presignable on getFooInput`() {
        val context = setupTests("awsjson10/presignable.smithy", "smithy.swift.traits#Example")
        val contents = TestContextGenerator.getFileContents(context.manifest, "/Example/models/GetFooInput+Presigner.swift")
        contents.shouldSyntacticSanityCheck()
        val expectedContents =
            """
            import AWSClientRuntime
            import ClientRuntime
            import JSONRuntime
            
            extension GetFooInput {
                public func presign(config: AWSClientRuntime.AWSClientConfiguration, expiration: Swift.Int64) -> ClientRuntime.SdkHttpRequest? {
                    let serviceName = "Example"
                    let input = self
                    let encoder = JSONRuntime.JSONEncoder()
                    encoder.dateEncodingStrategy = .secondsSince1970
                    encoder.nonConformingFloatEncodingStrategy = .convertToString(positiveInfinity: "Infinity", negativeInfinity: "-Infinity", nan: "NaN")
                    let decoder = JSONRuntime.JSONDecoder()
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
                                  .withCredentialsProvider(value: config.credentialsProvider)
                                  .withRegion(value: config.region)
                                  .withSigningName(value: "example-signing-name")
                                  .withSigningRegion(value: config.signingRegion)
                    var operation = ClientRuntime.OperationStack<GetFooInput, GetFooOutputResponse, GetFooOutputError>(id: "getFoo")
                    operation.initializeStep.intercept(position: .after, middleware: GetFooInputURLPathMiddleware())
                    operation.initializeStep.intercept(position: .after, middleware: GetFooInputURLHostMiddleware())
                    operation.buildStep.intercept(position: .before, middleware: AWSClientRuntime.EndpointResolverMiddleware(endpointResolver: config.endpointResolver, serviceId: serviceName))
                    let apiMetadata = AWSClientRuntime.APIMetadata(serviceId: serviceName, version: "1.0.0")
                    operation.buildStep.intercept(position: .before, middleware: AWSClientRuntime.UserAgentMiddleware(metadata: AWSClientRuntime.AWSUserAgentMetadata.fromEnv(apiMetadata: apiMetadata, frameworkMetadata: config.frameworkMetadata)))
                    operation.serializeStep.intercept(position: .after, middleware: GetFooInputHeadersMiddleware())
                    operation.serializeStep.intercept(position: .after, middleware: GetFooInputQueryItemMiddleware())
                    operation.finalizeStep.intercept(position: .after, middleware: AWSClientRuntime.RetryerMiddleware(retryer: config.retryer))
                    let sigv4Config = AWSClientRuntime.SigV4Config(expiration: expiration, unsignedBody: false)
                    operation.finalizeStep.intercept(position: .before, middleware: AWSClientRuntime.SigV4Middleware(config: sigv4Config))
                    operation.deserializeStep.intercept(position: .before, middleware: ClientRuntime.LoggerMiddleware(clientLogMode: config.clientLogMode))
                    operation.deserializeStep.intercept(position: .after, middleware: ClientRuntime.DeserializeMiddleware())
                    let presignedRequestBuilder = operation.presignedRequest(context: context.build(), input: input, next: ClientRuntime.NoopHandler())
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
        val context = setupTests("awsjson10/presignable.smithy", "smithy.swift.traits#Example")
        val contents = TestContextGenerator.getFileContents(context.manifest, "/Example/models/PostFooInput+Presigner.swift")
        contents.shouldSyntacticSanityCheck()
        val expectedContents =
            """
            import AWSClientRuntime
            import ClientRuntime
            import JSONRuntime
            
            extension PostFooInput {
                public func presign(config: AWSClientRuntime.AWSClientConfiguration, expiration: Swift.Int64) -> ClientRuntime.SdkHttpRequest? {
                    let serviceName = "Example"
                    let input = self
                    let encoder = JSONRuntime.JSONEncoder()
                    encoder.dateEncodingStrategy = .secondsSince1970
                    encoder.nonConformingFloatEncodingStrategy = .convertToString(positiveInfinity: "Infinity", negativeInfinity: "-Infinity", nan: "NaN")
                    let decoder = JSONRuntime.JSONDecoder()
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
                                  .withCredentialsProvider(value: config.credentialsProvider)
                                  .withRegion(value: config.region)
                                  .withSigningName(value: "example-signing-name")
                                  .withSigningRegion(value: config.signingRegion)
                    var operation = ClientRuntime.OperationStack<PostFooInput, PostFooOutputResponse, PostFooOutputError>(id: "postFoo")
                    operation.initializeStep.intercept(position: .after, middleware: PostFooInputURLPathMiddleware())
                    operation.initializeStep.intercept(position: .after, middleware: PostFooInputURLHostMiddleware())
                    operation.buildStep.intercept(position: .before, middleware: AWSClientRuntime.EndpointResolverMiddleware(endpointResolver: config.endpointResolver, serviceId: serviceName))
                    let apiMetadata = AWSClientRuntime.APIMetadata(serviceId: serviceName, version: "1.0.0")
                    operation.buildStep.intercept(position: .before, middleware: AWSClientRuntime.UserAgentMiddleware(metadata: AWSClientRuntime.AWSUserAgentMetadata.fromEnv(apiMetadata: apiMetadata, frameworkMetadata: config.frameworkMetadata)))
                    operation.serializeStep.intercept(position: .after, middleware: PostFooInputHeadersMiddleware())
                    operation.serializeStep.intercept(position: .after, middleware: PostFooInputQueryItemMiddleware())
                    operation.serializeStep.intercept(position: .after, middleware: ContentTypeMiddleware<PostFooInput, PostFooOutputResponse, PostFooOutputError>(contentType: "application/json"))
                    operation.serializeStep.intercept(position: .after, middleware: PostFooInputBodyMiddleware())
                    operation.finalizeStep.intercept(position: .before, middleware: ClientRuntime.ContentLengthMiddleware())
                    operation.finalizeStep.intercept(position: .after, middleware: AWSClientRuntime.RetryerMiddleware(retryer: config.retryer))
                    let sigv4Config = AWSClientRuntime.SigV4Config(expiration: expiration, unsignedBody: false)
                    operation.finalizeStep.intercept(position: .before, middleware: AWSClientRuntime.SigV4Middleware(config: sigv4Config))
                    operation.deserializeStep.intercept(position: .before, middleware: ClientRuntime.LoggerMiddleware(clientLogMode: config.clientLogMode))
                    operation.deserializeStep.intercept(position: .after, middleware: ClientRuntime.DeserializeMiddleware())
                    let presignedRequestBuilder = operation.presignedRequest(context: context.build(), input: input, next: ClientRuntime.NoopHandler())
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
        val context = setupTests("awsjson10/presignable.smithy", "smithy.swift.traits#Example")
        val contents = TestContextGenerator.getFileContents(context.manifest, "/Example/models/PutFooInput+Presigner.swift")
        contents.shouldSyntacticSanityCheck()
        val expectedContents =
            """
            import AWSClientRuntime
            import ClientRuntime
            import JSONRuntime
            
            extension PutFooInput {
                public func presign(config: AWSClientRuntime.AWSClientConfiguration, expiration: Swift.Int64) -> ClientRuntime.SdkHttpRequest? {
                    let serviceName = "Example"
                    let input = self
                    let encoder = JSONRuntime.JSONEncoder()
                    encoder.dateEncodingStrategy = .secondsSince1970
                    encoder.nonConformingFloatEncodingStrategy = .convertToString(positiveInfinity: "Infinity", negativeInfinity: "-Infinity", nan: "NaN")
                    let decoder = JSONRuntime.JSONDecoder()
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
                                  .withCredentialsProvider(value: config.credentialsProvider)
                                  .withRegion(value: config.region)
                                  .withSigningName(value: "example-signing-name")
                                  .withSigningRegion(value: config.signingRegion)
                    var operation = ClientRuntime.OperationStack<PutFooInput, PutFooOutputResponse, PutFooOutputError>(id: "putFoo")
                    operation.initializeStep.intercept(position: .after, middleware: PutFooInputURLPathMiddleware())
                    operation.initializeStep.intercept(position: .after, middleware: PutFooInputURLHostMiddleware())
                    operation.buildStep.intercept(position: .before, middleware: AWSClientRuntime.EndpointResolverMiddleware(endpointResolver: config.endpointResolver, serviceId: serviceName))
                    let apiMetadata = AWSClientRuntime.APIMetadata(serviceId: serviceName, version: "1.0.0")
                    operation.buildStep.intercept(position: .before, middleware: AWSClientRuntime.UserAgentMiddleware(metadata: AWSClientRuntime.AWSUserAgentMetadata.fromEnv(apiMetadata: apiMetadata, frameworkMetadata: config.frameworkMetadata)))
                    operation.serializeStep.intercept(position: .after, middleware: PutFooInputHeadersMiddleware())
                    operation.serializeStep.intercept(position: .after, middleware: PutFooInputQueryItemMiddleware())
                    operation.serializeStep.intercept(position: .after, middleware: ContentTypeMiddleware<PutFooInput, PutFooOutputResponse, PutFooOutputError>(contentType: "application/json"))
                    operation.serializeStep.intercept(position: .after, middleware: PutFooInputBodyMiddleware())
                    operation.finalizeStep.intercept(position: .before, middleware: ClientRuntime.ContentLengthMiddleware())
                    operation.finalizeStep.intercept(position: .after, middleware: AWSClientRuntime.RetryerMiddleware(retryer: config.retryer))
                    let sigv4Config = AWSClientRuntime.SigV4Config(expiration: expiration, unsignedBody: false)
                    operation.finalizeStep.intercept(position: .before, middleware: AWSClientRuntime.SigV4Middleware(config: sigv4Config))
                    operation.deserializeStep.intercept(position: .before, middleware: ClientRuntime.LoggerMiddleware(clientLogMode: config.clientLogMode))
                    operation.deserializeStep.intercept(position: .after, middleware: ClientRuntime.DeserializeMiddleware())
                    let presignedRequestBuilder = operation.presignedRequest(context: context.build(), input: input, next: ClientRuntime.NoopHandler())
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
        val context = TestContextGenerator.initContextFrom(smithyFile, serviceShapeId, RestJson1Trait.ID, "example", "example")
        val presigner = PresignerGenerator()
        val generator = AWSRestJson1ProtocolGenerator()

        val codegenContext = GenerationContext(context.ctx.model, context.ctx.symbolProvider, context.ctx.settings, generator)
        codegenContext.protocolGenerator?.initializeMiddleware(context.ctx)
        presigner.writeAdditionalFiles(codegenContext, context.ctx.delegator)
        context.ctx.delegator.flushWriters()
        return context
    }
}
