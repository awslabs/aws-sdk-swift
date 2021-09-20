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
    fun `001 GreetingWithErrorsOutputError has with correct cases`() {
        val context = setupTests("ec2query/query-error.smithy", "aws.protocoltests.ec2#AwsEc2")
        val contents = TestContextGenerator.getFileContents(context.manifest, "/Example/models/GreetingWithErrorsOutputError.swift")
        contents.shouldSyntacticSanityCheck()
        val expectedContents =
            """
            public enum GreetingWithErrorsOutputError: Swift.Error, Swift.Equatable {
                case complexError(ComplexError)
                case invalidGreeting(InvalidGreeting)
                case unknown(UnknownAWSHttpServiceError)
            }
            """.trimIndent()
        contents.shouldContainOnlyOnce(expectedContents)
    }

    @Test
    fun `002 GreetingWithErrorsOutputError+HttpResponseBinding has with correct cases`() {
        val context = setupTests("ec2query/query-error.smithy", "aws.protocoltests.ec2#AwsEc2")
        val contents = TestContextGenerator.getFileContents(context.manifest, "/Example/models/GreetingWithErrorsOutputError+HttpResponseBinding.swift")
        contents.shouldSyntacticSanityCheck()
        val expectedContents =
            """
            extension GreetingWithErrorsOutputError: ClientRuntime.HttpResponseBinding {
                public init(httpResponse: ClientRuntime.HttpResponse, decoder: ClientRuntime.ResponseDecoder? = nil) throws {
                    let errorDetails = try Ec2QueryError(httpResponse: httpResponse)
                    try self.init(errorType: errorDetails.errorCode, httpResponse: httpResponse, decoder: decoder, message: errorDetails.message, requestID: errorDetails.requestId)
                }
            }
            
            extension GreetingWithErrorsOutputError {
                public init(errorType: Swift.String?, httpResponse: ClientRuntime.HttpResponse, decoder: ClientRuntime.ResponseDecoder? = nil, message: Swift.String? = nil, requestID: Swift.String? = nil) throws {
                    switch errorType {
                    case "ComplexError" : self = .complexError(try ComplexError(httpResponse: httpResponse, decoder: decoder, message: message, requestID: requestID))
                    case "InvalidGreeting" : self = .invalidGreeting(try InvalidGreeting(httpResponse: httpResponse, decoder: decoder, message: message, requestID: requestID))
                    default : self = .unknown(UnknownAWSHttpServiceError(httpResponse: httpResponse, message: message, requestID: requestID))
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
                public init (httpResponse: ClientRuntime.HttpResponse, decoder: ClientRuntime.ResponseDecoder? = nil, message: Swift.String? = nil, requestID: Swift.String? = nil) throws {
                    if case .stream(let reader) = httpResponse.body,
                        let responseDecoder = decoder {
                        let data = reader.toBytes().toData()
                        let output: AWSClientRuntime.Ec2NarrowedResponse<ComplexErrorBody> = try responseDecoder.decode(responseBody: data)
                        self.nested = output.errors.error.nested
                        self.topLevel = output.errors.error.topLevel
                    } else {
                        self.nested = nil
                        self.topLevel = nil
                    }
                    self._headers = httpResponse.headers
                    self._statusCode = httpResponse.statusCode
                    self._requestID = requestID
                    self._message = message
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
            public struct ComplexError: AWSClientRuntime.AWSHttpServiceError, Swift.Equatable {
                public var _headers: ClientRuntime.Headers?
                public var _statusCode: ClientRuntime.HttpStatusCode?
                public var _message: Swift.String?
                public var _requestID: Swift.String?
                public var _retryable: Swift.Bool = false
                public var _isThrottling: Swift.Bool = false
                public var _type: ClientRuntime.ErrorType = .client
                public var nested: AwsEc2ClientTypes.ComplexNestedErrorData?
                public var topLevel: Swift.String?
            
                public init (
                    nested: AwsEc2ClientTypes.ComplexNestedErrorData? = nil,
                    topLevel: Swift.String? = nil
                )
                {
                    self.nested = nested
                    self.topLevel = topLevel
                }
            }
            """.trimIndent()
        contents.shouldContainOnlyOnce(expectedContents)
    }
    private fun setupTests(smithyFile: String, serviceShapeId: String): TestContext {
        val context =
            TestContextGenerator.initContextFrom(smithyFile, serviceShapeId, Ec2QueryTrait.ID, "ec2query", "ec2query")

        val generator = Ec2QueryProtocolGenerator()
        generator.generateDeserializers(context.ctx)
        generator.generateCodableConformanceForNestedTypes(context.ctx)
        context.ctx.delegator.flushWriters()
        return context
    }
}
