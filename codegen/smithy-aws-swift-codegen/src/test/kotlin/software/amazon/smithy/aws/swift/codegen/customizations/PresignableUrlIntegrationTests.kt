package software.amazon.smithy.aws.swift.codegen.customizations

import io.kotest.matchers.string.shouldContainOnlyOnce
import org.junit.jupiter.api.Test
import software.amazon.smithy.aws.swift.codegen.TestContext
import software.amazon.smithy.aws.swift.codegen.TestContextGenerator
import software.amazon.smithy.aws.swift.codegen.customization.presignable.PresignableUrlIntegration
import software.amazon.smithy.aws.swift.codegen.restjson.AWSRestJson1ProtocolGenerator
import software.amazon.smithy.aws.swift.codegen.shouldSyntacticSanityCheck
import software.amazon.smithy.aws.traits.protocols.RestJson1Trait
import software.amazon.smithy.aws.traits.protocols.RestXmlTrait
import software.amazon.smithy.swift.codegen.core.GenerationContext
import software.amazon.smithy.swift.codegen.integration.ProtocolGenerator

class PresignableUrlIntegrationTests {

    @Test
    fun `codesign is configured correctly for Polly SynthesizeSpeech`() {
        val context = setupTests("presign-urls-polly.smithy", "com.amazonaws.polly#Parrot_v1")
        val contents = TestContextGenerator.getFileContents(context.manifest, "/Example/models/SynthesizeSpeechInput+Presigner.swift")
        contents.shouldSyntacticSanityCheck()
        val expectedContents = """
        let sigv4Config = AWSClientRuntime.SigV4Config(signatureType: .requestQueryParams, expiration: expiration, unsignedBody: false, signingAlgorithm: .sigv4)
        operation.finalizeStep.intercept(position: .before, middleware: AWSClientRuntime.SigV4Middleware<SynthesizeSpeechOutputResponse, SynthesizeSpeechOutputError>(config: sigv4Config))
        """
        contents.shouldContainOnlyOnce(expectedContents)
    }

    @Test
    fun `codesign is configured correctly for S3 GetObject`() {
        val context = setupTests("presign-urls-s3.smithy", "com.amazonaws.s3#AmazonS3")
        val contents = TestContextGenerator.getFileContents(context.manifest, "/Example/models/GetObjectInput+Presigner.swift")
        contents.shouldSyntacticSanityCheck()
        val expectedContents = """
        let sigv4Config = AWSClientRuntime.SigV4Config(signatureType: .requestQueryParams, useDoubleURIEncode: false, shouldNormalizeURIPath: false, expiration: expiration, unsignedBody: true, signingAlgorithm: .sigv4)
        operation.finalizeStep.intercept(position: .before, middleware: AWSClientRuntime.SigV4Middleware<GetObjectOutputResponse, GetObjectOutputError>(config: sigv4Config))
        """
        contents.shouldContainOnlyOnce(expectedContents)
    }

    @Test
    fun `codesign is configured correctly for S3 PutObject`() {
        val context = setupTests("presign-urls-s3.smithy", "com.amazonaws.s3#AmazonS3")
        val contents = TestContextGenerator.getFileContents(context.manifest, "/Example/models/PutObjectInput+Presigner.swift")
        contents.shouldSyntacticSanityCheck()
        val expectedContents = """
        let sigv4Config = AWSClientRuntime.SigV4Config(signatureType: .requestQueryParams, useDoubleURIEncode: false, shouldNormalizeURIPath: false, expiration: expiration, unsignedBody: true, signingAlgorithm: .sigv4)
        operation.finalizeStep.intercept(position: .before, middleware: AWSClientRuntime.SigV4Middleware<PutObjectOutputResponse, PutObjectOutputError>(config: sigv4Config))
        """
        contents.shouldContainOnlyOnce(expectedContents)
    }

    @Test
    fun `S3 PutObject operation stack contains the PutObjectPresignedURLMiddleware`() {
        val context = setupTests("presign-urls-s3.smithy", "com.amazonaws.s3#AmazonS3")
        val contents = TestContextGenerator.getFileContents(context.manifest, "/Example/models/PutObjectInput+Presigner.swift")
        contents.shouldSyntacticSanityCheck()
        val expectedContents = """
        operation.serializeStep.intercept(position: .after, middleware: PutObjectPresignedURLMiddleware())
        """
        contents.shouldContainOnlyOnce(expectedContents)
    }

    @Test
    fun `S3 PutObject's PutObjectPresignedURLMiddleware is rendered`() {
        val context = setupTests("presign-urls-s3.smithy", "com.amazonaws.s3#AmazonS3")
        val contents = TestContextGenerator.getFileContents(context.manifest, "/Example/models/PutObjectInput+QueryItemMiddlewareForPresignUrl.swift")
        contents.shouldSyntacticSanityCheck()
        val expectedContents = """
public struct PutObjectPresignedURLMiddleware: ClientRuntime.Middleware {
    public let id: Swift.String = "PutObjectPresignedURLMiddleware"

    public init() {}

    public func handle<H>(context: Context,
                  input: ClientRuntime.SerializeStepInput<PutObjectInput>,
                  next: H) async throws -> ClientRuntime.OperationOutput<PutObjectOutputResponse>
    where H: Handler,
    Self.MInput == H.Input,
    Self.MOutput == H.Output,
    Self.Context == H.Context
    {
        let metadata = input.operationInput.metadata ?? [:]
        for (metadataKey, metadataValue) in metadata {
            let queryItem = URLQueryItem(
                name: "x-amz-meta-\(metadataKey.urlPercentEncoding())",
                value: metadataValue.urlPercentEncoding()
            )
            input.builder.withQueryItem(queryItem)
        }
        return try await next.handle(context: context, input: input)
    }

    public typealias MInput = ClientRuntime.SerializeStepInput<PutObjectInput>
    public typealias MOutput = ClientRuntime.OperationOutput<PutObjectOutputResponse>
    public typealias Context = ClientRuntime.HttpContext
}
"""
        contents.shouldContainOnlyOnce(expectedContents)
    }

    private fun setupTests(smithyFile: String, serviceShapeId: String): TestContext {
        val context = TestContextGenerator.initContextFrom(smithyFile, serviceShapeId, RestXmlTrait.ID)
        val presigner = PresignableUrlIntegration()
        val generator = AWSRestJson1ProtocolGenerator()

        val codegenContext = GenerationContext(context.ctx.model, context.ctx.symbolProvider, context.ctx.settings, generator)
        val protocolGenerationContext = ProtocolGenerator.GenerationContext(context.ctx.settings, context.ctx.model, context.ctx.service, context.ctx.symbolProvider, listOf(), RestJson1Trait.ID, context.ctx.delegator)
        codegenContext.protocolGenerator?.initializeMiddleware(context.ctx)
        presigner.writeAdditionalFiles(codegenContext, protocolGenerationContext, context.ctx.delegator)
        context.ctx.delegator.flushWriters()
        return context
    }
}
