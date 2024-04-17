/*
 * Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
 * SPDX-License-Identifier: Apache-2.0.
 */

package software.amazon.smithy.aws.swift.codegen.ec2query

import io.kotest.matchers.string.shouldContainOnlyOnce
import org.junit.jupiter.api.Test
import software.amazon.smithy.aws.swift.codegen.TestContext
import software.amazon.smithy.aws.swift.codegen.TestUtils
import software.amazon.smithy.aws.swift.codegen.shouldSyntacticSanityCheck
import software.amazon.smithy.aws.traits.protocols.Ec2QueryTrait

class Ec2QueryHttpResponseBindingErrorGeneratorTests {

    @Test
    fun `002 GreetingWithErrorsOutputError+HttpResponseBinding has with correct cases`() {
        val context = setupTests("ec2query/query-error.smithy", "aws.protocoltests.ec2#AwsEc2")
        val contents = TestUtils.getFileContents(context.manifest, "/Example/models/GreetingWithErrorsOutputError+HttpResponseErrorBinding.swift")
        contents.shouldSyntacticSanityCheck()
        val expectedContents = """
enum GreetingWithErrorsOutputError {

    static var httpErrorBinding: SmithyReadWrite.WireResponseErrorBinding<ClientRuntime.HttpResponse, SmithyXML.Reader> {
        { httpResponse, responseDocumentClosure in
            let responseReader = try await responseDocumentClosure(httpResponse)
            let baseError = try AWSClientRuntime.EC2QueryError(httpResponse: httpResponse, responseReader: responseReader, noErrorWrapping: false)
            if let serviceError = try EC2ProtocolClientTypes.responseServiceErrorBinding(baseError: baseError) {
                return serviceError
            }
            switch baseError.code {
                case "ComplexError": return try ComplexError.makeError(baseError: baseError)
                case "InvalidGreeting": return try InvalidGreeting.makeError(baseError: baseError)
                default: return try AWSClientRuntime.UnknownAWSHTTPServiceError.makeError(baseError: baseError)
            }
        }
    }
}
"""
        contents.shouldContainOnlyOnce(expectedContents)
    }

    @Test
    fun `003 ComplexError+Init`() {
        val context = setupTests("ec2query/query-error.smithy", "aws.protocoltests.ec2#AwsEc2")
        val contents = TestUtils.getFileContents(context.manifest, "/Example/models/ComplexError+Init.swift")
        contents.shouldSyntacticSanityCheck()
        val expectedContents = """
extension ComplexError {

    static func makeError(baseError: AWSClientRuntime.EC2QueryError) throws -> ComplexError {
        let reader = baseError.errorBodyReader
        var value = ComplexError()
        value.properties.nested = try reader["Nested"].readIfPresent(with: EC2ProtocolClientTypes.ComplexNestedErrorData.read(from:))
        value.properties.topLevel = try reader["TopLevel"].readIfPresent()
        value.httpResponse = baseError.httpResponse
        value.requestID = baseError.requestID
        value.message = baseError.message
        return value
    }
}
"""
        contents.shouldContainOnlyOnce(expectedContents)
    }

    @Test
    fun `004 ComplexError constructor conforms to AWSHttpServiceError`() {
        val context = setupTests("ec2query/query-error.smithy", "aws.protocoltests.ec2#AwsEc2")
        val contents = TestUtils.getFileContents(context.manifest, "/Example/models/ComplexError.swift")
        contents.shouldSyntacticSanityCheck()
        val expectedContents =
            """
            public struct ComplexError: ClientRuntime.ModeledError, AWSClientRuntime.AWSServiceError, ClientRuntime.HTTPError, Swift.Error {
            
                public struct Properties {
                    public internal(set) var nested: EC2ProtocolClientTypes.ComplexNestedErrorData? = nil
                    public internal(set) var topLevel: Swift.String? = nil
                }
            
                public internal(set) var properties = Properties()
                public static var typeName: Swift.String { "ComplexError" }
                public static var fault: ErrorFault { .client }
                public static var isRetryable: Swift.Bool { false }
                public static var isThrottling: Swift.Bool { false }
                public internal(set) var httpResponse = HttpResponse()
                public internal(set) var message: Swift.String?
                public internal(set) var requestID: Swift.String?
            
                public init(
                    nested: EC2ProtocolClientTypes.ComplexNestedErrorData? = nil,
                    topLevel: Swift.String? = nil
                )
                {
                    self.properties.nested = nested
                    self.properties.topLevel = topLevel
                }
            }
            """.trimIndent()
        contents.shouldContainOnlyOnce(expectedContents)
    }

    @Test
    fun `005 AwsEc2+ServiceErrorHelperMethod AWSHttpServiceError`() {
        val context = setupTests("ec2query/query-error.smithy", "aws.protocoltests.ec2#AwsEc2")
        val contents = TestUtils.getFileContents(context.manifest, "/Example/models/AwsEc2+ServiceErrorHelperMethod.swift")
        contents.shouldSyntacticSanityCheck()
        val expectedContents = """
extension EC2ProtocolClientTypes {
    static func responseServiceErrorBinding(baseError: AWSClientRuntime.EC2QueryError) throws -> Swift.Error? {
        switch baseError.code {
            case "ExampleServiceError": return try ExampleServiceError.makeError(baseError: baseError)
            default: return nil
        }
    }
}
"""
        contents.shouldContainOnlyOnce(expectedContents)
    }

    private fun setupTests(smithyFile: String, serviceShapeId: String): TestContext {
        val context =
            TestUtils.executeDirectedCodegen(smithyFile, serviceShapeId, Ec2QueryTrait.ID)

        Ec2QueryProtocolGenerator().run {
            generateDeserializers(context.ctx)
            generateCodableConformanceForNestedTypes(context.ctx)
        }
        context.ctx.delegator.flushWriters()
        return context
    }
}
