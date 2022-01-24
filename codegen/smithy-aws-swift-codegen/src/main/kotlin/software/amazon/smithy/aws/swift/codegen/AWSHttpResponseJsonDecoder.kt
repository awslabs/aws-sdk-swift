/*
 * Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
 * SPDX-License-Identifier: Apache-2.0.
 */

package software.amazon.smithy.aws.swift.codegen

import software.amazon.smithy.swift.codegen.ClientRuntimeTypes
import software.amazon.smithy.swift.codegen.SwiftDependency
import software.amazon.smithy.swift.codegen.SwiftWriter
import software.amazon.smithy.swift.codegen.integration.HttpResponseDecoder

class AWSHttpResponseJsonDecoder(
    responseDecoderOptions: MutableMap<String, String> = mutableMapOf()
) : HttpResponseDecoder(ClientRuntimeTypes.Serde.JSONDecoder, responseDecoderOptions) {
    override fun addImportsAndDependencies(writer: SwiftWriter) {
        writer.addImport(SwiftDependency.JSON_RUNTIME.target)
        writer.addDependency(SwiftDependency.JSON_RUNTIME)
    }
}
