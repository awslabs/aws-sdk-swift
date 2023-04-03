//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import AwsCommonRuntimeKit
import ClientRuntime
import Foundation

// MARK: - Helpers

private extension CredentialsProvider {
    static var bootstrap: ClientBootstrap { SDKDefaultIO.shared.clientBootstrap }
    static var tlsContext: TLSContext { SDKDefaultIO.shared.tlsContext }
}

// MARK: - Custom

public extension CredentialsProvider {
    /// Creates a credentials provider that uses the provided the object confirming to `CredentialsProviding` to source the credentials.
    ///
    /// - Parameter provider: An object confirming to `CredentialsProviding` to source the credentials.
    ///
    /// - Returns: A credentials provider that uses the provided the object confirming to `CredentialsProviding` to source the credentials.
    static func custom(_ provider: CredentialsProviding) -> Self {
        .makeWithCRTCredentialsProvider(identifier: "Custom") { _ in
            try CRTCredentialsProvider(
                provider: CredentialsProviderCRTAdapter(credentialsProvider: provider)
            )
        }
    }
}

// MARK: - Static Credentials Provider

public extension CredentialsProvider {
    /// Creates a credentials provider for a fixed set of credentials
    ///
    /// - Parameter credentials: The credentials that this provider will provide.
    ///
    /// - Returns: A credentials provider for a fixed set of credentials
    static func fromStatic(_ credentials: Credentials) throws -> CredentialsProvider {
        .makeWithCRTCredentialsProvider(identifier: "Static") { _ in
            try CRTCredentialsProvider(source: .static(
                accessKey: credentials.accessKey,
                secret: credentials.secret,
                sessionToken: credentials.sessionToken
            ))
        }
    }
}

// MARK: - Environment Credentials Provider

public extension CredentialsProvider {
    /// Creates a credentials provider that sources credentials from the following environment variables:
    /// - `AWS_ACCESS_KEY_ID`
    /// - `AWS_SECRET_ACCESS_KEY`
    /// - `AWS_SESSION_TOKEN`
    static func fromEnv() throws -> Self {
        .makeWithCRTCredentialsProvider(identifier: "Environment") { _ in
            try CRTCredentialsProvider(source: .environment())
        }
    }
}

// MARK: - Profile Credentials Provider

public extension CredentialsProvider {
    /// Options to configure the profile credentials provider
    struct ProfileOptions {
        /// The profile name to use. If not provided it will be resolved internally via the `AWS_PROFILE` environment variable or defaulted to `default` if not configured.
        public let profileName: String?
        /// The path to the configuration file to use. If not provided it will be resolved internally via the `AWS_CONFIG_FILE` environment variable or defaulted  to `~/.aws/config` if not configured.
        public let configFilePath: String?
        /// The path to the shared credentials file to use. If not provided it will be resolved internally via the `AWS_SHARED_CREDENTIALS_FILE` environment variable or defaulted `~/.aws/credentials` if not configured.
        public let credentialsFilePath: String?
        
        /// Creates options to configure the profile credentials provider
        ///
        /// - Parameters:
        ///   - profileName: The profile name to use. If not provided it will be resolved internally via the `AWS_PROFILE` environment variable or defaulted to `default` if not configured.
        ///   - configFilePath: The path to the configuration file to use. If not provided it will be resolved internally via the `AWS_CONFIG_FILE` environment variable or defaulted  to `~/.aws/config` if not configured.
        ///   - credentialsFilePath: The path to the shared credentials file to use. If not provided it will be resolved internally via the `AWS_SHARED_CREDENTIALS_FILE` environment variable or defaulted `~/.aws/credentials` if not configured.
        public init(
            profileName: String? = nil,
            configFilePath: String? = nil,
            credentialsFilePath: String? = nil
        ) {
            self.profileName = profileName
            self.configFilePath = configFilePath
            self.credentialsFilePath = credentialsFilePath
        }
    }
    
