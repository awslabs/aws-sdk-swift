/*
 * Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
 * SPDX-License-Identifier: Apache-2.0.
 */

package software.amazon.smithy.aws.swift.codegen.awsquery

import software.amazon.smithy.model.shapes.Shape
import software.amazon.smithy.swift.codegen.integration.serde.formurl.FormURLEncodeCustomizable
import software.amazon.smithy.swift.codegen.integration.serde.xml.trait.XMLNameTraitGenerator

class AwsQueryFormURLEncodeCustomizations : FormURLEncodeCustomizable {
    override fun alwaysUsesFlattenedCollections(): Boolean {
        return false
    }

    override fun customNameTraitGenerator(memberShape: Shape, defaultName: String): String {
        return XMLNameTraitGenerator.construct(memberShape, defaultName).toString()
    }
}
