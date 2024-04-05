/*
 * Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
 * SPDX-License-Identifier: Apache-2.0.
 */

package software.amazon.smithy.aws.swift.codegen.ec2query.httpResponse

import software.amazon.smithy.aws.swift.codegen.AWSClientRuntimeTypes
import software.amazon.smithy.codegen.core.Symbol
import software.amazon.smithy.swift.codegen.integration.httpResponse.HTTPResponseBindingErrorGenerator

class AWSQueryHttpResponseBindingErrorGenerator : HTTPResponseBindingErrorGenerator() {

    override val serviceBaseErrorSymbol: Symbol = AWSClientRuntimeTypes.EC2Query.Ec2QueryError
}