    /// A credentials provider that gets credentials from a profile in `~/.aws/config` or the shared credentials file `~/.aws/credentials`.
    /// The locations of these files are configurable via environment variables or via `ProfileOptions`.
    ///
    /// This provider supports several credentials formats:
    /// ### Credentials defined explicitly within the file
    /// ```ini
    /// [default]
    /// aws_access_key_id = my-access-key
    /// aws_secret_access_key = my-secret
    /// ```
    ///
    /// ### Assumed role credentials loaded from a credential source
    /// ```ini
    /// [default]
    /// role_arn = arn:aws:iam:123456789:role/RoleA
    /// credential_source = Environment
    /// ```
    ///
    /// ### Assumed role credentials from a source profile
    /// ```ini
    /// [default]
    /// role_arn = arn:aws:iam:123456789:role/RoleA
    /// source_profile = base
    ///
    /// [profile base]
    /// aws_access_key_id = my-access-key
    /// aws_secret_access_key = my-secret
    /// ```
    ///
    /// For more complex configurations see [Configuration and credential file settings](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-files.html)
    ///
    /// - Parameter options: Options that configure the credentials provider.
    ///
    /// - Returns: A credentials provider that gets credentials from a profile.
    static func fromProfile(_ options: ProfileOptions = .init()) throws -> Self {
        .makeWithCRTCredentialsProvider(identifier: "Profile") { dependencies in
            let fileBasedConfiguration = try await dependencies.fileBasedConfigurationStore._fileBasedConfiguration(
                configFilePath: options.configFilePath,
                credentialsFilePath: options.credentialsFilePath
            )
            
            return try CRTCredentialsProvider(source: .profile(
                bootstrap: bootstrap,
                fileBasedConfiguration: fileBasedConfiguration,
                profileFileNameOverride: options.profileName
            ))
        }
    }
}

// MARK: - STS Assume Role

public extension CredentialsProvider {
    ///  Options to configure a STS assume role credential provider
    struct STSOptions {
        /// The underlying credentials provider to be used to sign the requests made to STS
        public let credentialsProvider: CredentialsProvider
        
        /// The ARN of the target role to assume, e.g. `arn:aws:iam:123456789:role/example`
        public let roleArn: String
        
        /// The name to associate with the session. This is used to uniquely identify a session when the same role is assumed by different principals
        /// or for different reasons. In cross-account scenarios, the session name is visible to, and can be logged by the account that owns the role.
        /// The role session name is also in the ARN of the assumed role principal.
        public let sessionName: String
        
        /// The expiry duration of the STS credentials. Defaults to 15 minutes if not set.
        public let durationSeconds: TimeInterval
        
        /// Creates options to connfigure a STS assume role credential provider
        ///
        /// - Parameters:
        ///   - credentialsProvider: The underlying credentials provider to be used to sign the requests made to STS
        ///   - roleArn: The ARN of the target role to assume, e.g. `arn:aws:iam:123456789:role/example`
        ///   - sessionName: The name to associate with the session.
        ///   - durationSeconds: The expiry duration of the STS credentials. Defaults to 15 minutes if not set.
        public init(
            credentialsProvider: CredentialsProvider,
            roleArn: String,
            sessionName: String,
            durationSeconds: TimeInterval = .minutes(15)
        ) {
            self.credentialsProvider = credentialsProvider
            self.roleArn = roleArn
            self.sessionName = sessionName
            self.durationSeconds = durationSeconds
        }
    }
    
    /// Creates a credential provider that uses another provider to assume a role from the AWS Security Token Service (STS).
    ///
    /// When asked to provide credentials, this provider will first invoke the inner credentials provider to get AWS credentials for STS.
    /// Then, it will call STS to get assumed credentials for the desired role.
    ///
    /// For more information see [Assume role credential provider](https://docs.aws.amazon.com/sdkref/latest/guide/feature-assume-role-credentials.html)
    ///
    /// - Parameter options: Options that configure the credentials provider.
    ///
    /// - Returns: A credential provider that uses another provider to assume a role from the AWS Security Token Service (STS).
    static func fromSTS(_ options: STSOptions) throws -> CredentialsProvider {
        .makeWithCRTCredentialsProvider(identifier: "STS Assume Role") { configuration in
            var provider = options.credentialsProvider
            try await provider.configure(configuration)
            
            let adapter = CredentialsProviderCRTAdapter(credentialsProvider: provider)
                        
            return try CRTCredentialsProvider(source: .sts(
                bootstrap: bootstrap,
                tlsContext: tlsContext,
                credentialsProvider: .init(provider: adapter),
                roleArn: options.roleArn,
                sessionName: options.sessionName,
                duration: options.durationSeconds
            ))
        }
    }
}

