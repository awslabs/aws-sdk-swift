//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import AwsCommonRuntimeKit
import ClientRuntime
import Foundation

/// Creates a credentials provider that uses the provided the object confirming to `CredentialsProviding` to source the credentials.
struct CustomCredentialsProvider: CredentialsSourcedByCRT {
    let crtCredentialsProvider: CRTCredentialsProvider

    /// Creates a credentials provider that uses the provided the object confirming to `CredentialsProviding` to source the credentials.
    ///
    /// - Parameter provider: An object confirming to `CredentialsProviding` to source the credentials.
    ///
    /// - Returns: A credentials provider that uses the provided the object confirming to `CredentialsProviding` to source the credentials.
    init(_ provider: CredentialsProviding) throws {
        self.crtCredentialsProvider = try CRTCredentialsProvider(
            provider: CredentialsProvidingCRTAdapter(credentialsProvider: provider)
        )
    }
}
