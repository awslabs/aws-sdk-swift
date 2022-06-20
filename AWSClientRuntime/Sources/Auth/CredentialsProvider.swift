//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import ClientRuntime
        
public protocol CredentialsProvider {
    /// Resolves `AWSCredentials` through custom means
    func getCredentials() async throws -> AWSCredentials
}
