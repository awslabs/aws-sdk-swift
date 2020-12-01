package software.amazon.smithy.aws.swift.codegen

import software.amazon.smithy.codegen.core.Symbol
import software.amazon.smithy.model.shapes.StructureShape
import software.amazon.smithy.swift.codegen.BOXED_KEY
import software.amazon.smithy.swift.codegen.integration.ConfigField

val REGION_CONFIG_NAME = "region"
val CREDENTIALS_PROVIDER_CONFIG_NAME = "credentialsProvider"
val SIGNING_REGION_CONFIG_NAME = "signingRegion"


val AWS_CONFIG_FIELDS = listOf(
    ConfigField(REGION_CONFIG_NAME, "String", "The region to send requests to. (Required)"),
    ConfigField(CREDENTIALS_PROVIDER_CONFIG_NAME, "AWSCredentialsProvider",
        "The credentials provider to use to authenticate requests."),
    ConfigField(SIGNING_REGION_CONFIG_NAME, "String", "The region to sign requests in. (Required)")
)
