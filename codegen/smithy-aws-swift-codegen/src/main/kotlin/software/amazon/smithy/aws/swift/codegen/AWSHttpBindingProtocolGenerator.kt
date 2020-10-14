/*
 * Copyright 2020 Amazon.com, Inc. or its affiliates. All Rights Reserved.
 *
 * Licensed under the Apache License, Version 2.0 (the "License").
 * You may not use this file except in compliance with the License.
 * A copy of the License is located at
 *
 *  http://aws.amazon.com/apache2.0
 *
 * or in the "license" file accompanying this file. This file is distributed
 * on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
 * express or implied. See the License for the specific language governing
 * permissions and limitations under the License.
 */
package software.amazon.smithy.aws.swift.codegen

import software.amazon.smithy.codegen.core.Symbol
import software.amazon.smithy.swift.codegen.integration.HttpBindingProtocolGenerator

/**
 * Base class for all AWS HTTP protocol generators
 */
abstract class AWSHttpBindingProtocolGenerator : HttpBindingProtocolGenerator() {
    override val serviceErrorProtocolSymbol: Symbol = Symbol.builder()
            .name("AWSHttpServiceError")
            .namespace(AWSSwiftDependency.AWS_CLIENT_RUNTIME.namespace, "")
            .addDependency(AWSSwiftDependency.AWS_CLIENT_RUNTIME)
            .build()

    override val unknownServiceErrorSymbol: Symbol = Symbol.builder()
            .name("UnknownAWSHttpServiceError")
            .namespace(AWSSwiftDependency.AWS_CLIENT_RUNTIME.namespace, "")
            .addDependency(AWSSwiftDependency.AWS_CLIENT_RUNTIME)
            .build()
}
