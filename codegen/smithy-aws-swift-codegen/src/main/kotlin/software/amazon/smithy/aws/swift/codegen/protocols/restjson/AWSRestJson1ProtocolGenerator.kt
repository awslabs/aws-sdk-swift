/*
 * Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
 * SPDX-License-Identifier: Apache-2.0.
 */
package software.amazon.smithy.aws.swift.codegen.protocols.restjson

import software.amazon.smithy.aws.swift.codegen.AWSHTTPBindingProtocolGenerator
import software.amazon.smithy.aws.traits.protocols.RestJson1Trait
import software.amazon.smithy.model.shapes.MemberShape
import software.amazon.smithy.model.shapes.Shape
import software.amazon.smithy.model.shapes.ShapeId
import software.amazon.smithy.swift.codegen.integration.ProtocolGenerator
import software.amazon.smithy.swift.codegen.integration.isInHttpBody

class AWSRestJson1ProtocolGenerator : AWSHTTPBindingProtocolGenerator(RestJSONCustomizations()) {
    override val defaultContentType = "application/json"
    override val protocol: ShapeId = RestJson1Trait.ID
    override val protocolTestsToIgnore =
        setOf(
            "SDKAppliedContentEncoding_restJson1",
            "SDKAppendedGzipAfterProvidedEncoding_restJson1",
            "RestJsonClientPopulatesDefaultValuesInInput", // TODO: broken in Smithy 1.53.0
            "RestJsonClientPopulatesDefaultsValuesWhenMissingInResponse", // TODO: broken in Smithy 1.53.0
        )

    override fun httpBodyMembers(ctx: ProtocolGenerator.GenerationContext, shape: Shape): List<MemberShape> {
        return shape
            .members()
            .filter { it.isInHttpBody() }
            .toList()
    }
}
