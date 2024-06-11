package software.amazon.smithy.aws.swift.codegen.customization

import software.amazon.smithy.codegen.core.Symbol
import software.amazon.smithy.swift.codegen.Middleware
import software.amazon.smithy.swift.codegen.SwiftDependency
import software.amazon.smithy.swift.codegen.SwiftWriter
import software.amazon.smithy.swift.codegen.integration.steps.OperationSerializeStep
import software.amazon.smithy.swift.codegen.swiftmodules.SmithyTypes

// This middleware is intended only for use with S3 `PutObject`, and only for use when
// creating a presigned URL.
//
// Generates a middleware that writes S3 object metadata into the HTTP query string.
class PutObjectPresignedURLMiddleware(
    val inputSymbol: Symbol,
    outputSymbol: Symbol,
    outputErrorSymbol: Symbol,
    private val writer: SwiftWriter
) : Middleware(writer, inputSymbol, OperationSerializeStep(inputSymbol, outputSymbol, outputErrorSymbol)) {
    override val typeName = "PutObjectPresignedURLMiddleware"

    override fun generateInit() {
        writer.write("public init() {}")
    }

    override fun renderExtensions() {
        writer.write(
            """
            extension $typeName: Smithy.RequestMessageSerializer {
                public typealias InputType = ${inputSymbol.name}
                public typealias RequestType = SmithyHTTPAPI.SdkHttpRequest
                
                public func apply(input: InputType, builder: SmithyHTTPAPI.SdkHttpRequestBuilder, attributes: Smithy.Context) throws {
                    let metadata = input.metadata ?? [:]
                    for (metadataKey, metadataValue) in metadata {
                        let queryItem = ${'$'}N(
                            name: "x-amz-meta-\(metadataKey.urlPercentEncoding())",
                            value: metadataValue.urlPercentEncoding()
                        )
                        builder.withQueryItem(queryItem)
                    }
                }
            }
            """.trimIndent(),
            SmithyTypes.URIQueryItem,
        )
    }

    override fun generateMiddlewareClosure() {
        writer.write("try self.apply(input: input.operationInput, builder: input.builder, attributes: context)")
    }
}