// MARK: - STS Web Identity

public extension CredentialsProvider {
    /// Options to configure a STS Web Identity credential provider
    struct WebIdentityOptions {
        /// The path to the configuration file to use. If not provided it will be resolved internally via the `AWS_CONFIG_FILE` environment variable or defaulted  to `~/.aws/config` if not configured.
        public let configFilePath: String?
        /// The path to the shared credentials file to use. If not provided it will be resolved internally via the `AWS_SHARED_CREDENTIALS_FILE` environment variable or defaulted `~/.aws/credentials` if not configured.
        public let credentialsFilePath: String?
        
        /// Creates options to configure a STS Web Identity credential provider
        ///
        /// - Parameters:
        ///   - configFilePath: The path to the configuration file to use. If not provided it will be resolved internally via the `AWS_CONFIG_FILE` environment variable or defaulted  to `~/.aws/config` if not configured.
        ///   - credentialsFilePath: The path to the shared credentials file to use. If not provided it will be resolved internally via the `AWS_SHARED_CREDENTIALS_FILE` environment variable or defaulted `~/.aws/credentials` if not configured.
        public init(
            configFilePath: String? = nil,
            credentialsFilePath: String? = nil
        ) {
            self.configFilePath = configFilePath
            self.credentialsFilePath = credentialsFilePath
        }
    }
    
    /// Creates a credential provider that exchanges a Web Identity Token for credentials from the AWS Security Token Service (STS).
    ///
    /// It depends on the following values sourced from either environment variables or the configuration file"
    /// - region: `AWS_DEFAULT_REGION` environment variable or `region`  in a configuration file
    /// - role arn: `AWS_ROLE_ARN` environment variable or `role_arn`  in  a configuration file
    /// - role session name: `AWS_ROLE_SESSION_NAME` environment variable or `role_session_name` in a configuration file
    /// - token file path: `AWS_WEB_IDENTITY_TOKEN_FILE` environment variable or `web_identity_token_file` in a configuration file
    ///
    /// For more information see [AssumeRoleWithWebIdentity](https://docs.aws.amazon.com/STS/latest/APIReference/API_AssumeRoleWithWebIdentity.html)
    ///
    /// - Parameter options: Options that configure the credentials provider.
    ///
    /// - Returns: A credential provider that exchanges a Web Identity Token for credentials from the AWS Security Token Service (STS).
    static func fromWebIdentity(_ options: WebIdentityOptions = .init()) throws -> CredentialsProvider {
        .makeWithCRTCredentialsProvider(identifier: "STS Web Identity") { dependencies in
            let fileBasedConfiguration = try await dependencies.fileBasedConfigurationStore._fileBasedConfiguration(
                configFilePath: options.configFilePath,
                credentialsFilePath: options.credentialsFilePath
            )
            
            return try CRTCredentialsProvider(source: .stsWebIdentity(
                bootstrap: bootstrap,
                tlsContext: tlsContext,
                fileBasedConfiguration: fileBasedConfiguration,
                shutdownCallback: nil
            ))
        }
    }
}

// MARK: - Container

