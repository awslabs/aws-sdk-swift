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
    fun `002 GreetingWithErrorsOutputError+HttpResponseBinding`() {
        val context = setupTests("restxml/xml-errors.smithy", "aws.protocoltests.restxml#RestXml")
        val contents = getFileContents(context.manifest, "/Example/models/GreetingWithErrorsOutputError+HttpResponseErrorBinding.swift")
        contents.shouldSyntacticSanityCheck()
        val expectedContents =
            """
            public enum GreetingWithErrorsOutputError: ClientRuntime.HttpResponseErrorBinding {
                public static func makeError(httpResponse: ClientRuntime.HttpResponse, decoder: ClientRuntime.ResponseDecoder? = nil) async throws -> Swift.Error {
                    let restXMLError = try await AWSClientRuntime.RestXMLError(httpResponse: httpResponse)
                    switch restXMLError.errorCode {
                        case "ComplexXMLError": return try await ComplexXMLError(httpResponse: httpResponse, decoder: decoder, message: restXMLError.message, requestID: restXMLError.requestId)
                        case "InvalidGreeting": return try await InvalidGreeting(httpResponse: httpResponse, decoder: decoder, message: restXMLError.message, requestID: restXMLError.requestId)
                        default: return try await AWSClientRuntime.UnknownAWSHTTPServiceError.makeError(httpResponse: httpResponse, message: restXMLError.message, requestID: restXMLError.requestId)
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
                public init(httpResponse: ClientRuntime.HttpResponse, decoder: ClientRuntime.ResponseDecoder? = nil, message: Swift.String? = nil, requestID: Swift.String? = nil) async throws {
                    if let headerHeaderValue = httpResponse.headers.value(for: "X-Header") {
                        self.properties.header = headerHeaderValue
                    } else {
                        self.properties.header = nil
                    }
                    if let data = try await httpResponse.body.readData(),
                        let responseDecoder = decoder {
                        let output: AWSClientRuntime.ErrorResponseContainer<ComplexXMLErrorBody> = try responseDecoder.decode(responseBody: data)
                        self.properties.nested = output.error.nested
                        self.properties.topLevel = output.error.topLevel
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
    fun `004 ComplexXMLError extends from AWSHttpServiceError`() {
        val context = setupTests("restxml/xml-errors.smithy", "aws.protocoltests.restxml#RestXml")
        val contents = getFileContents(context.manifest, "/Example/models/ComplexXMLError.swift")
        contents.shouldSyntacticSanityCheck()
        val expectedContents =
            """            
            public struct ComplexXMLError: ClientRuntime.ModeledError, AWSClientRuntime.AWSServiceError, ClientRuntime.HTTPError {
            
                public struct Properties {
                    public var header: Swift.String? = nil
                    public var nested: RestXmlerrorsClientTypes.ComplexXMLNestedErrorData? = nil
                    public var topLevel: Swift.String? = nil
                }
            
                public var properties = Properties()
                public static var typeName: Swift.String { "ComplexXMLError" }
                public static var fault: ErrorFault { .client }
                public static var isRetryable: Swift.Bool { false }
                public static var isThrottling: Swift.Bool { false }
                public var httpResponse = HttpResponse()
                public var message: Swift.String?
                public var requestID: Swift.String?
            
                public init(
                    header: Swift.String? = nil,
                    nested: RestXmlerrorsClientTypes.ComplexXMLNestedErrorData? = nil,
                    topLevel: Swift.String? = nil
                )
                {
                    self.properties.header = header
                    self.properties.nested = nested
                    self.properties.topLevel = topLevel
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
                public init(httpResponse: ClientRuntime.HttpResponse, decoder: ClientRuntime.ResponseDecoder? = nil, message: Swift.String? = nil, requestID: Swift.String? = nil) async throws {
                    if let headerHeaderValue = httpResponse.headers.value(for: "X-Header") {
                        self.properties.header = headerHeaderValue
                    } else {
                        self.properties.header = nil
                    }
                    if let data = try await httpResponse.body.readData(),
                        let responseDecoder = decoder {
                        let output: ComplexXMLErrorNoErrorWrappingBody = try responseDecoder.decode(responseBody: data)
                        self.properties.nested = output.nested
                        self.properties.topLevel = output.topLevel
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

    private fun setupTests(smithyFile: String, serviceShapeId: String): TestContext {
        val context = initContextFrom(smithyFile, serviceShapeId, RestXmlTrait.ID)

        val generator = RestXmlProtocolGenerator()
        generator.generateDeserializers(context.ctx)
        generator.generateCodableConformanceForNestedTypes(context.ctx)
        context.ctx.delegator.flushWriters()
        return context
    }
}
