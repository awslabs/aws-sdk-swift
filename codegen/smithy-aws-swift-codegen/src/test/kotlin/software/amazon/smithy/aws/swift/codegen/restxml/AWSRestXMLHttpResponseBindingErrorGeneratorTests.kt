/*
 * Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
 * SPDX-License-Identifier: Apache-2.0.
 */

package software.amazon.smithy.aws.swift.codegen.restxml

import io.kotest.matchers.string.shouldContainOnlyOnce
import org.junit.jupiter.api.Test
import software.amazon.smithy.aws.swift.codegen.TestContext
import software.amazon.smithy.aws.swift.codegen.TestContextGenerator.Companion.getFileContents
import software.amazon.smithy.aws.swift.codegen.TestContextGenerator.Companion.initContextFrom
import software.amazon.smithy.aws.swift.codegen.shouldSyntacticSanityCheck
import software.amazon.smithy.aws.traits.protocols.RestXmlTrait

class AWSRestXMLHttpResponseBindingErrorGeneratorTests {

    @Test
    fun `001 GreetingWithErrorsOutputError has with correct cases`() {
        val context = setupTests("restxml/xml-errors.smithy", "aws.protocoltests.restxml#RestXml")
        val contents = getFileContents(context.manifest, "/Example/models/GreetingWithErrorsOutputError.swift")
        contents.shouldSyntacticSanityCheck()
        val expectedContents =
            """
            public enum GreetingWithErrorsOutputError: Swift.Error, Swift.Equatable {
                case complexXMLError(ComplexXMLError)
                case invalidGreeting(InvalidGreeting)
                case unknown(UnknownAWSHttpServiceError)
            }
            """.trimIndent()
        contents.shouldContainOnlyOnce(expectedContents)
    }

    @Test
    fun `002 GreetingWithErrorsOutputError+HttpResponseBinding`() {
        val context = setupTests("restxml/xml-errors.smithy", "aws.protocoltests.restxml#RestXml")
        val contents = getFileContents(context.manifest, "/Example/models/GreetingWithErrorsOutputError+HttpResponseBinding.swift")
        contents.shouldSyntacticSanityCheck()
        val expectedContents =
            """
            extension GreetingWithErrorsOutputError: ClientRuntime.HttpResponseBinding {
                public init(httpResponse: ClientRuntime.HttpResponse, decoder: ClientRuntime.ResponseDecoder? = nil) throws {
                    let errorDetails = try AWSClientRuntime.RestXMLError(httpResponse: httpResponse)
                    try self.init(errorType: errorDetails.errorCode, httpResponse: httpResponse, decoder: decoder, message: errorDetails.message, requestID: errorDetails.requestId)
                }
            }
            
            extension GreetingWithErrorsOutputError {
                public init(errorType: Swift.String?, httpResponse: ClientRuntime.HttpResponse, decoder: ClientRuntime.ResponseDecoder? = nil, message: Swift.String? = nil, requestID: Swift.String? = nil) throws {
                    switch errorType {
                    case "ComplexXMLError" : self = .complexXMLError(try ComplexXMLError(httpResponse: httpResponse, decoder: decoder, message: message, requestID: requestID))
                    case "InvalidGreeting" : self = .invalidGreeting(try InvalidGreeting(httpResponse: httpResponse, decoder: decoder, message: message, requestID: requestID))
                    default : self = .unknown(UnknownAWSHttpServiceError(httpResponse: httpResponse, message: message, requestID: requestID))
                    }
                }
            }
            """.trimIndent()
        contents.shouldContainOnlyOnce(expectedContents)
    }
    @Test
    fun `003 ComplexXMLError+Init`() {
        val context = setupTests("restxml/xml-errors.smithy", "aws.protocoltests.restxml#RestXml")
        val contents = getFileContents(context.manifest, "/Example/models/ComplexXMLError+Init.swift")
        contents.shouldSyntacticSanityCheck()
        val expectedContents =
            """            
            extension ComplexXMLError {
                public init (httpResponse: ClientRuntime.HttpResponse, decoder: ClientRuntime.ResponseDecoder? = nil, message: Swift.String? = nil, requestID: Swift.String? = nil) throws {
                    if let headerHeaderValue = httpResponse.headers.value(for: "X-Header") {
                        self.header = headerHeaderValue
                    } else {
                        self.header = nil
                    }
                    if case .stream(let reader) = httpResponse.body,
                        let responseDecoder = decoder {
                        let data = reader.toBytes().toData()
                        let output: AWSClientRuntime.ErrorResponseContainer<ComplexXMLErrorBody> = try responseDecoder.decode(responseBody: data)
                        self.nested = output.error.nested
                        self.topLevel = output.error.topLevel
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
    fun `004 ComplexXMLError extends from AWSHttpServiceError`() {
        val context = setupTests("restxml/xml-errors.smithy", "aws.protocoltests.restxml#RestXml")
        val contents = getFileContents(context.manifest, "/Example/models/ComplexXMLError.swift")
        contents.shouldSyntacticSanityCheck()
        val expectedContents =
            """            
            public struct ComplexXMLError: AWSClientRuntime.AWSHttpServiceError, Swift.Equatable {
                public var _headers: ClientRuntime.Headers?
                public var _statusCode: ClientRuntime.HttpStatusCode?
                public var _message: Swift.String?
                public var _requestID: Swift.String?
                public var _retryable: Swift.Bool = false
                public var _isThrottling: Swift.Bool = false
                public var _type: ClientRuntime.ErrorType = .client
                public var header: Swift.String?
                public var nested: RestXmlClientTypes.ComplexXMLNestedErrorData?
                public var topLevel: Swift.String?
            
                public init (
                    header: Swift.String? = nil,
                    nested: RestXmlClientTypes.ComplexXMLNestedErrorData? = nil,
                    topLevel: Swift.String? = nil
                )
                {
                    self.header = header
                    self.nested = nested
                    self.topLevel = topLevel
                }
            }
            """.trimIndent()
        contents.shouldContainOnlyOnce(expectedContents)
    }
    @Test
    fun `005 ComplexXMLErrorNoErrorWrapping Init renders without container`() {
        val context = setupTests("restxml/xml-errors-noerrorwrapping.smithy", "aws.protocoltests.restxml#RestXml")
        val contents = getFileContents(context.manifest, "/Example/models/ComplexXMLErrorNoErrorWrapping+Init.swift")
        contents.shouldSyntacticSanityCheck()
        val expectedContents =
            """
            extension ComplexXMLErrorNoErrorWrapping {
                public init (httpResponse: ClientRuntime.HttpResponse, decoder: ClientRuntime.ResponseDecoder? = nil, message: Swift.String? = nil, requestID: Swift.String? = nil) throws {
                    if let headerHeaderValue = httpResponse.headers.value(for: "X-Header") {
                        self.header = headerHeaderValue
                    } else {
                        self.header = nil
                    }
                    if case .stream(let reader) = httpResponse.body,
                        let responseDecoder = decoder {
                        let data = reader.toBytes().toData()
                        let output: ComplexXMLErrorNoErrorWrappingBody = try responseDecoder.decode(responseBody: data)
                        self.nested = output.nested
                        self.topLevel = output.topLevel
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

    private fun setupTests(smithyFile: String, serviceShapeId: String): TestContext {
        val context = initContextFrom(smithyFile, serviceShapeId, RestXmlTrait.ID, "restXml", "restXml")

        val generator = RestXmlProtocolGenerator()
        generator.generateDeserializers(context.ctx)
        generator.generateCodableConformanceForNestedTypes(context.ctx)
        context.ctx.delegator.flushWriters()
        return context
    }
}