// TODO uncomment when CRT fixes https://github.com/awslabs/aws-crt-swift/issues/174
//public extension CredentialsProvider {
//
//    struct ContainerOptions {
//        public let pathAndQuery: String
//        public let host: String?
//        public let authToken: String?
//
//        public init(
//            pathAndQuery: String,
//            host: String? = nil,
//            authToken: String? = nil
//        ) {
//            self.pathAndQuery = pathAndQuery
//            self.host = host
//            self.authToken = authToken
//        }
//    }
//
//    /// Creates a credential provider that sources credentials from a local metadata service.
//    /// It will attempt to load credentials from the specified HTTP endpoint through a GET request
//    ///
//    /// This provider is frequently used with an AWS-provided credentials service such as Amazon Container Service (ECS).
//    /// However, it is possible to use environment variables to configure this provider to use any local metadata service.
//    ///
//    /// - AWS_CONTAINER_CREDENTIALS_FULL_URI
//    ///     -  Contains the full HTTP URL endpoint for the SDK to use when making a request for credentials. This includes both the scheme and the host.
//    ///
//    /// - AWS_CONTAINER_CREDENTIALS_RELATIVE_URI
//    ///     - Specifies the relative HTTP URL endpoint for the SDK to use when making a request for credentials.
//    ///
//    /// - AWS_CONTAINER_AUTHORIZATION_TOKEN
//    ///     - If this variable is set, the SDK will set the Authorization header on the HTTP request with the environment variable's value.
//    ///
//    /// For more information on configuring a container credential provider see [Container credential provider](https://docs.aws.amazon.com/sdkref/latest/guide/feature-container-credentials.html)
//    ///
//    /// For more information on configuring ECS credentials see [IAM Roles for tasks](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/task-iam-roles.html)
//    ///
//    /// - Parameter options: Options that configure the credentials provider.
//    ///
//    /// - Returns: A credential provider that sources credentials from a local metadata service.
//    static func fromContaienr(_ options: ContainerOptions) throws -> CredentialsProvider {
//        .makeWithCRTCredentialsProvider { _ in
//            try CRTCredentialsProvider(source: .ecs(
//                bootstrap: bootstrap,
//                authToken: options.authToken,
//                pathAndQuery: options.pathAndQuery,
//                host: options.host
//            ))
//        }
//    }
//}

// MARK: - Cached

public extension CredentialsProvider {
    /// Options to configure a cached credentials provider
    struct CachedOptions {
        /// The source credentials provider to get the credentials.
        public let source: CredentialsProvider
        
        /// The number of seconds that must pass before new credentials will be fetched again.
        /// If the credentials are queried during this time period, then the cached credentials are returned.
        public let refreshTime: TimeInterval
        
        /// Creates options to configure  a cached credentials provider
        ///
        /// - Parameters:
        ///   - source: The source credentials provider to get the credentials.
        ///   - refreshTime: The number of seconds that must pass before new credentials will be fetched again.
        public init(
            source: CredentialsProvider,
            refreshTime: TimeInterval
        ) {
            self.source = source
            self.refreshTime = refreshTime
        }
    }

    /// Creates a credentials provider that caches the credentials sourced from the provided credentials provider.
    /// Credentials sourced through this provider will be cached within it until their expiration time.
    /// When the cached credentials expire, new credentials will be fetched when next queried.
    ///
    /// - Parameter options: Options that configure the credentials provider.
    ///
    /// - Returns: A credentials provider that caches the credentials sourced from the provided credentials provider.
    static func fromCached(_ options: CachedOptions) throws -> CredentialsProvider {
        .makeWithCRTCredentialsProvider(identifier: "Cached") { configuration in
            var provider = options.source
            try await provider.configure(configuration)
            
            let adapter = CredentialsProviderCRTAdapter(credentialsProvider: provider)
            
            return try CRTCredentialsProvider(source: .cached(
                source: .init(provider: adapter),
                refreshTime: options.refreshTime
            ))
        }
    }
}

// MARK: - Default Chain

public extension CredentialsProvider {
    /// Creates a credential provider that uses the default AWS credential provider chain used by most AWS SDKs.
    /// This is provider is by default when no credential provider is provided when creating a service client.
    ///
    /// The chain resolves in the following order:
    /// 1. Environment
    /// 2. Profile
    /// 3. Web Identity Tokens (STS Web Identity)
    /// 4. ECS (IAM roles for tasks)
    /// 5. EC2 Instance Metadata (IMDSv2)
    ///
    /// The credentials retrieved from the chain are cached for 15 minutes.
    ///
    /// - Returns: A credential provider that uses the default AWS credential provider chain used by most AWS SDKs.
    static func fromDefaultChain() throws -> CredentialsProvider {
        .makeWithCRTCredentialsProvider(identifier: "Default Chain") { dependencies in
            let fileBasedConfiguration = try await dependencies.fileBasedConfigurationStore._fileBasedConfiguration()
            
            return try CRTCredentialsProvider(source: .defaultChain(
                bootstrap: bootstrap,
                fileBasedConfiguration: fileBasedConfiguration
            ))
        }
    }
}
