//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import AwsCommonRuntimeKit
import ClientRuntime
import Foundation

protocol CredentialsSourcedByCRT: CredentialsProviding {
    var crtCredentialsProvider: CRTCredentialsProvider { get }
}

extension CredentialsSourcedByCRT {
    public func getCredentials() async throws -> Credentials {
        let crtCredentials = try await crtCredentialsProvider.getCredentials()
        return try .init(crtCredentials: crtCredentials)
    }
}
