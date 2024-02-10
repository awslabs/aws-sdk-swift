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
        val expectedContents = """
enum GreetingWithErrorsOutputError {

    static var httpBinding: ClientRuntime.HTTPResponseErrorBinding<SmithyXML.Reader> {
        { httpResponse, responseDocumentClosure in
            let responseReader = try await responseDocumentClosure(httpResponse)
            let errorBodyReader = AWSClientRuntime.RestXMLError.errorBodyReader(responseReader: responseReader, noErrorWrapping: false)
            if let serviceError = try await ClientRuntime.RestXmlerrorsClientTypes.responseServiceErrorBinding(httpResponse, errorBodyReader) {
                return serviceError
            }
            let restXMLError = try AWSClientRuntime.RestXMLError(responseReader: responseReader, noErrorWrapping: false)
            switch restXMLError.code {
                case "ComplexXMLError": return try await ComplexXMLError.responseErrorBinding(httpResponse: httpResponse, reader: errorBodyReader, message: restXMLError.message, requestID: restXMLError.requestID)
                case "InvalidGreeting": return try await InvalidGreeting.responseErrorBinding(httpResponse: httpResponse, reader: errorBodyReader, message: restXMLError.message, requestID: restXMLError.requestID)
                default: return try await AWSClientRuntime.UnknownAWSHTTPServiceError.makeError(httpResponse: httpResponse, message: restXMLError.message, requestID: restXMLError.requestID, typeName: restXMLError.code)
            }
        }
    }
}
"""
        contents.shouldContainOnlyOnce(expectedContents)
    }
    @Test
    fun `003 ComplexXMLError+Init`() {
        val context = setupTests("restxml/xml-errors.smithy", "aws.protocoltests.restxml#RestXml")
        val contents = getFileContents(context.manifest, "/Example/models/ComplexXMLError+Init.swift")
        contents.shouldSyntacticSanityCheck()
        val expectedContents = """
extension ComplexXMLError {

    static func responseErrorBinding(httpResponse: ClientRuntime.HttpResponse, reader: SmithyXML.Reader, message: Swift.String? = nil, requestID: Swift.String? = nil) async throws -> Swift.Error {
        var value = ComplexXMLError()
        if let headerHeaderValue = httpResponse.headers.value(for: "X-Header") {
            value.properties.header = headerHeaderValue
        }
        value.properties.nested = try reader["Nested"].readIfPresent(readingClosure: RestXmlerrorsClientTypes.ComplexXMLNestedErrorData.readingClosure)
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
    fun `004 ComplexXMLError extends from AWSHttpServiceError`() {
        val context = setupTests("restxml/xml-errors.smithy", "aws.protocoltests.restxml#RestXml")
        val contents = getFileContents(context.manifest, "/Example/models/ComplexXMLError.swift")
        contents.shouldSyntacticSanityCheck()
        val expectedContents =
            """            
            public struct ComplexXMLError: ClientRuntime.ModeledError, AWSClientRuntime.AWSServiceError, ClientRuntime.HTTPError, Swift.Error {
            
                public struct Properties {
                    public internal(set) var header: Swift.String? = nil
                    public internal(set) var nested: RestXmlerrorsClientTypes.ComplexXMLNestedErrorData? = nil
                    public internal(set) var topLevel: Swift.String? = nil
                }
            
                public internal(set) var properties = Properties()
                public static var typeName: Swift.String { "ComplexXMLError" }
                public static var fault: ErrorFault { .client }
                public static var isRetryable: Swift.Bool { false }
                public static var isThrottling: Swift.Bool { false }
                public internal(set) var httpResponse = HttpResponse()
                public internal(set) var message: Swift.String?
                public internal(set) var requestID: Swift.String?
            
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
        val expectedContents = """
extension ComplexXMLErrorNoErrorWrapping {

    static func responseErrorBinding(httpResponse: ClientRuntime.HttpResponse, reader: SmithyXML.Reader, message: Swift.String? = nil, requestID: Swift.String? = nil) async throws -> Swift.Error {
        var value = ComplexXMLErrorNoErrorWrapping()
        if let headerHeaderValue = httpResponse.headers.value(for: "X-Header") {
            value.properties.header = headerHeaderValue
        }
        value.properties.nested = try reader["Nested"].readIfPresent(readingClosure: RestXmlerrorsClientTypes.ComplexXMLNestedErrorData.readingClosure)
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
    fun `006 RestXml+ServiceErrorHelperMethod AWSHttpServiceError`() {
        val context = setupTests("restxml/xml-errors.smithy", "aws.protocoltests.restxml#RestXml")
        val contents = getFileContents(context.manifest, "/Example/models/RestXml+ServiceErrorHelperMethod.swift")
        contents.shouldSyntacticSanityCheck()
        val expectedContents = """
extension RestXmlerrorsClientTypes {
    static func responseServiceErrorBinding(httpResponse: ClientRuntime.HttpResponse, reader: SmithyXML.Reader) async throws -> Swift.Error? {
        switch error.errorCode {
            case "ExampleServiceError": return try await ExampleServiceError(httpResponse: httpResponse, reader: reader, message: error.message, requestID: error.requestId)
            default: return nil
        }
    }
}
"""
        contents.shouldContainOnlyOnce(expectedContents)
    }

    private fun setupTests(smithyFile: String, serviceShapeId: String): TestContext {
        val context = initContextFrom(smithyFile, serviceShapeId, RestXmlTrait.ID)

        RestXmlProtocolGenerator().run {
            generateDeserializers(context.ctx)
            generateCodableConformanceForNestedTypes(context.ctx)
        }

        context.ctx.delegator.flushWriters()
        return context
    }
}
