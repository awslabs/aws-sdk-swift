package software.amazon.smithy.aws.swift.codegen.plugins

import software.amazon.smithy.aws.swift.codegen.swiftmodules.AWSClientRuntimeTypes
import software.amazon.smithy.codegen.core.Symbol
import software.amazon.smithy.swift.codegen.integration.Plugin

/**
 * Applies Amazon S3's response customizations to a client that uses schema-based restXml serde: errors
 * returned with an HTTP 200 status, and outputs with the s3UnwrappedXmlOutput trait.
 */
class S3Plugin : Plugin {
    override val className: Symbol
        get() = AWSClientRuntimeTypes.RestXML.S3.S3Plugin
}
