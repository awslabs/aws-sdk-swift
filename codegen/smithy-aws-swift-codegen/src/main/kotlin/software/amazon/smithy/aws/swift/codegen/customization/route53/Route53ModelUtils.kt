package software.amazon.smithy.aws.swift.codegen.customization.route53

import software.amazon.smithy.swift.codegen.SwiftSettings

val SwiftSettings.isRoute53: Boolean
    get() = sdkId.lowercase() == "route 53"
