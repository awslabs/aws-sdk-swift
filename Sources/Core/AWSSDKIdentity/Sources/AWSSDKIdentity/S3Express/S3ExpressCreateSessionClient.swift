//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import protocol ClientRuntime.DefaultClientConfiguration

/// Protocol that allows a S3 client to be created & used by the S3Express identity resolver without taking
/// a direct dependency on it.
///
/// The `S3ExpressCreateSessionClient` concrete type, which conforms to this protocol,
/// is code-generated into the `AWSS3` module along with the S3 client.
public protocol S3ExpressCreateSessionClient: Sendable {

    /// Uses standard AWS credentials to obtain bucket-specific S3 Express-specific credentials
    /// from the AWS S3 `CreateSession` operation.
    /// - Parameters:
    ///   - clientConfig: The S3 client config object to be used for the `CreateSession` S3 client.
    ///   Passing any type of config object other than S3 will result in a
    ///   `S3ExpressClientError.clientConfigNotProvided` error.
    ///   - bucket: The name of the S3 directory bucket to obtain credentials for.
    /// - Returns: S3 Express-specific credentials.  Credentials are typically good for 5 minutes, and are
    /// only usable for the specified bucket.
    func createSession(
        clientConfig: DefaultClientConfiguration,
        bucket: String
    ) async throws -> S3ExpressIdentity
}
