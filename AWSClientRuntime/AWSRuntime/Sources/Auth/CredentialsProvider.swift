//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import Runtime
        
public protocol CredentialsProvider {
    /// Resolves `AWSCredentials` through custom means
    func getCredentials() throws -> SdkFuture<AWSCredentials>
}
