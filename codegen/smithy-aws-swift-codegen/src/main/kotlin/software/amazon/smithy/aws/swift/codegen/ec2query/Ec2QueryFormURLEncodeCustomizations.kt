package software.amazon.smithy.aws.swift.codegen.ec2query

import software.amazon.smithy.swift.codegen.integration.serde.formurl.FormURLEncodeCustomizable

class Ec2QueryFormURLEncodeCustomizations : FormURLEncodeCustomizable {
    override fun alwaysUsesFlattenedCollections(): Boolean {
        return true
    }
}
