/*
 * Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
 * SPDX-License-Identifier: Apache-2.0
 */
package software.amazon.smithy.aws.swift.codegen.customization.rds

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
    override fun enabledForService(
        model: Model,
        settings: SwiftSettings,
    ): Boolean = model.expectShape<ServiceShape>(settings.service).sdkId == "RDS"

    override fun writeAdditionalFiles(
        ctx: SwiftCodegenContext,
        protocolGenerationContext: ProtocolGenerator.GenerationContext,
        delegator: SwiftDelegator,
    ) {
        delegator.useFileWriter("Sources/${ctx.settings.moduleName}/AuthTokenGenerator.swift") { writer ->
            val authTokenGeneratorWrapperClass =
                """
                @_spi(AuthTokenGenerator) import class AWSClientRuntime.AuthTokenGenerator
                import SmithyIdentity
                import struct Foundation.TimeInterval

                /// A utility class with a single utility method that generates IAM authentication token used for connecting to RDS.
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

                    /// Generates authenetication token using given inputs to the method and credential identity instance variable.
                    ///
                    /// - Parameters:
                    ///   - endpoint: The endpoint of the RDS instance. E.g., `rdsmysql.123456789012.us-west-2.rds.amazonaws.com`
                    ///   - port: The port of the RDS instance to connect to. E.g., `3306`
                    ///   - region: The region that RDS instance is located in. E.g., `us-west-2`
                    ///   - username: The username of the RDS database user. E.g., `admin`
                    ///   - expiration: The expiration for the token in seconds. Default is 900 seconds (15 minutes).
                    public func generateAuthToken(
                        endpoint: String,
                        port: UInt16,
                        region: String,
                        username: String,
                        expiration: TimeInterval = 900
                    ) async throws -> String {
                        return try await generator.generateRDSAuthToken(
                            endpoint: endpoint,
                            port: port,
                            region: region,
                            username: username,
                            expiration: expiration
                        )
                    }
                }
                """.trimIndent()
            writer.write(authTokenGeneratorWrapperClass)
        }
    }
}
