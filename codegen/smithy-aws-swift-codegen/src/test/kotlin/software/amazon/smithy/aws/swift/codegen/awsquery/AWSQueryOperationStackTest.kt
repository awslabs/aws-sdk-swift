/*
 * Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
 * SPDX-License-Identifier: Apache-2.0.
 */

package software.amazon.smithy.aws.swift.codegen.awsquery

import io.kotest.matchers.string.shouldContainOnlyOnce
import org.junit.jupiter.api.Test
import software.amazon.smithy.aws.swift.codegen.TestContext
import software.amazon.smithy.aws.swift.codegen.TestUtils
import software.amazon.smithy.aws.swift.codegen.TestUtils.Companion.getFileContents
import software.amazon.smithy.aws.swift.codegen.protocols.awsquery.AWSQueryProtocolGenerator
import software.amazon.smithy.aws.swift.codegen.shouldSyntacticSanityCheck
import software.amazon.smithy.aws.traits.protocols.AwsQueryTrait

class AWSQueryOperationStackTest {
    @Test
    fun `operation stack has required middlewares`() {
        val context = setupTests("awsquery/query-empty-input-output.smithy", "aws.protocoltests.query#AwsQuery")
        val contents = getFileContents(context.manifest, "Sources/Example/QueryProtocolClient.swift")
        contents.shouldSyntacticSanityCheck()
        val expectedContents = """
        var operation = ClientRuntime.OperationStack<NoInputAndOutputInput, NoInputAndOutputOutput>(id: "noInputAndOutput")
        operation.initializeStep.intercept(position: .after, middleware: ClientRuntime.URLPathMiddleware<NoInputAndOutputInput, NoInputAndOutputOutput>(NoInputAndOutputInput.urlPathProvider(_:)))
        operation.initializeStep.intercept(position: .after, middleware: ClientRuntime.URLHostMiddleware<NoInputAndOutputInput, NoInputAndOutputOutput>())
        let endpointParams = EndpointParams()
        operation.buildStep.intercept(position: .before, middleware: AWSClientRuntime.EndpointResolverMiddleware<NoInputAndOutputOutput, EndpointParams>(endpointResolverBlock: { [config] in try config.endpointResolver.resolve(params: ${'$'}0) }, endpointParams: endpointParams))
        operation.buildStep.intercept(position: .before, middleware: AWSClientRuntime.UserAgentMiddleware<NoInputAndOutputInput, NoInputAndOutputOutput>(metadata: AWSClientRuntime.AWSUserAgentMetadata.fromConfig(serviceID: serviceName, version: QueryProtocolClient.version, config: config)))
        operation.buildStep.intercept(position: .before, middleware: ClientRuntime.AuthSchemeMiddleware<NoInputAndOutputOutput>())
        operation.serializeStep.intercept(position: .after, middleware: ClientRuntime.BodyMiddleware<NoInputAndOutputInput, NoInputAndOutputOutput, SmithyFormURL.Writer>(rootNodeInfo: "", inputWritingClosure: NoInputAndOutputInput.write(value:to:)))
        operation.serializeStep.intercept(position: .after, middleware: ClientRuntime.ContentTypeMiddleware<NoInputAndOutputInput, NoInputAndOutputOutput>(contentType: "application/x-www-form-urlencoded"))
        operation.finalizeStep.intercept(position: .before, middleware: ClientRuntime.ContentLengthMiddleware<NoInputAndOutputInput, NoInputAndOutputOutput>())
        operation.finalizeStep.intercept(position: .after, middleware: ClientRuntime.RetryMiddleware<SmithyRetries.DefaultRetryStrategy, AWSClientRuntime.AWSRetryErrorInfoProvider, NoInputAndOutputOutput>(options: config.retryStrategyOptions))
        operation.finalizeStep.intercept(position: .before, middleware: ClientRuntime.SignerMiddleware<NoInputAndOutputOutput>())
        operation.deserializeStep.intercept(position: .after, middleware: ClientRuntime.DeserializeMiddleware<NoInputAndOutputOutput>(NoInputAndOutputOutput.httpOutput(from:), NoInputAndOutputOutputError.httpError(from:)))
        operation.deserializeStep.intercept(position: .after, middleware: ClientRuntime.LoggerMiddleware<NoInputAndOutputInput, NoInputAndOutputOutput>(clientLogMode: config.clientLogMode))
"""
        contents.shouldContainOnlyOnce(expectedContents)
    }

    private fun setupTests(smithyFile: String, serviceShapeId: String): TestContext {
        val context = TestUtils.executeDirectedCodegen(smithyFile, serviceShapeId, AwsQueryTrait.ID)
        val generator = AWSQueryProtocolGenerator()
        generator.generateCodableConformanceForNestedTypes(context.ctx)
        generator.generateSerializers(context.ctx)
        context.ctx.delegator.flushWriters()
        return context
    }
}
