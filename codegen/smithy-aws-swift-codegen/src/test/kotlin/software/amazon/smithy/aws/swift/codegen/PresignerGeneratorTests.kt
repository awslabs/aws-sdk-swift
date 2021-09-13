package software.amazon.smithy.aws.swift.codegen

import io.kotest.matchers.string.shouldContainOnlyOnce
import org.junit.jupiter.api.Test
import software.amazon.smithy.aws.swift.codegen.TestContextGenerator.Companion.listFilesFromManifest
import software.amazon.smithy.aws.swift.codegen.restjson.AWSRestJson1ProtocolGenerator
import software.amazon.smithy.aws.traits.protocols.RestJson1Trait
import software.amazon.smithy.swift.codegen.core.GenerationContext

class PresignerGeneratorTests {

    @Test
    fun `001 presignable on input type`() {
        val context = setupTests("awsjson10/presignable.smithy", "smithy.swift.traits#Example")
        print(listFilesFromManifest(context.manifest))

        val contents = TestContextGenerator.getFileContents(context.manifest, "/Example/models/GetFooInput+Presigner.swift")
        contents.shouldSyntacticSanityCheck()
        val expectedContents =
            """
            import AWSClientRuntime
            import ClientRuntime
            
            extension GetFooInput {
                func presign(config: AWSClientRuntime.AWSClientConfiguration) -> ClientRuntime.SdkHttpRequest? {
                    let serviceName = "Example"
                    let input = self
                    let encoder = ClientRuntime.JSONEncoder()
                    encoder.dateEncodingStrategy = .secondsSince1970
                    encoder.nonConformingFloatEncodingStrategy = .convertToString(positiveInfinity: "Infinity", negativeInfinity: "-Infinity", nan: "NaN")
                    let decoder = ClientRuntime.JSONDecoder()
                    decoder.dateDecodingStrategy = .secondsSince1970
                    decoder.nonConformingFloatDecodingStrategy = .convertFromString(positiveInfinity: "Infinity", negativeInfinity: "-Infinity", nan: "NaN")
                    let urlPath = "/foo"
                    let context = ClientRuntime.HttpContextBuilder()
                                  .withEncoder(value: encoder)
                                  .withDecoder(value: decoder)
                                  .withMethod(value: .get)
                                  .withPath(value: urlPath)
                                  .withServiceName(value: serviceName)
                                  .withOperation(value: "getFoo")
                                  .withIdempotencyTokenGenerator(value: config.idempotencyTokenGenerator)
                                  .withLogger(value: config.logger)
                                  .withCredentialsProvider(value: config.credentialsProvider)
                                  .withRegion(value: config.region)
                                  .withSigningName(value: "example-signing-name")
                                  .withSigningRegion(value: config.signingRegion)
                    var operation = OperationStack<GetFooInput, GetFooOutputResponse, GetFooOutputError>(id: "getFoo")
                    operation.addDefaultOperationMiddlewares()
                    operation.serializeStep.intercept(position: .before, middleware: GetFooInputHeadersMiddleware())
                    operation.serializeStep.intercept(position: .before, middleware: GetFooInputQueryItemMiddleware())
                    operation.serializeStep.intercept(position: .after, middleware: ContentTypeMiddleware<GetFooInput, GetFooOutputResponse, GetFooOutputError>(contentType: "content-type"))
                    operation.deserializeStep.intercept(position: .before, middleware: ClientRuntime.LoggerMiddleware(clientLogMode: config.clientLogMode))
                    operation.buildStep.intercept(position: .before, middleware: AWSClientRuntime.EndpointResolverMiddleware(endpointResolver: config.endpointResolver, serviceId: serviceName))
                    operation.finalizeStep.intercept(position: .after, middleware: AWSClientRuntime.RetryerMiddleware(retryer: config.retryer))
                    let sigv4Config = AWSClientRuntime.SigV4Config(unsignedBody: false)
                    operation.finalizeStep.intercept(position: .before,
                                                             middleware: AWSClientRuntime.SigV4Middleware(config: sigv4Config))
                    operation.buildStep.intercept(position: .before, middleware: AWSClientRuntime.UserAgentMiddleware(metadata: AWSClientRuntime.AWSUserAgentMetadata.fromEnv(apiMetadata: AWSClientRuntime.APIMetadata(serviceId: serviceName, version: "1.0.0"))))
                    let presignedRequestBuilder = operation.presignedRequest(context: context.build(), input: self, next: ClientRuntime.NoopHandler())
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
        presigner.writeAdditionalFiles(codegenContext, context.ctx.delegator)
        context.ctx.delegator.flushWriters()
        return context
    }
}
