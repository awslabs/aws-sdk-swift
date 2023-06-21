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
        val expectedContents =
            """
            public enum GreetingWithErrorsOutputError: ClientRuntime.HttpResponseErrorBinding {
                public static func makeError(httpResponse: ClientRuntime.HttpResponse, decoder: ClientRuntime.ResponseDecoder? = nil) async throws -> Swift.Error {
                    let ec2QueryError = try await Ec2QueryError(httpResponse: httpResponse)
                    switch ec2QueryError.errorCode {
                        case "ComplexError": return try await ComplexError(httpResponse: httpResponse, decoder: decoder, message: ec2QueryError.message, requestID: ec2QueryError.requestId)
                        case "InvalidGreeting": return try await InvalidGreeting(httpResponse: httpResponse, decoder: decoder, message: ec2QueryError.message, requestID: ec2QueryError.requestId)
                        default: return try await AWSClientRuntime.UnknownAWSHTTPServiceError.makeError(httpResponse: httpResponse, message: ec2QueryError.message, requestID: ec2QueryError.requestId, typeName: ec2QueryError.errorCode)
                    }
                }
            }
            """.trimIndent()
        contents.shouldContainOnlyOnce(expectedContents)
    }

    @Test
    fun `003 ComplexError+Init`() {
        val context = setupTests("ec2query/query-error.smithy", "aws.protocoltests.ec2#AwsEc2")
        val contents = TestContextGenerator.getFileContents(context.manifest, "/Example/models/ComplexError+Init.swift")
        contents.shouldSyntacticSanityCheck()
        val expectedContents =
            """
            extension ComplexError {
                public init(httpResponse: ClientRuntime.HttpResponse, decoder: ClientRuntime.ResponseDecoder? = nil, message: Swift.String? = nil, requestID: Swift.String? = nil) async throws {
                    if let data = try await httpResponse.body.readData(), let responseDecoder = decoder {
                        let output: AWSClientRuntime.Ec2NarrowedResponse<ComplexErrorBody> = try responseDecoder.decode(responseBody: data)
                        self.properties.nested = output.errors.error.nested
                        self.properties.topLevel = output.errors.error.topLevel
                    } else {
                        self.properties.nested = nil
                        self.properties.topLevel = nil
                    }
                    self.httpResponse = httpResponse
                    self.requestID = requestID
                    self.message = message
                }
            }
            """.trimIndent()
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
    private fun setupTests(smithyFile: String, serviceShapeId: String): TestContext {
        val context =
            TestContextGenerator.initContextFrom(smithyFile, serviceShapeId, Ec2QueryTrait.ID)

        val generator = Ec2QueryProtocolGenerator()
        generator.generateDeserializers(context.ctx)
        generator.generateCodableConformanceForNestedTypes(context.ctx)
        context.ctx.delegator.flushWriters()
        return context
    }
}
