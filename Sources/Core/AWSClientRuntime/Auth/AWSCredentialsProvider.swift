/*
 * Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
 * SPDX-License-Identifier: Apache-2.0.
 */
import AwsCommonRuntimeKit
import ClientRuntime

public class AWSCredentialsProvider: CredentialsProvider {
    let crtCredentialsProvider: AwsCommonRuntimeKit.CredentialsProvider
    
    init(awsCredentialsProvider: AwsCommonRuntimeKit.CredentialsProvider) {
        self.crtCredentialsProvider = awsCredentialsProvider
    }
    
    public static func fromEnv() throws -> AWSCredentialsProvider {
        let credsProvider = try AwsCommonRuntimeKit.CredentialsProvider(source: .environment())
        return AWSCredentialsProvider(awsCredentialsProvider: credsProvider)
    }
    
    public static func fromProfile(
        _ options: AWSCredentialsProviderProfileOptions = AWSCredentialsProviderProfileOptions()
    ) throws -> AWSCredentialsProvider {
        let credsProvider = try AwsCommonRuntimeKit.CredentialsProvider(source: .profile(
            configFileNameOverride: options.configFileNameOverride,
            profileFileNameOverride: options.profileFileNameOverride,
            credentialsFileNameOverride: options.credentialsFileNameOverride,
            shutdownCallback: options.shutdownCallback
        ))
        return AWSCredentialsProvider(awsCredentialsProvider: credsProvider)
    }
    
    public static func fromStatic(_ config: AWSCredentialsProviderStaticConfig) throws -> AWSCredentialsProvider {
        let credsProvider = try AwsCommonRuntimeKit.CredentialsProvider(source: .static(
            accessKey: config.accessKey,
            secret: config.secret,
            sessionToken: config.sessionToken,
            shutdownCallback: config.shutDownCallback
        ))
        return AWSCredentialsProvider(awsCredentialsProvider: credsProvider)
    }
    
    public static func fromStatic(_ credentials: AWSCredentials) throws -> AWSCredentialsProvider {
        let credsProvider = try AwsCommonRuntimeKit.CredentialsProvider(source: .static(
            accessKey: credentials.accessKey,
            secret: credentials.secret,
            sessionToken: credentials.sessionToken
        ))
        return AWSCredentialsProvider(awsCredentialsProvider: credsProvider)
    }
    
    public static func fromWebIdentity(shutDownCallback: ShutDownCallback? = nil) throws -> AWSCredentialsProvider {
        let config = try AWSCredentialsProviderWebIdentityConfig(shutDownCallback: shutDownCallback)
        let credsProvider = try AwsCommonRuntimeKit.CredentialsProvider(source: .stsWebIdentity(
            bootstrap: SDKDefaultIO.shared.clientBootstrap,
            tlsContext: SDKDefaultIO.shared.tlsContext,
            shutdownCallback: config.shutDownCallback
        ))
        return AWSCredentialsProvider(awsCredentialsProvider: credsProvider)
    }
    
    public static func fromSTS(_ config: AWSCredentialsProviderSTSConfig) throws -> AWSCredentialsProvider {
        let credsProvider = try AwsCommonRuntimeKit.CredentialsProvider(source: .sts(
            bootstrap: SDKDefaultIO.shared.clientBootstrap,
            tlsContext: SDKDefaultIO.shared.tlsContext,
            credentialsProvider: config.credentialsProvider.crtCredentialsProvider,
            roleArn: config.roleArn,
            sessionName: config.sessionName,
            duration: config.durationSeconds,
            shutdownCallback: config.shutDownCallback
        ))
        return AWSCredentialsProvider(awsCredentialsProvider: credsProvider)
    }
    
    public static func fromContainer(
        _ config: AWSCredentialsProviderContainerConfig
    ) throws -> AWSCredentialsProvider {
        let credsProvider = try AwsCommonRuntimeKit.CredentialsProvider(source: .ecs(
            bootstrap: SDKDefaultIO.shared.clientBootstrap,
            tlsContext: SDKDefaultIO.shared.tlsContext,
            authToken: config.authToken,
            pathAndQuery: config.pathAndQuery,
            host: config.host,
            shutdownCallback: config.shutDownCallback
        ))
        return AWSCredentialsProvider(awsCredentialsProvider: credsProvider)
    }
    
    public static func fromCached(_ config: AWSCredentialsProviderCachedConfig) throws -> AWSCredentialsProvider {
        let credsProvider = try AwsCommonRuntimeKit.CredentialsProvider(source: .cached(
            source: config.source.crtCredentialsProvider,
            refreshTime: config.refreshTime,
            shutdownCallback: config.shutDownCallback
        ))
        return AWSCredentialsProvider(awsCredentialsProvider: credsProvider)
    }
    
    public static func fromChain(shutDownCallback: ShutDownCallback? = nil) throws -> AWSCredentialsProvider {
        let config = AWSCredentialsProviderChainDefaultConfig(shutDownCallback: shutDownCallback)
        let credsProvider = try AwsCommonRuntimeKit.CredentialsProvider(source: .defaultChain(
            bootstrap: SDKDefaultIO.shared.clientBootstrap,
            shutdownCallback: config.shutDownCallback
        ))
        return AWSCredentialsProvider(awsCredentialsProvider: credsProvider)
    }
    
    public static func fromCustom(_ credentialsProvider: CredentialsProvider) throws -> AWSCredentialsProvider {
        let crtCredentialsProviderWrapper = CredentialsProviderCRTAdapter(credentialsProvider: credentialsProvider)
        let credsProvider = try AwsCommonRuntimeKit.CredentialsProvider(provider: crtCredentialsProviderWrapper)
        return AWSCredentialsProvider(awsCredentialsProvider: credsProvider)
    }
    
    public func getCredentials() async throws -> AWSCredentials {
        let crtCredentials = try await crtCredentialsProvider.getCredentials()
        
        guard
            let accessKey = crtCredentials.getAccessKey(),
            let secret = crtCredentials.getSecret()
        else {
            throw ClientError.authError("Unable to get credentials.  Required: accessKey, secret.")
        }
        
        return AWSCredentials(
            accessKey: accessKey,
            secret: secret,
            expirationTimeout: crtCredentials.getExpiration(),
            sessionToken: crtCredentials.getSessionToken()
        )
    }
}
