package software.amazon.smithy.aws.swift.codegen.customization.dsql

import software.amazon.smithy.aws.swift.codegen.sdkId
import software.amazon.smithy.model.Model
import software.amazon.smithy.model.shapes.ServiceShape
import software.amazon.smithy.swift.codegen.SwiftDelegator
import software.amazon.smithy.swift.codegen.SwiftSettings
import software.amazon.smithy.swift.codegen.core.SwiftCodegenContext
import software.amazon.smithy.swift.codegen.integration.ProtocolGenerator
import software.amazon.smithy.swift.codegen.integration.SwiftIntegration
import software.amazon.smithy.swift.codegen.model.expectShape

class AuthTokenGeneratorIntegration : SwiftIntegration {
    override fun enabledForService(model: Model, settings: SwiftSettings): Boolean =
        model.expectShape<ServiceShape>(settings.service).sdkId == "DSQL"

    override fun writeAdditionalFiles(
        ctx: SwiftCodegenContext,
        protocolGenerationContext: ProtocolGenerator.GenerationContext,
        delegator: SwiftDelegator
    ) {
        delegator.useFileWriter("Sources/${ctx.settings.moduleName}/AuthTokenGenerator.swift") { writer ->
            val authTokenGeneratorWrapperClass = """
            @_spi(AuthTokenGenerator) import class AWSClientRuntime.AuthTokenGenerator
            import SmithyIdentity
            import struct Foundation.TimeInterval

            /// A utility class with methods that generate IAM authentication token used for connecting to DSQL.
            public class AuthTokenGenerator {
                private let generator: AWSClientRuntime.AuthTokenGenerator

                /// The initializer that takes in AWSCredentialIdentity struct to use to generate the IAM authentication token.
                public init(awsCredentialIdentity: AWSCredentialIdentity) {
                    self.generator = AWSClientRuntime.AuthTokenGenerator(awsCredentialIdentity: awsCredentialIdentity)
                }

                /// The initializer that takes in a specific AWSCredentialIdentityResolver, used to resolve the AWSCredentialIdentity used to generate the IAM authentication token.
                public init(awsCredentialIdentityResolver: any AWSCredentialIdentityResolver) async throws {
                    self.generator = try await AWSClientRuntime.AuthTokenGenerator(awsCredentialIdentityResolver: awsCredentialIdentityResolver)
                }

                /// Updates the AWS credentials used to generate the IAM auth token.
                public func updateCredentials(newAWSCredentialIdentity: AWSCredentialIdentity) {
                    generator.updateCredentials(newAWSCredentialIdentity: newAWSCredentialIdentity)
                }

                /// Updates the AWS credentials used to generate the IAM auth token by resolving credentials from passed in resolver.
                public func updateCredentials(awsCredentialIdentityResolver: any AWSCredentialIdentityResolver) async throws {
                    try await generator.updateCredentials(awsCredentialIdentityResolver: awsCredentialIdentityResolver)
                }

                /// Generates authenetication token for non-admin connection using given inputs to the method and credential identity instance variable.
                ///
                /// - Parameters:
                ///   - endpoint: The endpoint of the RDS instance. E.g., `peccy.dsql.us-east-1.on.aws`
                ///   - region: The region that RDS instance is located in. E.g., `us-east-1`
                ///   - expiration: The expiration for the token in seconds. Default is 900 seconds (15 minutes).
                public func generateDBConnectAuthToken(
                    endpoint: String,
                    region: String,
                    expiration: TimeInterval = 900
                ) async throws -> String {
                    return try await generator.generateDSQLAuthToken(
                        endpoint: endpoint,
                        region: region,
                        expiration: expiration,
                        isForAdmin: false
                    )
                }

                /// Generates authenetication token for admin connection using given inputs to the method and credential identity instance variable.
                ///
                /// - Parameters:
                ///   - endpoint: The endpoint of the RDS instance. E.g., `peccy.dsql.us-east-1.on.aws`
                ///   - region: The region that RDS instance is located in. E.g., `us-east-1`
                ///   - expiration: The expiration for the token in seconds. Default is 900 seconds (15 minutes).
                public func generateDBConnectAdminAuthToken(
                    endpoint: String,
                    region: String,
                    expiration: TimeInterval = 900
                ) async throws -> String {
                    return try await generator.generateDSQLAuthToken(
                        endpoint: endpoint,
                        region: region,
                        expiration: expiration,
                        isForAdmin: true
                    )
                }
            }
            """.trimIndent()
            writer.write(authTokenGeneratorWrapperClass)
        }
    }
}
