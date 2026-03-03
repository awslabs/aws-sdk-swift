/*
 * Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
 * SPDX-License-Identifier: Apache-2.0.
 */

package software.amazon.smithy.aws.swift.codegen.protocols.restjson

import software.amazon.smithy.aws.swift.codegen.AWSHTTPProtocolCustomizations
import software.amazon.smithy.codegen.core.Symbol
import software.amazon.smithy.swift.codegen.swiftmodules.ClientRuntimeTypes

class RestJSONCustomizations : AWSHTTPProtocolCustomizations() {
    override val baseErrorSymbol: Symbol = ClientRuntimeTypes.RestJSON.RestJSONError
}
