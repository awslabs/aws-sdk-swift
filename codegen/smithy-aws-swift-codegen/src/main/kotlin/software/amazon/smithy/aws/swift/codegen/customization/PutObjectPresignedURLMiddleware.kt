package software.amazon.smithy.aws.swift.codegen.customization

import software.amazon.smithy.codegen.core.Symbol
import software.amazon.smithy.swift.codegen.ClientRuntimeTypes
import software.amazon.smithy.swift.codegen.Middleware
import software.amazon.smithy.swift.codegen.SwiftWriter
import software.amazon.smithy.swift.codegen.integration.steps.OperationSerializeStep

// This middleware is intended only for use with S3 `PutObject`, and only for use when
// creating a presigned URL.
//
// Generates a middleware that writes S3 object metadata into the HTTP query string.
class PutObjectPresignedURLMiddleware(
    inputSymbol: Symbol,
    outputSymbol: Symbol,
    outputErrorSymbol: Symbol,
    private val writer: SwiftWriter
) : Middleware(writer, inputSymbol, OperationSerializeStep(inputSymbol, outputSymbol, outputErrorSymbol)) {
    override val typeName = "PutObjectPresignedURLMiddleware"

    override fun generateInit() {
        writer.write("public init() {}")
    }

    override fun generateMiddlewareClosure() {
        writer.apply {
            write("let metadata = input.operationInput.metadata ?? [:]")
            openBlock("for (metadataKey, metadataValue) in metadata {", "}") {
                openBlock("let queryItem = \$N(", ")", ClientRuntimeTypes.Core.SDKURLQueryItem) {
                    write("name: \"x-amz-meta-\\(metadataKey.urlPercentEncoding())\",")
                    write("value: metadataValue.urlPercentEncoding()")
                }
                write("input.builder.withQueryItem(queryItem)")
            }
        }
    }
}
