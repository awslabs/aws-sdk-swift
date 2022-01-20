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
    private let sharedDefaultIO: SDKDefaultIO = SDKDefaultIO.shared
    
    init(credentialsProvider: CredentialsProvider) {
        self.credentialsProvider = credentialsProvider
        self.logger = SwiftLogger(label: "CustomCredentialProvider")
        self.allocator = defaultAllocator
    }
    
    func getCredentials() async throws -> CRTCredentials {
        let credentials = try await credentialsProvider.getCredentials()
        return credentials.toCRTType()
    }
}
