/*
 * Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
 * SPDX-License-Identifier: Apache-2.0.
 */

package software.amazon.smithy.aws.swift.codegen.restxml

import software.amazon.smithy.aws.swift.codegen.AWSHttpProtocolCustomizations
import software.amazon.smithy.swift.codegen.integration.ClientProperty

class AWSHttpProtocolRestXMLCustomizations : AWSHttpProtocolCustomizations() {

    override fun getClientProperties(): List<ClientProperty> {
        return listOf<ClientProperty>()
    }
}
