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
extension QueryProtocolClient: QueryProtocolClientProtocol {
    /// This is a very cool operation.
    ///
    /// - Parameter NoInputAndOutputInput : [no documentation found]
    ///
    /// - Returns: `NoInputAndOutputOutput` : [no documentation found]
    public func noInputAndOutput(input: NoInputAndOutputInput) async throws -> NoInputAndOutputOutput
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
                      .build()
        var operation = ClientRuntime.OperationStack<NoInputAndOutputInput, NoInputAndOutputOutput, NoInputAndOutputOutputError>(id: "noInputAndOutput")
        operation.initializeStep.intercept(position: .after, middleware: ClientRuntime.URLPathMiddleware<NoInputAndOutputInput, NoInputAndOutputOutput, NoInputAndOutputOutputError>())
        operation.initializeStep.intercept(position: .after, middleware: ClientRuntime.URLHostMiddleware<NoInputAndOutputInput, NoInputAndOutputOutput>())
        let endpointParams = EndpointParams()
        operation.buildStep.intercept(position: .before, middleware: EndpointResolverMiddleware<NoInputAndOutputOutput, NoInputAndOutputOutputError>(endpointResolver: config.serviceSpecific.endpointResolver, endpointParams: endpointParams))
        operation.buildStep.intercept(position: .before, middleware: AWSClientRuntime.UserAgentMiddleware(metadata: AWSClientRuntime.AWSUserAgentMetadata.fromConfig(serviceID: serviceName, version: "1.0.0", config: config)))
        operation.serializeStep.intercept(position: .after, middleware: ClientRuntime.SerializableBodyMiddleware<NoInputAndOutputInput, NoInputAndOutputOutput>(xmlName: "NoInputAndOutputInput"))
        operation.serializeStep.intercept(position: .after, middleware: ContentTypeMiddleware<NoInputAndOutputInput, NoInputAndOutputOutput>(contentType: "application/x-www-form-urlencoded"))
        operation.finalizeStep.intercept(position: .before, middleware: ClientRuntime.ContentLengthMiddleware())
        operation.finalizeStep.intercept(position: .after, middleware: ClientRuntime.RetryMiddleware<ClientRuntime.DefaultRetryStrategy, AWSClientRuntime.AWSRetryErrorInfoProvider, NoInputAndOutputOutput, NoInputAndOutputOutputError>(options: config.retryStrategyOptions))
        operation.deserializeStep.intercept(position: .after, middleware: ClientRuntime.DeserializeMiddleware<NoInputAndOutputOutput, NoInputAndOutputOutputError>())
        operation.deserializeStep.intercept(position: .after, middleware: ClientRuntime.LoggerMiddleware<NoInputAndOutputOutput, NoInputAndOutputOutputError>(clientLogMode: config.clientLogMode))
        let result = try await operation.handleMiddleware(context: context, input: input, next: client.getHandler())
        return result
    }

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
