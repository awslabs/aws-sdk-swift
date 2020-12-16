/*
 * Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
 * SPDX-License-Identifier: Apache-2.0.
 */
import AwsCommonRuntimeKit

//TODO: flesh out this class more and possibly return creds provider differently.
public class AWSCredentialsProvider {
    let crtCredentialsProvider: CRTAWSCredentialsProvider
    
    init(awsCredentialsProvider: CRTAWSCredentialsProvider) {
        self.crtCredentialsProvider = awsCredentialsProvider
    }
    
    public static func fromEnv() throws -> AWSCredentialsProvider {
        let credsProvider = try CRTAWSCredentialsProvider(fromEnv: nil)
        return AWSCredentialsProvider(awsCredentialsProvider: credsProvider)
    }
    
//    public static func fromProfile() throws -> AWSCredentialsProvider {
//
//        let credsProvider = try CRTAWSCredentialsProvider(fromProfile: options)
//        return AWSCredentialsProvider(awsCredentialsProvider: credsProvider)
//    }
    
}
