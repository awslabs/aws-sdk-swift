//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import AwsCommonRuntimeKit
import ClientRuntime
        
class CredentialsProviderCRTAdapter: CredentialsProviding {
    var allocator: Allocator
    let credentialsProvider: CredentialsProvider
    let logger: SwiftLogger
    private let sharedDefaultIO: SDKDefaultIO = SDKDefaultIO.shared
    
    init(credentialsProvider: CredentialsProvider) {
        self.credentialsProvider = credentialsProvider
        self.logger = SwiftLogger(label: "CustomCredentialProvider")
        self.allocator = defaultAllocator
    }
    
    func getCredentials() async throws -> Credentials {
        let credentials = try await credentialsProvider.getCredentials()
        return try credentials.toCRTType()
    }
}
