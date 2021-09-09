/*
 * Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
 * SPDX-License-Identifier: Apache-2.0.
 */
package software.amazon.smithy.aws.swift.codegen.restjson

import software.amazon.smithy.aws.swift.codegen.AWSHttpBindingProtocolGenerator
import software.amazon.smithy.aws.swift.codegen.AWSHttpProtocolClientCustomizableFactory
import software.amazon.smithy.aws.traits.protocols.RestJson1Trait
import software.amazon.smithy.model.shapes.ShapeId
import software.amazon.smithy.model.traits.TimestampFormatTrait
import software.amazon.smithy.swift.codegen.integration.codingKeys.CodingKeysCustomizationJsonName
import software.amazon.smithy.swift.codegen.integration.codingKeys.DefaultCodingKeysGenerator
import software.amazon.smithy.swift.codegen.integration.httpResponse.HttpResponseGenerator

class AWSRestJson1ProtocolGenerator : AWSHttpBindingProtocolGenerator() {
    override val codingKeysGenerator = DefaultCodingKeysGenerator(CodingKeysCustomizationJsonName())
    override val defaultContentType = "application/json"
    override val defaultTimestampFormat = TimestampFormatTrait.Format.EPOCH_SECONDS
    override val protocol: ShapeId = RestJson1Trait.ID
    override val httpProtocolCustomizable = AWSHttpProtocolClientCustomizableFactory().constructClientCustomizable(protocol)
    override val httpResponseGenerator = HttpResponseGenerator(
        unknownServiceErrorSymbol,
        defaultTimestampFormat,
        AWSRestJson1HttpResponseBindingErrorGeneratable()
    )
    override val serdeContext = serdeContextJSON
}
