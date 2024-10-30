package software.amazon.smithy.aws.swift.codegen.customization

import software.amazon.smithy.codegen.core.Symbol
import software.amazon.smithy.swift.codegen.Middleware
import software.amazon.smithy.swift.codegen.SwiftWriter
import software.amazon.smithy.swift.codegen.swiftmodules.SmithyTypes

// This middleware is intended only for use with S3 `UploadPart`, and only for use when
// creating a presigned URL.
//
// Generates a middleware that writes S3 object metadata into the HTTP query string.
class UploadPartPresignedURLMiddleware(
    val inputSymbol: Symbol,
    outputSymbol: Symbol,
    outputErrorSymbol: Symbol,
    private val writer: SwiftWriter
) : Middleware(writer, inputSymbol) {
    override val typeName = "UploadPartPresignedURLMiddleware"

    override fun generateInit() {
        writer.write("public init() {}")
    }

    override fun renderExtensions() {
        writer.write(
            """
            extension $typeName: Smithy.RequestMessageSerializer {
                public typealias InputType = ${inputSymbol.name}
                public typealias RequestType = SmithyHTTPAPI.HTTPRequest
                
                public func apply(input: InputType, builder: SmithyHTTPAPI.HTTPRequestBuilder, attributes: Smithy.Context) throws {
                    if let uploadId = input.uploadId {
                        let queryItem = Smithy.URIQueryItem(name: "uploadId".urlPercentEncoding(), value: Swift.String(uploadId).urlPercentEncoding())
                        builder.withQueryItem(queryItem)
                    }
                    if let partNumber = input.partNumber {
                        let queryItem = Smithy.URIQueryItem(name: "partNumber".urlPercentEncoding(), value: Swift.String(partNumber).urlPercentEncoding())
                        builder.withQueryItem(queryItem)
                    }
                }
            }
            """.trimIndent()        )
    }
}
