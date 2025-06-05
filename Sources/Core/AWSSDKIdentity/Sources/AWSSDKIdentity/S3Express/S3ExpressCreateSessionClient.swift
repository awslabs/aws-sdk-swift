//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import protocol ClientRuntime.DefaultClientConfiguration

/// Protocol that allows S3Client to be used by the S3Express identity resolver without a direct dependency on it.
///
/// The `S3ExpressCreateSessionClient` type, which conforms to this protocol,
/// is code-generated along with the S3 client.
public protocol S3ExpressCreateSessionClient: Sendable {

    func createSession(
        clientConfig: DefaultClientConfiguration,
        bucket: String
    ) async throws -> S3ExpressIdentity
}
