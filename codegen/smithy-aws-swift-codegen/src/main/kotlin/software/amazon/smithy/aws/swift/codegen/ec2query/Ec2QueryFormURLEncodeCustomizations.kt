/*
 * Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
 * SPDX-License-Identifier: Apache-2.0.
 */

package software.amazon.smithy.aws.swift.codegen.ec2query

import software.amazon.smithy.model.shapes.Shape
import software.amazon.smithy.swift.codegen.integration.serde.formurl.FormURLEncodeCustomizable
import software.amazon.smithy.swift.codegen.integration.serde.formurl.trait.Ec2QueryNameTraitGenerator

class Ec2QueryFormURLEncodeCustomizations : FormURLEncodeCustomizable {
    override fun alwaysUsesFlattenedCollections(): Boolean {
        return true
    }
    override fun customNameTraitGenerator(memberShape: Shape, defaultName: String): String {
        return Ec2QueryNameTraitGenerator.construct(memberShape, defaultName).toString()
    }
}
