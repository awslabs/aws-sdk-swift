/*
 * Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
 * SPDX-License-Identifier: Apache-2.0.
 */
import AwsCommonRuntimeKit
import ClientRuntime

public class AWSCredentialsProvider {
    let crtCredentialsProvider: CRTAWSCredentialsProvider
    
    init(awsCredentialsProvider: CRTAWSCredentialsProvider) {
        self.crtCredentialsProvider = awsCredentialsProvider
    }
    
    public static func fromEnv() throws -> AWSCredentialsProvider {
        let credsProvider = try CRTAWSCredentialsProvider(fromEnv: nil)
        return AWSCredentialsProvider(awsCredentialsProvider: credsProvider)
    }
    
    public static func fromProfile(_ options: AWSCredentialsProviderProfileOptions = AWSCredentialsProviderProfileOptions()) throws -> AWSCredentialsProvider {
        let credsProvider = try CRTAWSCredentialsProvider(fromProfile: options.toCRTType())
        return AWSCredentialsProvider(awsCredentialsProvider: credsProvider)
    }
    
    public static func fromStatic(_ config: AWSCredentialsProviderStaticConfig) throws -> AWSCredentialsProvider {
        let credsProvider = try CRTAWSCredentialsProvider(fromStatic: config.toCRTType())
        return AWSCredentialsProvider(awsCredentialsProvider: credsProvider)
    }
    
    public static func fromStatic(_ credentials: AWSCredentials) throws -> AWSCredentialsProvider {
        guard let accessKey = credentials.accessKey,
              let secret = credentials.secret,
              let sessionToken = credentials.sessionToken else {
            throw ClientError.authError("Unable to create static credentials provider.  Required: accessKey, secret, and sessionToken.")
        }
        let config = AWSCredentialsProviderStaticConfig(accessKey: accessKey,
                                                        secret: secret,
                                                        sessionToken: sessionToken)
        let credsProvider = try CRTAWSCredentialsProvider(fromStatic: config.toCRTType())
        return AWSCredentialsProvider(awsCredentialsProvider: credsProvider)
    }
    
    public static func fromCached(_ config: AWSCredentialsProviderCachedConfig) throws -> AWSCredentialsProvider {
        var cachedConfig = config.toCRTType()
        let credsProvider = try CRTAWSCredentialsProvider(fromCached: &cachedConfig)
        return AWSCredentialsProvider(awsCredentialsProvider: credsProvider)
    }
    
    public static func fromChain(shutDownCallback: ShutDownCallback? = nil) throws -> AWSCredentialsProvider {
        let config = AWSCredentialsProviderChainDefaultConfig(shutDownCallback: shutDownCallback)
        let credsProvider = try CRTAWSCredentialsProvider(fromChainDefault: config.toCRTType())
        return AWSCredentialsProvider(awsCredentialsProvider: credsProvider)
    }
    
    public func getCredentials() throws -> AWSCredentials {
        let credentials = crtCredentialsProvider.getCredentials()
        let result = try credentials.get()
        return AWSCredentials(accessKey: result.getAccessKey(),
                              secret: result.getSecret(),
                              sessionToken: result.getSessionToken(),
                              expirationTimeout: result.getExpirationTimeout())
    }
}
