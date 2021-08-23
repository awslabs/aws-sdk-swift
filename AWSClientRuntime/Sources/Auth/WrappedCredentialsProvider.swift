//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import AwsCommonRuntimeKit
import ClientRuntime
        
struct WrappedCredentialsProvider: CRTCredentialsProvider {
    var allocator: Allocator
    let credentialsProvider: CredentialsProvider
    let logger: SwiftLogger
    init(credentialsProvider: CredentialsProvider) {
        self.credentialsProvider = credentialsProvider
        self.logger = SwiftLogger(label: "CustomCredentialProvider")
        self.allocator = defaultAllocator
    }
    
    func getCredentials(credentialCallbackData: CRTCredentialsProviderCallbackData) {
        do {
            let credentials = try credentialsProvider.getCredentials()
            let emptyError = AWSError(errorCode: 0)
            credentialCallbackData.onCredentialsResolved?(credentials.toCRTType(), CRTError.crtError(emptyError))
        } catch let err {
            logger.log(level: .debug, "An error occurred with retrieving credentials from your custom credentials provider. Error: \(err)")
            
            credentialCallbackData.onCredentialsResolved?(nil, CRTError.crtError(AWSError(errorCode: -1)))
        }
        
    }
}
