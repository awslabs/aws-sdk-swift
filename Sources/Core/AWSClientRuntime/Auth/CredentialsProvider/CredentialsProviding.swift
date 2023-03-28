//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import ClientRuntime

/// A type that can provide credentials for authenticating with an AWS service
public protocol CredentialsProviding {
    /// Returns credentials for authenticating with an AWS service
    func getCredentials() async throws -> Credentials
}
