package software.amazon.smithy.aws.swift.codegen.awsquery

import software.amazon.smithy.swift.codegen.integration.serde.formurl.FormURLEncodeCustomizable

class AwsQueryFormURLEncodeCustomizations : FormURLEncodeCustomizable {
    override fun alwaysUsesFlattenedCollections(): Boolean {
        return false
    }
}
