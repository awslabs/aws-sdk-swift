/*
 * Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
 * SPDX-License-Identifier: Apache-2.0.
 */

package software.amazon.smithy.aws.swift.codegen.restjson

import software.amazon.smithy.aws.swift.codegen.AWSClientRuntimeTypes
import software.amazon.smithy.codegen.core.Symbol
import software.amazon.smithy.swift.codegen.integration.httpResponse.HTTPResponseBindingErrorGenerator

class AWSRestJson1HttpResponseBindingErrorGeneratable : HTTPResponseBindingErrorGenerator() {

    override val serviceBaseErrorSymbol: Symbol = AWSClientRuntimeTypes.RestJSON.RestJSONError
}
