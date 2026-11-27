//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import protocol ClientRuntime.ClientConfiguration
import protocol ClientRuntime.DefaultHttpClientConfiguration
import protocol ClientRuntime.HttpInterceptorProvider
import protocol ClientRuntime.Interceptor
import protocol ClientRuntime.MutableResponse
import protocol ClientRuntime.Plugin
import struct Foundation.Data
@_spi(SchemaBasedSerde) import class Smithy.S3UnwrappedXMLOutputTrait
@_spi(SchemaBasedSerde) import class Smithy.StreamingTrait
import class SmithyHTTPAPI.HTTPRequest
import class SmithyHTTPAPI.HTTPResponse
@_spi(SchemaBasedSerde) import protocol SmithySerialization.OperationProperties
@_spi(SchemaBasedSerde) import class SmithyXML.Deserializer

/// Applies Amazon S3's response customizations to a client that uses schema-based `restXml` serde.
///
/// The plugin installs an interceptor that adjusts each response before it is deserialized:
/// - An HTTP 200 response whose body is an `Error` element is an error, and is given status 500 so it is
///   deserialized as one.  S3 can return errors this way for operations like `CopyObject`, `UploadPartCopy`,
///   `CompleteMultipartUpload` & `DeleteObjects`.  Operations with a streaming output are not checked, since
///   their body is not buffered.
/// - For an operation with the `s3UnwrappedXmlOutput` trait, i.e. `GetBucketLocation`, the body's root element
///   is the output's member rather than the output, so the body is wrapped in a root element before it is
///   deserialized.
///
/// See:
/// - https://github.com/awslabs/aws-sdk-swift/issues/1113
/// - https://smithy.io/2.0/aws/customizations/s3-customizations.html#aws-customizations-s3unwrappedxmloutput-trait
public struct S3Plugin: Plugin {

    public init() {}

    public func configureClient<Config: ClientConfiguration>(clientConfiguration: inout Config) async throws {
        guard var defaultConfig = clientConfiguration as? DefaultHttpClientConfiguration else { return }
        defaultConfig.addInterceptorProvider(S3ResponseInterceptorProvider())
        guard let modifiedConfig = defaultConfig as? Config else { return }
        clientConfiguration = modifiedConfig
    }
}

private struct S3ResponseInterceptorProvider: HttpInterceptorProvider {

    func create<InputType, OutputType>() -> any Interceptor<InputType, OutputType, HTTPRequest, HTTPResponse> {
        S3ResponseInterceptor<InputType, OutputType>()
    }
}

struct S3ResponseInterceptor<InputType, OutputType>: Interceptor {
    typealias RequestType = HTTPRequest
    typealias ResponseType = HTTPResponse

    func modifyBeforeDeserialization(
        context: some MutableResponse<InputType, HTTPRequest, HTTPResponse>
    ) async throws {
        guard let operation = context.getAttributes().getOperationProperties() else { return }
        let response = context.getResponse()

        // Decide what this response needs before reading its body, so that a body that needs neither
        // customization, i.e. a streaming one, is left unread.
        let isUnwrapped = operation.schema.hasTrait(S3UnwrappedXMLOutputTrait.self)
        let mayBeError = response.statusCode == .ok && !Self.hasStreamingOutput(operation)
        guard isUnwrapped || mayBeError else { return }
        guard let data = try await response.body.readData() else { return }

        // Only the start of the body is parsed to find the name of its root element.
        let isError = mayBeError && (try? Deserializer(data: data).elementName) == "Error"
        let statusCode = isError ? .internalServerError : response.statusCode
        let body = isUnwrapped && !isError && statusCode.isSuccess ? Self.wrapped(data) : data

        // The body is copied, since a buffered stream that has been read cannot be read again.
        context.updateResponse(updated: response.copy(body: response.body.copy(data: body), statusCode: statusCode))
    }

    /// `true` if the operation's output has a streaming member, whose body must not be buffered.
    private static func hasStreamingOutput(_ operation: any OperationProperties) -> Bool {
        operation.outputSchema.members.contains { $0.hasTrait(StreamingTrait.self) }
    }

    /// Wraps an XML document in a root element, so that its root element is read as a member of the output.
    ///
    /// Any XML declaration is removed first, since one may only appear at the start of a document.
    static func wrapped(_ data: Data) -> Data {
        var content = data[...]
        if let start = content.firstIndex(where: { !Self.isXMLWhitespace($0) }),
           content[start...].starts(with: Data("<?xml".utf8)),
           let end = Self.indexAfterDeclaration(content, from: start) {
            content = content[end...]
        }
        var wrapped = Data("<UnwrappedOutput>".utf8)
        wrapped.append(contentsOf: content)
        wrapped.append(contentsOf: "</UnwrappedOutput>".utf8)
        return wrapped
    }

    /// The index just past the `?>` that ends the XML declaration starting at `start`, or `nil` if there is none.
    private static func indexAfterDeclaration(_ content: Data.SubSequence, from start: Data.Index) -> Data.Index? {
        var index = start
        while index < content.endIndex {
            let next = content.index(after: index)
            if content[index] == UInt8(ascii: "?"), next < content.endIndex, content[next] == UInt8(ascii: ">") {
                return content.index(after: next)
            }
            index = next
        }
        return nil
    }

    private static func isXMLWhitespace(_ byte: UInt8) -> Bool {
        byte == 0x20 || byte == 0x09 || byte == 0x0A || byte == 0x0D
    }
}
