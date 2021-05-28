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
    
    public static func fromProfile(options: AWSCredentialsProviderProfileOptions = AWSCredentialsProviderProfileOptions()) throws -> AWSCredentialsProvider {
        let credsProvider = try CRTAWSCredentialsProvider(fromProfile: options.toCRTType())
        return AWSCredentialsProvider(awsCredentialsProvider: credsProvider)
    }
    
    public static func fromStatic(config: AWSCredentialsProviderStaticConfig) throws -> AWSCredentialsProvider {
        let credsProvider = try CRTAWSCredentialsProvider(fromStatic: config.toCRTType())
        return AWSCredentialsProvider(awsCredentialsProvider: credsProvider)
    }
    
    public static func fromStatic(credentials: AWSCredentials) throws -> AWSCredentialsProvider {
        guard let accessKey = credentials.accessKey,
              let secret = credentials.secret,
              let sessionToken = credentials.sessionToken else {
            throw ClientError.authError("To create a credentials provider from static credentials, please pass in an access key, secret, and session token")
        }
        let config = AWSCredentialsProviderStaticConfig(accessKey: accessKey,
                                                        secret: secret,
                                                        sessionToken: sessionToken)
        let credsProvider = try CRTAWSCredentialsProvider(fromStatic: config.toCRTType())
        return AWSCredentialsProvider(awsCredentialsProvider: credsProvider)
    }
    
    public static func fromCached(config: AWSCredentialsProviderCachedConfig) throws -> AWSCredentialsProvider {
        var cachedConfig = config.toCRTType()
        let credsProvider = try CRTAWSCredentialsProvider(fromCached: &cachedConfig)
        return AWSCredentialsProvider(awsCredentialsProvider: credsProvider)
    }
    
    public static func fromChain(config: AWSCredentialsProviderChainDefaultConfig) throws -> AWSCredentialsProvider {
        let credsProvider = try CRTAWSCredentialsProvider(fromChainDefault: config.toCRTType())
        return AWSCredentialsProvider(awsCredentialsProvider: credsProvider)
    }
    
    public func getCredentials() throws -> AWSCredentials {
         let credentials = crtCredentialsProvider.getCredentials()
         let result = try credentials.get()
        return AWSCredentials(accessKey: result.getAccessKey(),
                              secret: result.getSecret(),
                              sessionToken: result.getSessionToken(),
                              expirationTimeout: Int(result.getExpirationTimeout()))
    }
}
