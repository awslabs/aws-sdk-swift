//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import AwsCommonRuntimeKit
import ClientRuntime
        
struct CredentialsProviderCRTAdapter: CRTCredentialsProvider {
    var allocator: Allocator
    let credentialsProvider: CredentialsProvider
    let logger: SwiftLogger
    init(credentialsProvider: CredentialsProvider) {
        self.credentialsProvider = credentialsProvider
        self.logger = SwiftLogger(label: "CustomCredentialProvider")
        self.allocator = defaultAllocator
    }
    
    func getCredentials(credentialCallbackData: CRTCredentialsCallbackData) {
        do {
            let credentialsResult = try credentialsProvider.getCredentials()
            let credentials = try credentialsResult.get()
            let emptyError = AWSError(errorCode: 0)
            let crtCredentials = credentials.toCRTType()
            credentialCallbackData.onCredentialsResolved?(crtCredentials, CRTError.crtError(emptyError))
        } catch let err {
            logger.error("An error occurred with retrieving credentials from your custom credentials provider. Error: \(err)")
            
            credentialCallbackData.onCredentialsResolved?(nil, CRTError.crtError(AWSError(errorCode: -1)))
        }
    }
}
