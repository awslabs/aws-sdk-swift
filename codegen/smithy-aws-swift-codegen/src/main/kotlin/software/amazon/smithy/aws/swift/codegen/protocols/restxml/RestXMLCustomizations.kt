/*
 * Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
 * SPDX-License-Identifier: Apache-2.0.
 */

package software.amazon.smithy.aws.swift.codegen.protocols.restxml

import software.amazon.smithy.aws.swift.codegen.AWSClientRuntimeTypes
import software.amazon.smithy.aws.swift.codegen.AWSHTTPProtocolCustomizations
import software.amazon.smithy.codegen.core.Symbol

class RestXMLCustomizations : AWSHTTPProtocolCustomizations() {

    override val baseErrorSymbol: Symbol = AWSClientRuntimeTypes.RestXML.RestXMLError
}
