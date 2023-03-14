/*
 * Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
 * SPDX-License-Identifier: Apache-2.0.
 */

package software.amazon.smithy.aws.swift.codegen.awsquery

import io.kotest.matchers.string.shouldContainOnlyOnce
import org.junit.jupiter.api.Test
import software.amazon.smithy.aws.swift.codegen.TestContext
import software.amazon.smithy.aws.swift.codegen.TestContextGenerator
import software.amazon.smithy.aws.swift.codegen.TestContextGenerator.Companion.getFileContents
import software.amazon.smithy.aws.swift.codegen.shouldSyntacticSanityCheck
import software.amazon.smithy.aws.traits.protocols.AwsQueryTrait

class AWSQueryOperationStackTest {
    @Test
    fun `operation stack has required middlewares`() {
        val context = setupTests("awsquery/query-empty-input-output.smithy", "aws.protocoltests.query#AwsQuery")
        val contents = getFileContents(context.manifest, "/Example/QueryProtocolClient.swift")
        contents.shouldSyntacticSanityCheck()
        val expectedContents =
            """
    public func noInputAndOutput(input: NoInputAndOutputInput) async throws -> NoInputAndOutputOutputResponse
    {
        let context = ClientRuntime.HttpContextBuilder()
                      .withEncoder(value: encoder)
                      .withDecoder(value: decoder)
                      .withMethod(value: .post)
                      .withServiceName(value: serviceName)
                      .withOperation(value: "noInputAndOutput")
                      .withIdempotencyTokenGenerator(value: config.idempotencyTokenGenerator)
                      .withLogger(value: config.logger)
                      .withPartitionID(value: config.partitionID)
                      .withCredentialsProvider(value: config.credentialsProvider)
                      .withRegion(value: config.region)
        var operation = ClientRuntime.OperationStack<NoInputAndOutputInput, NoInputAndOutputOutputResponse, NoInputAndOutputOutputError>(id: "noInputAndOutput")
        operation.initializeStep.intercept(position: .after, middleware: ClientRuntime.URLPathMiddleware<NoInputAndOutputInput, NoInputAndOutputOutputResponse, NoInputAndOutputOutputError>())
        operation.initializeStep.intercept(position: .after, middleware: ClientRuntime.URLHostMiddleware<NoInputAndOutputInput, NoInputAndOutputOutputResponse>())
        let endpointParams = EndpointParams()
        operation.buildStep.intercept(position: .before, middleware: EndpointResolverMiddleware<NoInputAndOutputOutputResponse, NoInputAndOutputOutputError>(endpointResolver: config.endpointResolver, endpointParams: endpointParams))
        let apiMetadata = AWSClientRuntime.APIMetadata(serviceId: serviceName, version: "1.0.0")
        operation.buildStep.intercept(position: .before, middleware: AWSClientRuntime.UserAgentMiddleware(metadata: AWSClientRuntime.AWSUserAgentMetadata.fromEnv(apiMetadata: apiMetadata, frameworkMetadata: config.frameworkMetadata)))
        operation.serializeStep.intercept(position: .after, middleware: ClientRuntime.SerializableBodyMiddleware<NoInputAndOutputInput, NoInputAndOutputOutputResponse>(xmlName: "NoInputAndOutputInput"))
        operation.serializeStep.intercept(position: .after, middleware: ContentTypeMiddleware<NoInputAndOutputInput, NoInputAndOutputOutputResponse>(contentType: "application/x-www-form-urlencoded"))
        operation.finalizeStep.intercept(position: .before, middleware: ClientRuntime.ContentLengthMiddleware())
        operation.finalizeStep.intercept(position: .after, middleware: ClientRuntime.RetryerMiddleware<NoInputAndOutputOutputResponse, NoInputAndOutputOutputError>(retryStrategy: config.retryStrategy))
        operation.deserializeStep.intercept(position: .before, middleware: ClientRuntime.LoggerMiddleware<NoInputAndOutputOutputResponse, NoInputAndOutputOutputError>(clientLogMode: config.clientLogMode))
        operation.deserializeStep.intercept(position: .after, middleware: ClientRuntime.DeserializeMiddleware<NoInputAndOutputOutputResponse, NoInputAndOutputOutputError>())
        let result = try await operation.handleMiddleware(context: context.build(), input: input, next: client.getHandler())
        return result
    }"""
        contents.shouldContainOnlyOnce(expectedContents)
    }

    private fun setupTests(smithyFile: String, serviceShapeId: String): TestContext {
        val context = TestContextGenerator.initContextFrom(smithyFile, serviceShapeId, AwsQueryTrait.ID)
        val generator = AwsQueryProtocolGenerator()
        generator.generateCodableConformanceForNestedTypes(context.ctx)
        generator.generateSerializers(context.ctx)
        context.ctx.delegator.flushWriters()
        return context
    }
}
