//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import ClientRuntime

public typealias AWSCredentialsProvider = CredentialsProvider

/// An object responsible for providing credentials for an AWS service
/// Direct initailization is not supported.
/// Create instances using its static functions.
public struct CredentialsProvider {
    @_spi(Internal)
    public struct Configuration  {
        public let fileBasedConfigurationStore: CRTFiledBasedConfigurationStore
        
        public init(fileBasedConfigurationStore: CRTFiledBasedConfigurationStore) {
            self.fileBasedConfigurationStore = fileBasedConfigurationStore
        }
    }
    
    private var configuredProvider: CredentialsProviding?
    private var configureProvider: ((Configuration) async throws -> CredentialsProviding)?
    
    /// A string that identifies the credential provider
    /// This is useful for debugging and tests to verify type of credentials provider
    let identifier: String
        
    init(
        identifier: String,
        _ configureProvider: @escaping (Configuration) async throws -> CredentialsProviding
    ) {
        self.identifier = identifier
        self.configureProvider = configureProvider
    }
    
    @_spi(Internal)
    mutating public func configure(_ configuration: Configuration) async throws {
        guard let configureProvider = self.configureProvider else {
            throw ClientError.authError("The credential provider is already configured and can only be configured once.")
        }
        self.configuredProvider = try await configureProvider(configuration)
        self.configureProvider = nil
    }
}

extension CredentialsProvider: CredentialsProviding {
    /// Returns credentials for authenticating with an AWS service
    /// This with throw if the credentials provider isn't owned by a service client configuration.
    public func getCredentials() async throws -> Credentials {
        guard let configuredProvider = self.configuredProvider else {
            throw ClientError.authError("Unsupported access. Please use the credentials provider instance from the service client configuration for example: `client.config.credentialsProvider`")
        }
        
        return try await configuredProvider.getCredentials()
    }
}

@_spi(Internal)
public extension CredentialsProvider {
    /// Resolves the credential provider to use for a service client
    ///
    /// This uses the credential provider passed or the default chain provider if `nil`.
    /// It then configures the provider.
    /// This provides configuration options from the service client such as a file based configuration store (which is used to get the default file based configuration)
    ///
    /// - Parameters:
    ///   - credentialsProvider: An explicit credential provider to use or `nil`
    ///   - configuration: The configuration used to configure the credentials provider
    ///
    /// - Returns: A new configured credentials provider ready to be used by a service client.
    static func resolvedProvider(
        _ credentialsProvider: CredentialsProvider?,
        configuration: Configuration
    ) async throws -> CredentialsProvider {
        var resolvedCredentialsProvider = try credentialsProvider ?? .fromDefaultChain()
        try await resolvedCredentialsProvider.configure(configuration)
        return resolvedCredentialsProvider
    }
}
