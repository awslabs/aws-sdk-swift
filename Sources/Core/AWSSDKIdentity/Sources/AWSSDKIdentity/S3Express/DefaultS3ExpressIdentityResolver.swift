//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import enum ClientRuntime.IdentityPropertyKeys
import struct Smithy.Attributes
import struct Foundation.Date

public class DefaultS3ExpressIdentityResolver: S3ExpressIdentityResolver {

    public init() {}

    public func getIdentity(identityProperties: Attributes?) async throws -> S3ExpressIdentity {
        guard let bucket = identityProperties?.get(key: AWSIdentityPropertyKeys.bucket) else { fatalError() }
        guard let clientConfig = identityProperties?.get(key: IdentityPropertyKeys.clientConfig) else { fatalError() }
        guard let client = identityProperties?.get(key: AWSIdentityPropertyKeys.s3ExpressClient) else { fatalError() }
        return try await client.createSession(clientConfig: clientConfig, bucket: bucket)
    }
}
