//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//
        
public protocol CredentialsProvider {
    /// Resolves `AWSCredentials` through custom means
    func getCredentials() throws -> AWSCredentials
}
