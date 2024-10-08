package software.amazon.smithy.aws.swift.codegen

import software.amazon.smithy.swift.codegen.integration.ProtocolGenerator
import software.amazon.smithy.swift.codegen.integration.SmokeTestGenerator

class AWSSmokeTestGenerator(
    ctx: ProtocolGenerator.GenerationContext
): SmokeTestGenerator(ctx) {

}