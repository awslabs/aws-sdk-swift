/*
 * Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
 * SPDX-License-Identifier: Apache-2.0.
 */

package software.amazon.smithy.aws.swift.codegen.ec2query

import io.kotest.matchers.string.shouldContainOnlyOnce
import org.junit.jupiter.api.Test
import software.amazon.smithy.aws.swift.codegen.TestContext
import software.amazon.smithy.aws.swift.codegen.TestContextGenerator
import software.amazon.smithy.aws.swift.codegen.shouldSyntacticSanityCheck
import software.amazon.smithy.aws.traits.protocols.Ec2QueryTrait

class Ec2QueryHttpResponseBindingErrorGeneratorTests {

    @Test
    fun `002 GreetingWithErrorsOutputError+HttpResponseBinding has with correct cases`() {
        val context = setupTests("ec2query/query-error.smithy", "aws.protocoltests.ec2#AwsEc2")
        val contents = TestContextGenerator.getFileContents(context.manifest, "/Example/models/GreetingWithErrorsOutputError+HttpResponseErrorBinding.swift")
        contents.shouldSyntacticSanityCheck()
        val expectedContents = """
enum GreetingWithErrorsOutputError {

    static var httpBinding: ClientRuntime.HTTPResponseErrorBinding<SmithyXML.Reader> {
        { httpResponse, responseDocumentClosure in
            let serviceError = try await EC2ProtocolClientTypes.makeServiceError(httpResponse, decoder, ec2QueryError)
            if let error = serviceError { return error }
            let responseReader = try await responseDocumentClosure(httpResponse)
            let reader = responseReader["Errors"]["Error"]
            let requestID: String? = try responseReader["RequestId"].readIfPresent()
            let errorCode: String? = try reader["Code"].readIfPresent()
            let message: String? = try reader["Message"].readIfPresent()
            switch errorCode {
                case "ComplexError": return try await ComplexError.responseErrorBinding(httpResponse: httpResponse, reader: reader, message: message, requestID: requestID)
                case "InvalidGreeting": return try await InvalidGreeting.responseErrorBinding(httpResponse: httpResponse, reader: reader, message: message, requestID: requestID)
                default: return try await AWSClientRuntime.UnknownAWSHTTPServiceError.makeError(httpResponse: httpResponse, message: message, requestID: requestID, typeName: errorCode)
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
        val contents = TestContextGenerator.getFileContents(context.manifest, "/Example/models/ComplexError+Init.swift")
        contents.shouldSyntacticSanityCheck()
        val expectedContents = """
extension ComplexError {

    static func responseErrorBinding(httpResponse: ClientRuntime.HttpResponse, reader: SmithyXML.Reader, message: Swift.String? = nil, requestID: Swift.String? = nil) async throws -> Swift.Error {
        var value = ComplexError()
        value.properties.nested = try reader["Nested"].readIfPresent(readingClosure: EC2ProtocolClientTypes.ComplexNestedErrorData.readingClosure)
        value.properties.topLevel = try reader["TopLevel"].readIfPresent()
        value.httpResponse = httpResponse
        value.requestID = requestID
        value.message = message
        return value
    }
}
"""
        contents.shouldContainOnlyOnce(expectedContents)
    }

    @Test
    fun `004 ComplexError constructor conforms to AWSHttpServiceError`() {
        val context = setupTests("ec2query/query-error.smithy", "aws.protocoltests.ec2#AwsEc2")
        val contents = TestContextGenerator.getFileContents(context.manifest, "/Example/models/ComplexError.swift")
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
        val contents = TestContextGenerator.getFileContents(context.manifest, "/Example/models/AwsEc2+ServiceErrorHelperMethod.swift")
        contents.shouldSyntacticSanityCheck()
        val expectedContents =
            """
            extension EC2ProtocolClientTypes {
                static func makeServiceError(_ httpResponse: ClientRuntime.HttpResponse, _ decoder: ClientRuntime.ResponseDecoder? = nil, _ error: AWSClientRuntime.Ec2QueryError) async throws -> Swift.Error? {
                    switch error.errorCode {
                        case "ExampleServiceError": return try await ExampleServiceError(httpResponse: httpResponse, decoder: decoder, message: error.message, requestID: error.requestId)
                        default: return nil
                    }
                }
            }
            """.trimIndent()
        contents.shouldContainOnlyOnce(expectedContents)
    }

    private fun setupTests(smithyFile: String, serviceShapeId: String): TestContext {
        val context =
            TestContextGenerator.initContextFrom(smithyFile, serviceShapeId, Ec2QueryTrait.ID)

        Ec2QueryProtocolGenerator().run {
            generateDeserializers(context.ctx)
            generateCodableConformanceForNestedTypes(context.ctx)
        }
        context.ctx.delegator.flushWriters()
        return context
    }
}
